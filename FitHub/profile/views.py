from django.shortcuts import render, redirect, render_to_response, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.urls import reverse
from django.db import connection, IntegrityError
from django.db.models import Count, query
from login.models import Member, Class, Staff, MemberLevel, User
from login.forms import CustomUserCreationForm
from django.contrib import messages
from django.contrib.auth import get_user_model,authenticate, login
from datetime import datetime, date, time, timedelta
from rest_framework.decorators import api_view

# display the user portal
def index(request):
    try:
        # retrieve user id from HTTP request
        user_id = request.user.id
        # retrieve the user information 
        with connection.cursor() as cursor:
            cursor.execute("SELECT m.name, m.email, m.phone_number, m.funds, m.expired_date FROM login_member m WHERE m.user_id = %s", [user_id])
            member = cursor.fetchone()
        with connection.cursor() as cursor:
            cursor.execute("SELECT c.id, c.name, c.location, c.time_day, c.time_start, c.time_end FROM login_member_classes l, login_class c WHERE l.member_id = %s AND l.class_id = c.id" , [user_id])
            classes = cursor.fetchall()
            empty = len(classes) == 0
        with connection.cursor() as cursor:
            cursor.execute("SELECT l.level_status FROM login_memberlevel l, login_member m WHERE m.user_id = %s AND m.level_id = l.level_status", [user_id])
            l = cursor.fetchone()[0]

        levels = {
            "B": "Bronze",
            "S": "Silver",
            "G": "Gold",
            "P": "Platinum",
            "D": "Diamond"
        }
        level = levels[l]

    # technically not necessary, just for the sake of coding standard
    except TypeError as e:
        ## return to welcome page
        return HttpResponseRedirect(reverse('landing:index'))

    context = {
        'member' : member,
        'classes': classes,
        'level': level,
        'empty': empty,
    }
    return render(request, 'profile/index.html', context)

# update the email of users
def UpdateEmail(request):
    user_id = request.user.id
    if request.method == 'POST':
        newemail = request.POST.get('uemail',None)
        with connection.cursor() as cursor:
            cursor.execute("UPDATE login_member SET email = %s WHERE login_member.user_id = %s", [newemail, user_id])
           
        return HttpResponseRedirect(reverse('profile:index'))

# update phone number of users 
def UpdatePhone(request):
    user_id = request.user.id
    if request.method == 'POST':
        newphone = request.POST.get('uphone',None)
        with connection.cursor() as cursor:
            cursor.execute("UPDATE login_member SET phone_number = %s WHERE login_member.user_id = %s", [newphone, user_id])
        return HttpResponseRedirect(reverse('profile:index'))

# display the information of a specific class
@api_view(['GET'])
def classInfo(request, class_id):
    # retrieve normal class information
    with connection.cursor() as cursor:
        cursor.execute("SELECT c.id, c.name, c.location, c.time_day, c.time_start, c.time_end, s.name, c.description FROM login_class c, login_staff s WHERE c.id = %s AND s.user_id = c.staff_id" , [class_id])
        class_object = cursor.fetchone()
    # retrieve the number of enrolled students of this class
    with connection.cursor() as cursor:
        cursor.execute("SELECT COUNT(DISTINCT id) FROM login_member_classes WHERE login_member_classes.class_id = %s", [class_id])
        row = cursor.fetchone()
        student_num = row[0]
    context = {
        'class': class_object,
        'number': student_num
    }
    return render(request, 'profile/class.html', context)

# display the list of all classes 
def classlist(request):
    # sort the classes in descending order of popularity among members 
    with connection.cursor() as cursor:
        cursor.execute("SELECT c.id, c.name, COUNT(DISTINCT l.id) FROM login_class c LEFT OUTER JOIN login_member_classes l ON c.id = l.class_id GROUP BY c.id, c.name ORDER BY COUNT(DISTINCT l.id) DESC")
        classlist = cursor.fetchall()
    context = {
        'classlist': classlist,
    }
    return render (request, 'profile/classlist.html', context)

# let member to register for a new class
def registerClass(request, class_id):
    user_id = request.user.id
    if request.method == 'POST':
        try:
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO login_member_classes (member_id, class_id) VALUES (%s, %s) ", [user_id, class_id])
            msg = 'ADMIN: class successfully registered'
        # in case when the student has already registered the class, print a msg on the website indicating a repetition in registration
        except IntegrityError as e:
            msg = 'ADMIN: class already registered'
        context = {
            'msg': msg,
            'back': 'go back to class list'
        }
        return render(request, 'profile/classlist.html', context)

# delete a class that is already registered 
def deleteClass(request, class_id):
    user_id = request.user.id
    if request.method == 'POST':
        try:
            with connection.cursor() as cursor:
                cursor.execute("DELETE FROM login_member_classes WHERE login_member_classes.member_id = %s AND login_member_classes.class_id = %s", [user_id, class_id])
            msg = 'ADMIN: class successfully deleted'

        except IntegrityError as e:
            msg = 'ADMIN: class already deleted'
        context = {
            'msg': msg,
            'back': 'go back to profile'
        }
        return HttpResponseRedirect(reverse('profile:index'))

# display the staff portal of a user if the user is authorized as a staff 
def staff(request):
    try:
        user_id = request.user.id
        # retrieve the staff information and list of classes taught by the staff
        with connection.cursor() as cursor1, connection.cursor() as cursor2:
            cursor1.execute("SELECT s.name FROM login_staff s WHERE s.user_id = %s", [user_id])
            cursor2.execute("SELECT c.id, c.name, c.location, c.time_day, c.time_start, c.time_end FROM login_class c WHERE c.staff_id = %s", [user_id])
            staff = cursor1.fetchall()[0]
            classes = cursor2.fetchall()
        empty = len(classes) == 0
    # inform the user to contact admin in order to become a staff
    except IndexError as e:
        context = {
            'errormsg': 'You are not a staff yet, please contact admin to register as a staff.'
        }
        return HttpResponseRedirect(reverse('profile:index'))
    context = {
        'staff' : staff,
        'classes': classes,
        'empty': empty
    }
    return render(request, 'profile/staff.html', context)

# allow the user to signup
def signup(request):
    User = get_user_model()
    if request.method=='POST':
        form = CustomUserCreationForm(request.POST)
        # given valid signup form, allow the signup 
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Account created for {username}!')
            # insert a new member entry to the table according to the given user info
            with connection.cursor() as cursor:
                cursor.execute("SELECT u.id, u.first_name, u.last_name, u.email FROM login_user u WHERE u.username = %s", [username])
                row = cursor.fetchone()
                mid  = row[0]
                mname = row[1] + ' ' + row[2]
                memail = row[3]
                expired = date(datetime.now().year, datetime.now().month, datetime.now().day) + timedelta(days=30)
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO login_member (user_id, funds, name, email, level_id, expired_date) VALUES (%s, %s, %s, %s, %s, %s)", [mid, 0, mname, memail, 'B', expired])
            return redirect('profile:login')
    
    else:
        form = CustomUserCreationForm()
    return render(request, 'signup/signup.html',{'form':form})

# confirm user info and allows user to login if applicable 
def login_view(request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    user = authenticate(request, username=username, password=password)
    if user is not None:
        login(request, user)
        context = {
            'user_id' : user.id
        }
        return HttpResponseRedirect(reverse('profile:index'))
    else:
        return render(request, 'login.html')

# render to member update page and display the membership level prices 
def memupdatepage(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT l.price from login_memberlevel l")
        price = cursor.fetchall()
    context = {
        'price': price
    }
    return render(request, 'profile/memupdate.html', context)

# update membership level, we decided not to handle the prices and make the users charged by our system by the end of the year
def memupdate(request):
    user_id = request.user.id
    levels = {
        "Bronze": "B",
        "Silver": "S",
        "Gold": "G",
        "Platinum": "P",
        "Diamond": "D",
        }
    if request.method == 'POST':
        newmem = request.POST.get('umem',None)
        level = levels[newmem]
        with connection.cursor() as cursor:
            cursor.execute("UPDATE login_member SET level_id = %s WHERE login_member.user_id = %s", [level, user_id])
        return HttpResponseRedirect(reverse('profile:index'))


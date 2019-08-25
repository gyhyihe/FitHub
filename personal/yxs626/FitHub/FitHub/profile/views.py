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

# Create your views here.

#testing directing to url
def index(request, user_id):
    try:
        # need to adjust given input
        #using raw sql
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
    except Member.DoesNotExist:
        raise Http404("no such member")
    context = {
        'member' : member,
        'classes': classes,
        'level': level,
        'empty': empty,
    }
    return render(request, 'profile/index.html', context)

@api_view(['PUT'])
def UpdateEmail(request):
    user_id = request.user.id
    if request.method == 'POST':
        mname = 'Melody'
        newemail = request.POST.get('uemail',None)
        with connection.cursor() as cursor:
            cursor.execute("UPDATE login_member SET email = %s WHERE login_member.user_id = %s", [newemail, user_id])
            #return HttpResponseRedirect(reverse('profile:index' ),{'user_id'=user_id})#args=(question.id,)))
        return HttpResponseRedirect(reverse('profile:index',args = {user_id}))

@api_view(['PUT'])
def UpdatePhone(request):
    user_id = request.user.id
    if request.method == 'POST':
        mname = 'Melody'
        newphone = request.POST.get('uphone',None)
        with connection.cursor() as cursor:
            cursor.execute("UPDATE login_member SET phone_number = %s WHERE login_member.user_id = %s", [newphone, user_id])
        return HttpResponseRedirect(reverse('profile:index',args = {user_id}) )#args=(question.id,)))

@api_view(['GET'])
def classInfo(request, class_id):
    with connection.cursor() as cursor:
        cursor.execute("SELECT c.id, c.name, c.location, c.time_day, c.time_start, c.time_end, s.name FROM login_class c, login_staff s WHERE c.id = %s AND s.user_id = c.staff_id" , [class_id])
        class_object = cursor.fetchone()
    with connection.cursor() as cursor:
        cursor.execute("SELECT COUNT(DISTINCT id) FROM login_member_classes WHERE login_member_classes.class_id = %s", [class_id])
        row = cursor.fetchone()
        student_num = row[0]
    context = {
        'class': class_object,
        'number': student_num
    }
    return render(request, 'profile/class.html', context)

def classlist(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM login_class")
        classlist = cursor.fetchall()
    context = {
        'classlist': classlist,
    }
    return render (request, 'profile/classlist.html',context)

def registerClass(request, class_id):
    user_id = request.user.id
    if request.method == 'POST':
        try:
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO login_member_classes (member_id, class_id) VALUES (%s, %s) ", [user_id, class_id])
            msg = 'ADMIN: class successfully registered'

        except IntegrityError as e:
            msg = 'ADMIN: class already registered'
        context = {
            'msg': msg,
            'back': 'go back to class list'
        }
        return render(request, 'profile/classlist.html', context)

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
        return HttpResponseRedirect(reverse('profile:index',args = {user_id}) )

def staff(request):
    try:
        # need to adjust given input
        user_id = request.user.id
        empty = False
        with connection.cursor() as cursor1, connection.cursor() as cursor2:
            cursor1.execute("SELECT s.name FROM login_staff s WHERE s.user_id = %s", [user_id])
            cursor2.execute("SELECT c.id, c.name FROM login_class c WHERE c.staff_id = %s", [user_id])
            staff = cursor1.fetchall()[0]
            classes = cursor2.fetchall()
        if (len(classes) == 0):
            empty = True
    except IndexError as e:
        raise Http404("No matching staff portal, please contact admin to become a staff.")
    context = {
        'staff' : staff,
        'classes': classes,
        'empty': empty
    }
    return render(request, 'profile/staff.html', context)

def signup(request):
    User = get_user_model()
    if request.method=='POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Account created for {username}!')
            with connection.cursor() as cursor:
                cursor.execute("SELECT u.id, u.first_name, u.last_name, u.email FROM login_user u WHERE u.username = %s", [username])
                row = cursor.fetchone()
                mid  = row[0]
                mname = row[1] + ' ' + row[2]
                memail = row[3]
                mphone = 1010101010
                expired = date(datetime.now().year, datetime.now().month, datetime.now().day) + timedelta(days=30)
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO login_member (user_id, funds, name, email, phone_number, level_id, expired_date) VALUES (%s, %s, %s, %s, %s, %s, %s)", [mid, 0, mname, memail, mphone, 'B', expired])
            return redirect('profile:login')
    #travis, insert a new member after sign up
    else:
        form = CustomUserCreationForm()
    return render(request, 'signup/signup.html',{'form':form})

def login_view(request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    user = authenticate(request, username=username, password=password)
    if user is not None:
        login(request, user)
        context = {
            'user_id' : user.id
        }
        #return redirect(reverse('profile:%d' % user.id))
        return redirect('profile:login')
        #return HttpResponseRedirect(reverse('profile/%s' % user.id))
    else:
        return render(request, 'login/login.html')

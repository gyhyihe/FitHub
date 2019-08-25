from django.shortcuts import render, render_to_response, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.urls import reverse
from django.db import connection, IntegrityError
from django.db.models import Count, query
from login.models import Member, Class, Staff, MemberLevel


# Create your views here.

#testing directing to url
def index(request):
    try:
        # need to adjust given input
        mname = 'Melody'
        #using raw sql
        with connection.cursor() as cursor:
            cursor.execute("SELECT m.name, m.email, m.phone_number, m.funds, m.expired_date FROM login_member m WHERE m.name = %s", [mname])
            member = cursor.fetchone()
        with connection.cursor() as cursor:
            cursor.execute("SELECT c.id, c.name, c.location, c.time_day, c.time_start, c.time_end FROM login_member_classes l, login_class c WHERE l.member_id = %s AND l.class_id = c.id" , [3])                                                                                                                                 
            classes = cursor.fetchall()       
        with connection.cursor() as cursor:
            cursor.execute("SELECT l.level_status FROM login_memberlevel l, login_member m WHERE m.name = %s AND m.level_id = l.level_status", [mname])
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
    }
    return render(request, 'profile/index.html', context)

# also need user id input here
def UpdateEmail(request):
    if request.method == 'POST':
        mname = 'Melody'
        newemail = request.POST.get('uemail',None)
        with connection.cursor() as cursor:
            cursor.execute("UPDATE login_member SET email = %s WHERE login_member.name = %s", [newemail, mname])
        return HttpResponseRedirect(reverse('profile:index' ))#args=(question.id,)))

# also need user id input here
def UpdatePhone(request):
    if request.method == 'POST':
        mname = 'Melody'
        newphone = request.POST.get('uphone',None)
        with connection.cursor() as cursor:
            cursor.execute("UPDATE login_member SET phone_number = %s WHERE login_member.name = %s", [newphone, mname])
        return HttpResponseRedirect(reverse('profile:index' ))#args=(question.id,)))

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
    if request.method == 'POST':
        mname = 'Melody'
        mid = 3
        try: 
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO login_member_classes (member_id, class_id) VALUES (%s, %s) ", [mid, class_id])
            msg = 'ADMIN: class successfully registered'
            
        except IntegrityError as e:
            msg = 'ADMIN: class already registered'
        context = {
            'msg': msg,
            'back': 'go back to class list'
        }
        return render(request, 'profile/classlist.html', context)
        
# implement raw sql query later on
def staff(request):
    try:
        # need to adjust given input
        staff = Staff.objects.get(name='Melody')
        classes = Class.objects.filter(staff=staff)
    except Class.DoesNotExist:
        raise Http404("no such member")
    context = {
        'staff' : staff,
        'classes': classes,
    }
    return render(request, 'profile/staff.html', context)

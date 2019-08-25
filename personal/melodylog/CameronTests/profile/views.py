from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.urls import reverse
from django.db import connection
from django.db.models import Count, query
from login.models import Member, Class, Staff, MemberLevel


# Create your views here.

#testing directing to url
def index(request):
    try:
        # need to adjust given input
        mname = 'Melody'
        #using raw sql
        member = Member.objects.raw('SELECT * FROM login_member m WHERE m.name = %s', [mname])[0]
        classes = Class.objects.raw('SELECT c.id, c.name, c.location, c.staff_id FROM login_class c, login_member m WHERE m.name = %s AND m.classes_id = c.id', [mname])
        level = MemberLevel.objects.raw('SELECT l.level_status, l.price FROM login_memberlevel l, login_member m WHERE m.name = %s AND m.level_id = l.level_status', [mname])[0]
    except Member.DoesNotExist:
        raise Http404("no such member")
    print(member)
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
        #using raw sql
        member = Member.objects.raw('SELECT * FROM login_member m WHERE m.name = %s', [mname])[0]
        newemail = request.POST.get('uemail',None)
        member.email = newemail
        member.save()
        return HttpResponseRedirect(reverse('profile:index' ))#args=(question.id,)))


def classInfo(request, class_id):
    class_object = Class.objects.raw('SELECT * FROM login_class c WHERE c.id = %s', [class_id])[0]
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
    classlist = Class.objects.raw('SELECT * FROM login_class')
    context = {
        'classlist': classlist,
    }
    return render (request, 'profile/classlist.html',context)

def registerClass(request, class_id):
    if request.method == 'POST':
        mname = 'Melody'
        #using raw sql
        member = Member.objects.raw('SELECT * FROM login_member m WHERE m.name = %s', [mname])[0]
        class_object = Class.objects.raw('SELECT * FROM login_class c WHERE c.id = %s', [class_id])[0]
        #newentry = Member(user = member.user, classes = class_object, level=member.level, funds=member.funds, expired_date = member.expired_date, name = member.name, email = member.email, phone_regex=member.phone_regex, phone_number = member.phone_number)
        #newentry.save()
        classlist = Class.objects.raw('SELECT c.id, c.name, c.location, c.staff_id FROM login_class c, login_member m WHERE m.name = %s AND m.classes_id = c.id', [mname])
        member.classes.update(classlist.union(class_object))
        member.save()
        return HttpResponseRedirect(reverse('profile:classlist.html' ))#args=(question.id,)))


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

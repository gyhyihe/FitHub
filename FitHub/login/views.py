from django.shortcuts import render, redirect
from django.contrib.auth import login
from django.views.generic import CreateView

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


from django.contrib.auth import get_user_model

User = get_user_model()

# Create your views here.


def login_view(request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    user = authenticate(request, username=username, password=password)
    
    if user is not None:
        login(request, user)
        return HttpResponseRedirect(reverse('profile:index'))

    else:
        return render(request, 'login.html')

from django.shortcuts import render, redirect
from django.contrib.auth import login
from django.views.generic import CreateView


from django.contrib.auth import get_user_model

User = get_user_model()

# Create your views here.

#class StudentSingUpView(CreateView):

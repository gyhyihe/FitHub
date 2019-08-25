"""CameronTests URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.urls import path, include
from django.conf.urls import url
from rest_framework_swagger.views import get_swagger_view

from login import views

schema_view = get_swagger_view(title='Pastebin API')


urlpatterns = [
    path('profile/',include('profile.urls')),
    path('polls/', include('polls.urls')),
    path('admin/', admin.site.urls),
    url(r'^api/$', schema_view),
    url(r'^accounts/$', include('django.contrib.auth.urls')),
    url(r'^accounts/signup/$', views.SignUpView.as_view(), name='singup'),
    path('accounts/signup/student', views.StudentSignUpView.as_view(), name='student_signup'),
    path('accounts/signup/teacher', views.TeacherSignUpView.as_view(), name='teacher_signup'),
    path('login/', include('login.urls')),


]

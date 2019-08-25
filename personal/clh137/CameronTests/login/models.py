from django.contrib.auth.models import AbstractUser
from django.db import models
from django.core.validators import RegexValidator


class User(AbstractUser):
    is_student = models.BooleanField(default=False)
    is_teacher = models.BooleanField(default=False)

class Teacher(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key = True)
    name = models.CharField(max_length = 100)

class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key = True)
    name = models.CharField(max_length=100)
    
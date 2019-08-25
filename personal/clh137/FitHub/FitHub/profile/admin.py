from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin
# Register your models here.
from login.forms import CustomUserCreationForm, CustomUserChangeForm
from login.models import Member, Staff, Class, MemberLevel, User


class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm


admin.site.register(Staff)
admin.site.register(Class)
admin.site.register(MemberLevel)
admin.site.register(Member)
admin.site.register(User, CustomUserAdmin)

from django.contrib import admin

# Register your models here.

from login.models import Member, Staff, Class, MemberLevel, User

admin.site.register(Member)
admin.site.register(Staff)
admin.site.register(Class)
admin.site.register(User)
admin.site.register(MemberLevel)
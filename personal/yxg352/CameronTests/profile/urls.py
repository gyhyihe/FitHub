from django.urls import path

from . import views

app_name = 'profile'

urlpatterns = [
    # "/polls" is the prefix
    path('', views.index, name='index'),
    path('index', views.index, name='index'),
    path('<int:class_id>/class/', views.classInfo, name='class'),
    path('classlist', views.classlist, name='classlist'),
    path('staff', views.staff, name='staff'),
    path('UpdateEmail',views.UpdateEmail, name='UpdateEmail'),
    path('UpdatePhone',views.UpdatePhone, name='UpdatePhone'),
    path('<int:class_id>/registerClass',views.registerClass, name='registerClass'),
]

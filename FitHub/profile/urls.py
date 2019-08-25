from django.urls import path
from django.conf.urls import url
from django.contrib.auth import views as auth_views
from . import views

app_name = 'profile'

urlpatterns = [
    path('', views.index, name='index'),
    path('<int:user_id>', views.index, name='index'),
    path('login', views.login_view, name='login'),
    path('logout', auth_views.LogoutView.as_view(template_name='welcome.html'), name='logout'),
    path('index', views.index, name='index'),
    path('<int:class_id>/class/', views.classInfo, name='class'),
    path('classlist', views.classlist, name='classlist'),
    path('staff', views.staff, name='staff'),
    path('UpdateEmail',views.UpdateEmail, name='UpdateEmail'),
    path('UpdatePhone',views.UpdatePhone, name='UpdatePhone'),
    path('<int:class_id>/registerClass',views.registerClass, name='registerClass'),
    path('<int:class_id>/deleteClass',views.deleteClass, name='deleteClass'),
    path('signup', views.signup, name='signup'),
    path('memupdate', views.memupdate, name='memupdate'),
    path('memupdatepage', views.memupdatepage, name='memupdatepage')
]

from django.urls import include, path
from login import views

app_name = 'login'
urlpatterns = [
    path('', views.login_view, name='login'),
    ]
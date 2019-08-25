from django.urls import include, path
from django.contrib.auth import views as auth_views

from . import views

urlpatterns = [
    path('student/', include(([
        path('', views.StudentSuccess, name='success'),
    ], 'classroom'), namespace='students' )),

    path('teacher/', include(([
        path('', views.TeacherSuccess, name='success'),
    ], 'classroom'), namespace='teachers'))
]

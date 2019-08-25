from django.urls import include, path

from . import views

urlpatterns = [
    path('student/', include(([
        path('', views.StudentSuccess, name='success'),
    ], 'classroom'), namespace='students' )),

    path('teacher/', include(([
        path('', views.TeacherSuccess, name='success'),
    ], 'classroom'), namespace='teachers'))
]



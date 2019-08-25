from django.urls import path

from . import views

app_name = 'polls'

urlpatterns = [
    # "/polls" is the prefix
    path('', views.index, name='index'),

    # Use in the form /polls/#(/....)
    path('<int:question_id>/', views.detail, name='detail'),
    path('<int:question_id>/result/', views.result, name='result'),
    path('<int:question_id>/vote/', views.vote, name='vote'),
]

from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='wine-home'),
    path('add_bottle', views.add_bottle, name='wine_add_bottle'),
]

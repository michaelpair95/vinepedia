from django.db import models
from django.forms import ModelForm

class bottle(models.Model):
    name= models.CharField(max_length=30)
    winery = models.CharField(max_length=30)
    year = models.IntegerField()
    wine_type = models.CharField(max_length=30)

class BottleForm(ModelForm):
    class Meta:
        model = bottle
        fields = ['name', 'winery', 'year', 'wine_type']


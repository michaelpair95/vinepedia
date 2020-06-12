from django.shortcuts import render
from .models import bottle
from django.forms import modelformset_factory

def home(request):
    return render(request, 'addwine/home.html', {'title':'Vinepedia'})

def add_bottle(request):
    BottleFormSet = modelformset_factory(bottle, fields=('name', 'winery', 'year', 'wine_type'))
    if request.method == 'POST':
        formset = BottleFormSet(request.POST, request.FILES)
        if formset.is_valid():
            formset.save()
            # do something.
    else:
        formset = BottleFormSet()
    return render(request, 'addwine/add_bottle.html',{'formset': formset})
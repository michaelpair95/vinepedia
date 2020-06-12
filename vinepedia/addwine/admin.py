from django.contrib import admin
from .models import bottle

# Register your models here.
class BottleAdmin(admin.ModelAdmin):
    pass
admin.site.register(bottle, BottleAdmin)
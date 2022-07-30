from django.db import models
from asyncio.windows_events import NULL
from distutils.command.upload import upload
import email
from operator import mod
from statistics import mode
from django.forms import CharField, ImageField
# Create your models here.

class PoliceAddWantedModel(models.Model):
    user_id=models.AutoField(primary_key=True)
    name=models.CharField(max_length=100)
    features=models.CharField(max_length=100)
    image=models.ImageField(upload_to='images/',null=True)
    status=models.CharField(max_length=100,default='wanted')

    class Meta:
        db_table="police_add_wanted"


class PoliceAddMissingModels(models.Model):
    user_id=models.AutoField(primary_key=True)
    name=models.CharField(max_length=100)
    features=models.CharField(max_length=100)
    image=models.ImageField(upload_to="images/",null=True)
    status=models.CharField(max_length=100,default='missing')


    class Meta:
        db_table="police_add_missing"




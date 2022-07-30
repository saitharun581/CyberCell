from django.db import models
from distutils.command.upload import upload
import email
from operator import mod
from statistics import mode
from django.forms import CharField, ImageField
# Create your models here.

class AdminAddPoliceModel(models.Model):
    user_id=models.AutoField(primary_key=True)
    name=models.CharField(max_length=100)
    area=models.CharField(max_length=100)
    email=models.CharField(max_length=100,null=True)
    password=models.CharField(max_length=100,null=True)
    image=models.ImageField(upload_to="images/",null=True)

    class Meta:
        db_table="add_police"

class AdminAddInformerModel(models.Model):
    user_id=models.AutoField(primary_key=True)
    name=models.CharField(max_length=100)
    area=models.CharField(max_length=100)
    email=models.CharField(max_length=100,null=True)
    password=models.CharField(max_length=100,null=True)

    image=models.ImageField(upload_to="images/",null=True)

    class Meta:
        db_table="add_informer"
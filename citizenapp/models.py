from django.db import models
from distutils.command.upload import upload
import email
from operator import mod, truediv
from statistics import mode
from django.forms import CharField, ImageField


# Create your models here.
class CitizenRegisterModel(models.Model):
    user_id=models.AutoField(primary_key=True)
    first_name=models.CharField(max_length=100)
    last_name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    password=models.CharField(max_length=100)

    class Meta:
        db_table="citizen_details"

    def __str__(self):
        return self.first_name + ' ' + self.last_name

class CitizenRegisterComplaintModel(models.Model):
    complaint_id = models.AutoField(primary_key=True)
    user_id=models.IntegerField(null=True,blank=True)
    name=models.CharField(max_length=100)
    mobile=models.BigIntegerField(null=True,blank=True)
    address=models.CharField(max_length=400)
    category=models.CharField(max_length=100)
    email=models.CharField(max_length=100,null=True,blank=True)
    description=models.TextField(null=True)
    status_category=models.CharField(default='pending', max_length=100,null=True)
    status_category_2=models.CharField(max_length=100,null=True)
    
    class Meta:
        db_table="citizen_complaints"


    

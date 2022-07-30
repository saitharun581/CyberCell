from django.db import models
from distutils.command.upload import upload
import email
from operator import mod
from statistics import mode
from django.forms import CharField, ImageField

# Create your models here.
class InformerAddInfoModel(models.Model):
    user_id=models.AutoField(primary_key=True)
    name=models.CharField(max_length=100)
    area=models.CharField(max_length=100)
    desc=models.TextField(null=True)
    
    class Meta:
        db_table="informer_add_info"


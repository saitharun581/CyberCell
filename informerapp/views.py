
from adminapp.models import AdminAddInformerModel
from citizenapp.models import  CitizenRegisterModel,CitizenRegisterComplaintModel
from informerapp.models import InformerAddInfoModel
import email
from unicodedata import category
from urllib.request import Request
from django.shortcuts import redirect, render
from django.contrib import messages

from policeapp.models import PoliceAddMissingModels, PoliceAddWantedModel

# Create your views here.

def informer_login(request):
    if request.method == "POST":
        Email=request.POST.get("email")
        Password=request.POST.get("password")
        try:
            check=AdminAddInformerModel.objects.get(email=Email,password=Password)
            request.session["user_id"]=check.user_id
            messages.success(request,"succesfully login")
            return redirect('informer-home')
        except:
            messages.error(request,"invalid login")
    
    return render(request,'informer-login.html')

def informer_home(request):
    d=PoliceAddMissingModels.objects.filter(status="missing").last()
    e=PoliceAddWantedModel.objects.filter(status="wanted").last()
    return render(request,'informer-home.html',{'d':d,'e':e})

def informer_add_info(request):
    if request.method == "POST":
        name=request.POST.get("name")
        area=request.POST.get("addr")
        desc=request.POST.get("desc")
        InformerAddInfoModel.objects.create(name=name,area=area,desc=desc)
    return render(request,'informer-add-info.html')

def informer_my_info(request):
    f=request.session["user_id"]
    f1=AdminAddInformerModel.objects.filter(user_id=f)
    return render(request,'informer-myinfo.html',{'f1':f1})


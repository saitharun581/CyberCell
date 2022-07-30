from citizenapp.models import  CitizenRegisterModel,CitizenRegisterComplaintModel
from policeapp.models import PoliceAddMissingModels,PoliceAddWantedModel
import email
from unicodedata import category
from urllib.request import Request
from django.shortcuts import get_object_or_404, redirect, render
from django.contrib import messages 
import re

# Create your views here.
def citizen_login(request):
    if request.method == "POST":
        print("valid")
        Email=request.POST.get("email")
        Password=request.POST.get("password")

        try:
            check=CitizenRegisterModel.objects.get(email=Email, password=Password)
            request.session["user_id"]=check.user_id
            messages.success(request,"successfully login")
           

            return redirect('citizen-home')
        except:
            
            messages.error(request,"invalid login")
            
    return render(request,'citizen-login.html') 

def citizen_register(request):
    if request.method == "POST":
        Fname=request.POST.get("fname")
        Lname=request.POST.get("lname")
        Email=request.POST.get("email")
        Password=request.POST.get("password")
        
        
        if  CitizenRegisterModel.objects.filter(email=Email).exists():
            
        
            messages.error(request,'Email Already Exists....')
        else:
            user=CitizenRegisterModel.objects.create(first_name=Fname,last_name=Lname,email=Email,password=Password)
            # user.save()
            messages.success(request, "registered successfully")
        
        
    return render(request,'citizen-register.html') 

def citizen_home(request):
    g1=PoliceAddWantedModel.objects.filter(status="wanted").last()
    h1=PoliceAddMissingModels.objects.filter(status="missing").last()
    
    return render(request,'citizen-home.html',{'h1':h1,'g1':g1}) 

def citizen_register_complaint(request):
    user_id=request.session["user_id"]
    if request.method=="POST":        
        name=request.POST.get("name")
        mobile=request.POST.get("mobile")
        email=request.POST.get("email")
        address=request.POST.get("address")
        category=request.POST.get("category")
        description=request.POST.get("description")
        CitizenRegisterComplaintModel.objects.create(user_id=user_id,name=name, mobile=mobile, email=email,address=address,category =category,description =description)

    return render(request,'citizen-register-complaints.html') 

def citizen_view_complaint(request):
    g=request.session["user_id"]
    k=CitizenRegisterComplaintModel.objects.filter(user_id=g)
    
    return render(request,'citizen-view-complaint.html',{'k':k}) 

def citizen_view_wanted(request):

    g1=PoliceAddWantedModel.objects.filter(status="wanted")

    return render(request,'citizen-view-wanted.html',{'g1':g1}) 

def citizen_view_missing(request):

    h1=PoliceAddMissingModels.objects.filter(status="missing")

    return render(request,'citizen-view-missing.html',{'h1':h1}) 

def citizen_profile(request):
    user_id=request.session["user_id"]
    e2=CitizenRegisterModel.objects.filter(user_id=user_id)     
    if request.method=="POST":
        obj = get_object_or_404(CitizenRegisterModel,user_id=user_id)
        obj.first_name=request.POST.get("fname") 
        obj.last_name=request.POST.get("lname") 
        obj.email=request.POST.get("email") 
        obj.password=request.POST.get("password")     
        
        obj.save()
   
    
    return render(request,'citizen-profile.html',{'e2':e2})                         

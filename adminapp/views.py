from turtle import up
from django.shortcuts import get_object_or_404, redirect, render 
from adminapp.models import  AdminAddPoliceModel,AdminAddInformerModel
from policeapp.models import PoliceAddWantedModel,PoliceAddMissingModels
from citizenapp.models import CitizenRegisterComplaintModel
from informerapp.models import InformerAddInfoModel
import email
from unicodedata import category
from urllib.request import Request
from django.core.files import File
from django.contrib import messages

# Create your views here.
def admin_login(request):
    if request.method=="POST":
        email=request.POST.get("email")
        password=request.POST.get("password")

        if email == "admin@gmail.com" and password == "admin":
            messages.success(request,"login successfully")
            return redirect("admin-home")
        else:
            messages.error(request,"invalid login")
    return render(request,'admin-login.html')

def admin_home(request):
    c1=AdminAddPoliceModel.objects.count()
    c2=AdminAddInformerModel.objects.count()
    c3=PoliceAddWantedModel.objects.count()
    c4=PoliceAddMissingModels.objects.count()
    c5=CitizenRegisterComplaintModel.objects.last()
    c6=CitizenRegisterComplaintModel.objects.count()
    c7=PoliceAddWantedModel.objects.filter(status="wanted").last()
    c8=PoliceAddMissingModels.objects.filter(status="missing").last()
    d1=CitizenRegisterComplaintModel.objects.filter(status_category="Received").count()
    d2=CitizenRegisterComplaintModel.objects.filter(status_category='Verified').count()
    d3=CitizenRegisterComplaintModel.objects.filter(status_category='Completed').count()
    

    return render(request,'admin-home.html',{'c1':c1,'c2':c2,'c3':c3,'c4':c4,'c5':c5,'c6':c6,'c7':c7,'c8':c8,'d1':d1,'d2':d2,'d3':d3})
    # return render(request,'admin-home.html')





def admin_add_police(request):
    if request.method=="POST" and request.FILES['image']:
        name=request.POST.get("name")
        area=request.POST.get("area")
        image=request.FILES["image"]
        email=request.POST.get("email")
        password=request.POST.get("password")
        AdminAddPoliceModel.objects.create(name=name,area=area,image=image,email=email,password=password)


    
    return render(request,'admin-add-police.html')

def admin_view_police(request):
    b1=AdminAddPoliceModel.objects.all()
    return render(request,'admin-view-police.html',{'b1':b1})

def admin_edit_police(request,id):
    
    
    d3=AdminAddPoliceModel.objects.filter(user_id=id)
    if request.method=="POST":
        obj=get_object_or_404(AdminAddPoliceModel,user_id=id)
        area=request.POST.get("area")
        obj.area=area
        obj.save(update_fields=['area'])
        obj.save()
    
    return render(request,'admin-edit-police.html',{'d3':d3})

def admin_add_informer(request):
    if request.method=='POST'and request.FILES['image']:
        name=request.POST.get("name")
        area=request.POST.get("area")
        image=request.FILES["image"]
        email=request.POST.get("email")
        password=request.POST.get("password")

        AdminAddInformerModel.objects.create(name=name,area=area,image=image, email=email,password=password)

    return render(request,'admin-add-informer.html')

def admin_view_informer(request):
    b2=AdminAddInformerModel.objects.all()
    return render(request,'admin-view-informer.html',{'b2':b2})

def admin_edit_informer(request,id):
     c2=AdminAddInformerModel.objects.filter(user_id=id) 
     if request.method=="POST":
         print('post')
         obj=get_object_or_404(AdminAddInformerModel,user_id=id)
        # obj.name=request.POST.get("name")
         area=request.POST.get("area")
         print(area)
         obj.area=area
         obj.save(update_fields=['area'])
        
        # if request.FILES["image"]:
        #     obj.image=request.FILES["image"]
        
         obj.save()
    
     return render(request,'admin-edit-informer.html',{'c2':c2})

def admin_view_complaints(request):
    b3=CitizenRegisterComplaintModel.objects.all()
    return render(request,'admin-view-complaint.html',{'b3':b3})

def admin_view_information(request):
    b7=InformerAddInfoModel.objects.all()
    return render(request,'admin-view-information.html',{'b7':b7}) 

def admin_view_missing_persons(request):
    b4=PoliceAddMissingModels.objects.all()
    return render(request,'admin-view-missing-persons.html',{'b4':b4})

def admin_view_wanted(request):
    b5=PoliceAddWantedModel.objects.all()
    return render(request,'admin-view-wanted.html',{'b5':b5})               
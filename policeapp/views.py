from gc import get_objects
from urllib import request
from django.shortcuts import get_object_or_404, redirect, render
from adminapp.models import AdminAddInformerModel, AdminAddPoliceModel
from policeapp.models import PoliceAddWantedModel,PoliceAddMissingModels
from citizenapp.models import CitizenRegisterComplaintModel
from informerapp.models import InformerAddInfoModel 
import email
from unicodedata import category
from urllib.request import Request
from django.core.files import File
from django.core.mail import EmailMultiAlternatives
from cybercell.settings import DEFAULT_FROM_EMAIL
import requests
import random

from django.contrib import messages



# Create your views here.

def police_login(request):
    if request.method=="POST":
        Email=request.POST.get("email")
        Password=request.POST.get("password")
        
        try:
            check=AdminAddPoliceModel.objects.get(email=Email,password=Password)
            request.session["user_id"]=check.user_id
            messages.success(request,"successfully login")
            
            return redirect('police-home')
        except:
            messages.error(request,"invalid login")
            
           
    return render(request,'police-login.html')

def police_home(request):
    d1=CitizenRegisterComplaintModel.objects.count()
    d2=PoliceAddMissingModels.objects.last()
    d3=PoliceAddWantedModel.objects.last()
    b1=CitizenRegisterComplaintModel.objects.filter(status_category="Received").count()
    b2=CitizenRegisterComplaintModel.objects.filter(status_category='Verified').count()
    b3=CitizenRegisterComplaintModel.objects.filter(status_category='Completed').count()
    return render(request,'police-home.html',{'d1':d1,'d2':d2,'d3':d3,'b1':b1,'b2':b2,'b3':b3})

def police_view_complaints(request):

    e1=CitizenRegisterComplaintModel.objects.all()

    return render(request,'police-view-complaints.html',{'e1':e1})

def police_edit_complaints(request,id):
    e2=CitizenRegisterComplaintModel.objects.filter(complaint_id=id)     
    if request.method=="POST":
        obj = get_object_or_404(CitizenRegisterComplaintModel,complaint_id=id)
        obj.status_category=request.POST.get("category")     
        
        obj.save()                
        
        #email code
        html_content='<br> <p> Your Complaint Regarding <strong>'+str(obj.category)+'</strong> is <strong>'+str(obj.status_category)+' </p>'
        from_mail=DEFAULT_FROM_EMAIL
        to_mail=[obj.email]
        msg= EmailMultiAlternatives("Complaint Status",html_content,from_mail,to_mail)
        msg.attach_alternative(html_content,"text/html")
        try:
            msg.send()
        except Exception as e:
            print('error:',e)
            return redirect("/")
    return render(request,'police-edit-complaint.html',{'e2':e2})

# def update_complaints(request,id):
#      obj=get_object_or_404(CitizenRegisterComplaintModel,complaint_id=id)
#      if request.method=="POST":
#         status_category=request.POST.get("category")
#         obj.status_category=status_category
        
#         obj.save()
    
#      return redirect('police-edit-complaints')
    
    

# def close_complaints(request,id):
#     e1=CitizenRegisterComplaintModel.objects.filter(user_id=id)
#    obj = get_object_or_404(CitizenRegisterComplaintModel,complaint_id=id)
#    if request.method=='POST':
#        obj.status_category = "DATA"
#        obj.save(update_fields=['status_category'])
#        obj.save()


#     if request.method=="POST":
#         status_category=request.POST.get('complaint-status')

#        CitizenRegisterComplaintModel.objects.create(status_category=status_category)
#    return redirect("police-edit-complaints")


def police_add_wanted(request):
    if request.method=="POST" and request.FILES['image']:
        name=request.POST.get("name")
        features=request.POST.get("features")
        image=request.FILES["image"]

        PoliceAddWantedModel.objects.create(name=name,features=features,image=image)


    return render(request,'police-add-wanted.html')

def police_view_wanted(request):

    a1=PoliceAddWantedModel.objects.all()
    return render(request,'police-view-wanted.html',{'a1':a1})

def police_edit_wanted(request):
    
    b1=PoliceAddWantedModel.objects.all()
    
    return render(request,'police-edit-wanted.html',{'b1':b1})

def update_wanted(request,id):
        PoliceAddWantedModel.objects.filter(user_id=id)
        obje=get_object_or_404(PoliceAddWantedModel,user_id=id)
        obje.status='found'
        obje.save(update_fields=['status'])
        obje.save()
    
        return redirect('police-edit-wanted')

def update_missing(request,id):
        PoliceAddWantedModel.objects.filter(user_id=id)
        obje=get_object_or_404(PoliceAddMissingModels,user_id=id)
        obje.status='found'
        obje.save(update_fields=['status'])
        obje.save()
    
        return redirect('police-edit-missing')

def police_add_missing(request):
    if request.method=="POST" and request.FILES['image']:
        name=request.POST.get("name")
        features=request.POST.get("features")
        image=request.FILES["image"]

        PoliceAddMissingModels.objects.create(name=name,features=features,image=image)
    return render(request,'police-add-missing.html')

def police_view_missing(request):
    b1=PoliceAddMissingModels.objects.all()
    return render(request,'police-view-missing.html',{'b1': b1})

def police_edit_missing(request):
    
    c1=PoliceAddMissingModels.objects.all()
    
    return render(request,'police-edit-missing.html',{'c1':c1})   

def police_view_informer(request):
    f1=AdminAddInformerModel.objects.all()
    return render(request,'police-view-informer.html',{'f1':f1})        

def police_view_information(request):
    g1=InformerAddInfoModel.objects.all()
    return render(request,'police-view-information.html',{'g1':g1})   

def police_view_sms(request):
    if request.method == 'POST':
        otp=random.randint(1111,9999)
        mobile=request.POST.get("mobile")
        url = "https://www.fast2sms.com/dev/bulkV2"
       
        my_data = {
            
        'sender_id': 'FSTSMS',            
        
        'message': 'your accout has credited with 5000/ rs'+'  '+str(otp),            
        'language': 'english',
        'route': 'p',            
           
        'numbers': mobile   
        }
        
        headers = {
        'authorization': '9boxGSOhjiREs3zKQHq7yuD0rFwmdX6PCYpalAB4tL8NV5T2cIwxKYZf6V7oOnW54bTJNaPqlrGAHXcB',
        'Content-Type': "application/x-www-form-urlencoded",
        'Cache-Control': "no-cache"
        }
       
        response = requests.request("POST",
                                    url,
                                    data = my_data,
                                    headers = headers)
       
        print(response.text)        

    return render(request,'police-sms.html')

from django.shortcuts import render

from adminapp.models import AdminAddInformerModel, AdminAddPoliceModel
from citizenapp.models import CitizenRegisterModel

# Create your views here.

def main_home(request):
    # a=AdminAddPoliceModel.objects.count()
    # b=AdminAddInformerModel.objects.count()
    # c=CitizenRegisterModel.objects.count()
    # return render(request,'index.html',{'a':a,'b':b,'c':c})
    return render(request,'index.html')

def main_aboutus(request):
    a=AdminAddPoliceModel.objects.all()
    return render(request,'about-us.html',{'a':a})

def main_contactus(request):
    return render(request,'contactus.html')



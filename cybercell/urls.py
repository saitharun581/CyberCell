"""cybercell URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path 
from adminapp import views as admin_views
from citizenapp import views as citizen_views
from mainapp import views as main_views
from policeapp import views as police_views
from informerapp import views as informer_views

from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),

    #main
    path('',main_views.main_home, name='home'),
    path('About-Us',main_views.main_aboutus, name='about-us'),
    path('Contact-Us',main_views.main_contactus, name='contact-us'),

    #admin
    path('admin-login',admin_views.admin_login,name='admin-login'),
    path('admin-home',admin_views.admin_home,name='admin-home'),
    path('admin-add-police',admin_views.admin_add_police,name='admin-add-police'),
    path('admin-view-police',admin_views.admin_view_police,name='admin-view-police'),
    path('admin-edit-police/<int:id>/',admin_views.admin_edit_police,name='admin-edit-police'),
    path('admin-add-informer',admin_views.admin_add_informer,name='admin-add-informer'),
    path('admin-view-informer',admin_views.admin_view_informer,name='admin-view-informer'),
    path('admin-edit-informer/<int:id>/',admin_views.admin_edit_informer,name='admin-edit-informer'),
    path('admin-view-complaints',admin_views.admin_view_complaints,name='admin-view-complaints'),
    path('admin-view-information',admin_views.admin_view_information,name='admin-view-information'),
    path('admin-view-missing-persons',admin_views.admin_view_missing_persons,name='admin-view-missing-persons'),
    path('admin-view-wanted',admin_views.admin_view_wanted,name='admin-view-wanted'),
     path('admin-view-wanted',admin_views.admin_view_wanted,name='admin-view-wanted'),
    

    #informer
    path('informer-login',informer_views.informer_login,name='informer-login'),
    path('informer-home',informer_views.informer_home,name='informer-home'),
    path('informer-add-info',informer_views.informer_add_info,name='informer-add-info'),
    path('informer-my-info',informer_views.informer_my_info,name='informer-Myinfo'),

    #police
    path('police-login',police_views.police_login,name='police-login'),
    path('police-home',police_views.police_home,name='police-home'),
    path('police-view-complaints',police_views.police_view_complaints,name='police-view-complaints'),
    path('police-edit-complaints/<int:id>/',police_views.police_edit_complaints,name='police-edit-complaints'),
    # path('police-update-complaints/<int:id>/',police_views.update_complaints,name='police-update-complaints'),
    # path('close_complaints/<int:id>/',police_views.close_complaints,name='close_complaints'),

    path('police-add-wanted',police_views.police_add_wanted,name='police-add-wanted'), 
    path('police-view-wanted',police_views.police_view_wanted,name='police-view-wanted'),
    path('police-edit-wanted',police_views.police_edit_wanted,name='police-edit-wanted'),
    path('police-add-missing',police_views.police_add_missing,name='police-add-missing'),
    path('police-view-missing',police_views.police_view_missing,name='police-view-missing'),
    path('police-edit-missing',police_views.police_edit_missing,name='police-edit-missing'),
    path('police-view-informer',police_views.police_view_informer,name='police-view-informer'),
    path('police-view-information',police_views.police_view_information,name='police-view-information'),
    path('police-update-wanted/<int:id>/',police_views.update_wanted,name='police-update-wanted'),
    path('police-update-missing/<int:id>/',police_views.update_missing,name='police-update-missing'),
    path('police-sms',police_views.police_view_sms,name='police-sms'),
    #citizen
    path('citizen-login',citizen_views.citizen_login,name='citizen-login'),
    path('citizen-register',citizen_views.citizen_register,name='citizen-register'),
    path('citizen-home',citizen_views.citizen_home,name='citizen-home'),
    path('citizen-register-complaint',citizen_views.citizen_register_complaint,name='citizen-register-complaint'),
    path('citizen-view-complaint',citizen_views.citizen_view_complaint,name='citizen-view-complaint'),
    path('citizen-view-wanted',citizen_views.citizen_view_wanted,name='citizen-view-wanted'),
    path('citizen-view-missing',citizen_views.citizen_view_missing,name='citizen-view-missing'),
    path('citizen-profile',citizen_views.citizen_profile,name='citizen-profile'),


]


urlpatterns+= static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
from django.contrib import admin
from django.urls import path, include
from about_app import views as views_about
from skill_app import views as views_skills
from project_app import views as views_projects
from contact_app import views as views_contact


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('home_app.urls')),
    path('about/', views_about.about, name='about'),
    path('skill/', views_skills.skill, name='skill'),
    path('project/', views_projects.project, name='project'),
    path('contact/', views_contact.contact, name='contact'),
]
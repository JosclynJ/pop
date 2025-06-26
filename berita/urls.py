# berita/urls.py
from django.urls import path
from berita.views import *

urlpatterns = [
    path('berita-list', berita_list, name='berita_list'),
    path('berita/tambah/', tambah_atau_edit_berita, name='tambah_berita'),
    path('berita/edit/<int:berita_id>/', tambah_atau_edit_berita, name='edit_berita'),
]
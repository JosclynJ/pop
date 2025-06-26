# berita/urls.py
from django.urls import path
from berita.views import *

urlpatterns = [
    path('berita-list', berita_list, name='berita_list'),
    path('berita/tambah', tambah_atau_edit_berita, name='tambah_berita'),
    path('berita/edit/<int:berita_id>', tambah_atau_edit_berita, name='edit_berita'),
    path('berita/hapus/<int:berita_id>', hapus_berita, name='hapus_berita'),
    path('user-list', user_list, name='user_list'),
    path('user/edit/<int:user_id>', edit_user, name='edit_user'),
    path('user/hapus/<int:user_id>', hapus_user, name='hapus_user'),
]
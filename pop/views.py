from django.shortcuts import render
from django.contrib.auth.models import User 
from berita.models import *

def dashboard(request):
    template_name = "dashboard/index.html"
    jumlah_user = User.objects.count()
    jumlah_berita = Berita.objects.count()
    context = {
        'jumlah_user':jumlah_user,
        'jumlah_berita':jumlah_berita
    }
    return render(request, template_name, context)

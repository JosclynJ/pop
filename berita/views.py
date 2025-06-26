from django.shortcuts import render, get_object_or_404, redirect
from .models import *
from .forms import *
import os
from django.conf import settings
from django.contrib.auth.models import User, Group

# Create your views here.
def berita_list(request):
    template_name = 'dashboard/berita_list.html'
    berita = Berita.objects.all()
    context = {
        "berita": berita
    }
    return render(request, template_name, context)

def tambah_atau_edit_berita(request, berita_id=None):
    template_name = 'dashboard/berita_forms.html'
    if berita_id:
        berita = get_object_or_404(Berita, id=berita_id)  # Mengambil berita berdasarkan ID
    else:
        berita = None  # Jika tidak ada ID, berarti ini adalah form tambah baru

    if request.method == 'POST':
        form = BeritaForm(request.POST, request.FILES, instance=berita)
        if form.is_valid():
            berita = form.save(commit=False)
            berita.created_by = request.user  # Mengatur created_by sesuai user yang sedang login
            berita.save()  # Simpan objek berita
            return redirect('berita_list')  # Redirect ke daftar berita setelah berhasil simpan
    else:
        form = BeritaForm(instance=berita)  # Menampilkan form dengan data yang ada (untuk edit)

    context = {
        'form': form, 
        'berita': berita
    }
    return render(request, template_name, context)

def hapus_berita(request, berita_id):
    # Mendapatkan objek berita berdasarkan ID
    berita = get_object_or_404(Berita, id=berita_id)
    # Mengecek apakah berita memiliki gambar dan menghapusnya
    if berita.gambar:
        # Mendapatkan path file gambar
        gambar_path = os.path.join(settings.MEDIA_ROOT, str(berita.gambar))
        
        # Menghapus file gambar jika ada
        if os.path.exists(gambar_path):
            os.remove(gambar_path)
    
    # Menghapus berita
    berita.delete()
    
    # Redirect ke daftar berita setelah penghapusan
    return redirect('berita_list')

# Menampilkan daftar user
def user_list(request):
    template_name = 'dashboard/user_list.html'
    users = User.objects.all()
    context = {
        "users": users
    }
    return render(request, template_name, context)

# Menambah atau mengedit user
def edit_user(request, user_id=None):
    template_name = 'dashboard/user_form.html'
    user = get_object_or_404(User, id=user_id)
    if request.method == 'POST':
        form = UserForm(request.POST, instance=user)
        if form.is_valid():
            form.save()  # Simpan perubahan user
            return redirect('user_list')  # Redirect ke daftar user setelah berhasil edit
    else:
        form = UserForm(instance=user)

    context = {
        'form': form, 
        'user': user
    }
    return render(request, template_name, context)

# Menghapus user
def hapus_user(request, user_id):
    # Mendapatkan objek user berdasarkan ID
    user = get_object_or_404(User, id=user_id)
    
    # Menghapus user
    user.delete()
    
    # Redirect ke daftar user setelah penghapusan
    return redirect('user_list')
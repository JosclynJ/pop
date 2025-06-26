from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
from django.contrib import messages
from .forms import UserForm

def login(request):
    template_name = "index.html"
    pesan = ""
    
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        if not username or not password:
            messages.error(request, "Username atau Password Wajib Diisi!")
        else:
            user = authenticate(username=username, password=password)
            if user:
                auth_login(request, user)
                return redirect('/dashboard')
            else:
                messages.error(request, "Username atau Password Salah!")
                
        
    context = {
        "pesan": pesan
    }
    return render(request, template_name, context)

def logout(request):
    auth_logout(request)
    return redirect('/')

def register(request):
    template_name = 'register.html'
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            # Dapatkan password yang dimasukkan
            password = form.cleaned_data.get('password')
            # Simpan user baru
            user = form.save(commit=False)
            user.set_password(password)  # Password akan di-hashing secara otomatis di sini
            user.save()
            messages.success(request, 'Akun Anda berhasil dibuat! Silakan login.')
            return redirect('login')  # Ganti dengan URL login yang sesuai
        else:
            messages.error(request, 'Terjadi kesalahan. Periksa kembali data yang dimasukkan.')
    else:
        form = UserForm()
    
    context = {
        'form': form
    }
    return render(request, template_name, context)
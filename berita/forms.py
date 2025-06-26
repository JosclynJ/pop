from django import forms
from .models import Berita
from django.contrib.auth.models import User

class BeritaForm(forms.ModelForm):
    class Meta:
        model = Berita
        fields = ['judul', 'konten', 'gambar']  # Fields yang ingin ditampilkan di form
        widgets = {
            'judul': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan judul berita'}),
            'konten': forms.Textarea(attrs={'class': 'form-control', 'rows': 4, 'placeholder': 'Masukkan konten berita'}),
            'gambar': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }
        

class UserForm(forms.ModelForm):
    is_staff = forms.BooleanField(required=False, widget=forms.CheckboxInput(attrs={'class': 'form-check-input'}))

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'is_staff']  # Hanya menampilkan fields ini
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan username'}),
            'first_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan nama depan'}),
            'last_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan nama belakang'}),
        }
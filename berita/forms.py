from django import forms
from .models import Berita

class BeritaForm(forms.ModelForm):
    class Meta:
        model = Berita
        fields = ['judul', 'konten', 'gambar']  # Fields yang ingin ditampilkan di form
        widgets = {
            'judul': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan judul berita'}),
            'konten': forms.Textarea(attrs={'class': 'form-control', 'rows': 4, 'placeholder': 'Masukkan konten berita'}),
            'gambar': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }
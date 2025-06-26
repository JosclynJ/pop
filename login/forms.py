from django import forms
from django.contrib.auth.models import User

class UserForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan password'}))
    password_confirmation = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Konfirmasi password'}))

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'password']
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan username'}),
            'first_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan nama depan'}),
            'last_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan nama belakang'}),
        }

    def clean_password_confirmation(self):
        password = self.cleaned_data.get('password')
        password_confirmation = self.cleaned_data.get('password_confirmation')

        if password and password_confirmation and password != password_confirmation:
            raise forms.ValidationError("Password dan konfirmasi password tidak cocok.")
        return password_confirmation
from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Berita(models.Model):
    judul = models.CharField(max_length=200)
    konten = models.TextField()
    gambar = models.ImageField(upload_to='berita/images')
    
    created_at = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.judul
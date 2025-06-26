from django.shortcuts import render, get_object_or_404, redirect
from .models import *
from .forms import *

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
    
    # Menghapus berita
    berita.delete()
    
    # Redirect ke daftar berita setelah penghapusan
    return redirect('berita_list')
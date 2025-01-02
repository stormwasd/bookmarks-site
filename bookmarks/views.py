from django.shortcuts import render
from .models import Category, Bookmark

def home(request):
    categories = Category.objects.all()
    return render(request, 'bookmarks/home.html', {'categories': categories})

def category_detail(request, category_id):
    category = Category.objects.get(id=category_id)
    bookmarks = category.bookmarks.all()
    return render(request, 'bookmarks/category_detail.html', {'category': category, 'bookmarks': bookmarks})
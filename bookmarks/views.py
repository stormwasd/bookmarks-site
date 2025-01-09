from django.shortcuts import render, get_object_or_404
from django.core.paginator import Paginator
from .models import Category, Bookmark


def home(request):
    categories = Category.objects.all()
    # 分页器，10个分类为一页
    paginator = Paginator(categories, 8)
    page_number = request.GET.get('page')  # 获取当前页码
    page_obj = paginator.get_page(page_number)  # 获取分页对象
    return render(request, 'home.html', {'page_obj': page_obj})


def category_detail(request, category_id):
    category = get_object_or_404(Category, id=category_id)
    bookmarks = category.bookmarks.all()
    # 分页器，5个书签为一页
    paginator = Paginator(bookmarks, 9)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, 'category_detail.html', {'category': category, 'page_obj': page_obj})
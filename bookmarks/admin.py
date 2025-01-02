from django.contrib import admin
from .models import Category, Bookmark


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')


@admin.register(Bookmark)
class BookmarkAdmin(admin.ModelAdmin):
    list_display = ('title', 'url', 'category')
    list_filter = ('category',)
    search_fields = ('title', 'url')

#!/usr/bin/python3.8
# -*- coding: utf-8 -*-
"""
@Description:
@Author: lihoujian
@Time: 2025/1/2 15:03
@Module: urls.py
"""
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('category/<int:category_id>/', views.category_detail, name='category_detail'),
]

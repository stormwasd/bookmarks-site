#!/usr/bin/python3.8
# -*- coding: utf-8 -*-
"""
@Description:
@Author: lihoujian
@Time: 2025/1/13 15:32
@Module: create_default_user.py
"""
from django.core.management.base import BaseCommand
from django.contrib.auth import get_user_model

User = get_user_model()

class Command(BaseCommand):
    help = 'Creates a default superuser'

    def handle(self, *args, **options):
        if not User.objects.filter(username='admin').exists():
            User.objects.create_superuser(
                username='admin',
                email='admin@example.com',
                password='98765432@Zx.'
            )
            self.stdout.write(self.style.SUCCESS('Default superuser created successfully'))
        else:
            self.stdout.write(self.style.WARNING('Default superuser already exists'))
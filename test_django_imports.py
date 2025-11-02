import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'techno_star.settings')
django.setup()

from shop.models import Zapato
print("Successfully imported Zapato")
from shop.models import ImagenZapato
print("Successfully imported ImagenZapato")
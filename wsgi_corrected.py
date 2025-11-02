import sys
import os

path = '/home/kiko2516/Technostar'
if path not in sys.path:
    sys.path.insert(0, path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'Technostar.settings'

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()

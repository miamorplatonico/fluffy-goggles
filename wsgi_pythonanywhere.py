'''
WSGI config for techno_star project on PythonAnywhere.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.2/howto/deployment/wsgi/
'''

import os
import sys

# Add the path to your project directory to the Python path.
# On PythonAnywhere, this is typically /home/your_username/your_project_directory
path = '/home/kiko2516/Technostar'  # Make sure this matches your project path on PythonAnywhere
if path not in sys.path:
    sys.path.append(path)

# Set the DJANGO_SETTINGS_MODULE environment variable to point to your project's settings.
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'techno_star.settings')

from django.core.wsgi import get_wsgi_application

application = get_wsgi_application()

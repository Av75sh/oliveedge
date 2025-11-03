import os
import sys
from pathlib import Path

# Add the project directory to the sys.path
BASE_DIR = Path(__file__).resolve().parent.parent
sys.path.append(str(BASE_DIR))

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'oliveedge.settings')

from django.core.wsgi import get_wsgi_application

application = get_wsgi_application()

# Vercel requires this
app = application
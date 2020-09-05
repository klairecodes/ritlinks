from django.shortcuts import render
from linker.models import LinkEntry, Category

# Create your views here.

def index(request):
    num_links = LinkEntry.objects.all().count()

    context = {
        'num_links' : num_links,
    }

    # Render the HTML template
    return render(request, 'index.html', context=context)

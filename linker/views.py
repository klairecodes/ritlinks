from django.shortcuts import render
from linker.models import LinkEntry, Category

# Create your views here.

def index(request):
    num_links = LinkEntry.objects.all().count()
    all_links = LinkEntry.objects.all()

    context = {
        'num_links' : num_links,
        'all_links' : all_links,
    }

    # Render the HTML template
    return render(request, 'index.html', context=context)

from django.shortcuts import render
from linker.models import LinkEntry, Category

# Create your views here.

def index(request):
    num_links = LinkEntry.objects.all().count()
    all_categories = Category.objects.all()
    all_links = LinkEntry.objects.all()
    top_message = "A collection of all of RIT's numerous websites."

    context = {
        'num_links' : num_links,
        'all_categories' : all_categories,
        'all_links': all_links,
        'top_message' : top_message,
    }

    # Render the HTML template
    return render(request, 'index.html', context=context)

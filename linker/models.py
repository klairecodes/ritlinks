from django.db import models
from django.urls import reverse

# Create your models here.

class LinkEntry(models.Model):
    """Model representing a link entry"""
    name = models.CharField(max_length=50, help_text='Enter the name of the service the link points to.')
    link = models.CharField(max_length=100, help_text='Enter the link.')
    description = models.TextField(max_length=300, help_text='Enter a description for the link.')
    category = models.ForeignKey('Category', on_delete=models.SET_NULL, null=True)
    clicks = models.IntegerField(default=0, editable=False);

    def __str__(self):
        """String for representing the LinkEntry."""
        return self.name

    def get_absolute_url(self):
        """Returns the url to access the details of the LinkEntry."""
        return reverse('link-detail', args=[str(self.id)])

class Category(models.Model):
    """Category that holds multiple related links"""
    name = models.CharField(max_length=20, help_text='Enter the name of a category.')
    
    def __str__(self):
        """String for representing a Category"""
        return self.name

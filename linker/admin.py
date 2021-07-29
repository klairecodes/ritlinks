from django.contrib import admin
from adminsortable2.admin import SortableAdminMixin
from .models import LinkEntry, Category

class LinkEntryAdmin(SortableAdminMixin, admin.ModelAdmin):
    pass
# Register your models here.
admin.site.register(LinkEntry, LinkEntryAdmin)
admin.site.register(Category)

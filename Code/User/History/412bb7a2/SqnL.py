from django.contrib.auth import get_user_model
from rest_framework import viewsets
from django.conf import settings 
from datetime import datetime
from rest_framework import status
from rest_framework.mixins import Response
from rest_framework import permissions
from django.core.exceptions import ObjectDoesNotExist
import jwt




class SafeViewSet(viewsets.ModelViewSet):

  # TODO: Pa lueego, manejar permisos, es decir, que nadie sin Token de autenticación elimine o edite estas cosas
  def destroy(self, request, *args, **kwargs):
    object_instance = self.get_object()
    object_instance.active = False 
    object_instance.save()
    return Response(status=status.HTTP_204_NO_CONTENT)
  

class UserPermission(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        if not request.user.is_authenticated:
            return False

        if view.action in ["retrieve", "update", "partial_update"]:
            return (
                obj == request.user
            )  
        else:
            return False  
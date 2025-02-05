from django.contrib.auth import get_user_model
from rest_framework import viewsets
from django.conf import settings 
from datetime import datetime
from rest_framework import status
from rest_framework.mixins import Response
from rest_framework import permissions
from django.core.exceptions import ObjectDoesNotExist
from serializers import UserNestedSerializer
import jwt




class SafeViewSet(viewsets.ModelViewSet):

  # TODO: Pa lueego, manejar permisos, es decir, que nadie sin Token de autenticación elimine o edite estas cosas
  def destroy(self, request, *args, **kwargs):
    object_instance = self.get_object()
    object_instance.active = False 
    object_instance.save()
    return Response(status=status.HTTP_204_NO_CONTENT)
  
  def retrieve(self, request, *args, **kwargs): 
    # list, create, update, partial_update retrive, destroy son los metodos de 
    # Viewsets. Retrieve nos servira para recuperar un solo registro
    object_instance = self.get_object()
    return Response(UserNestedSerializer(object_instance).data)
  

class IsStaff(permissions.BasePermission):
    message = "Not enough permissions"
    def has_permission(self, request, view):
      if not request.user.is_staff:
          return False
      return True

class UserReadOnlyPermission(permissions.BasePermission):
    message = "Not enough permissions"
    def has_permission(self, request, view):
      allowed_methods = ["GET"]
      if (not request.user.is_staff and request.method in allowed_methods) or request.user.is_staff:
         return True
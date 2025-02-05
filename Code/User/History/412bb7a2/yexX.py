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
  
def generate_access_token(user):
  payload = {
    "user_id": user.id,
    "exp": datetime.now() + settings.TOKEN_DURATION,
    "iat": datetime.now()
  }
  access_token = jwt.encode(payload, settings.SECRET_KEY, algorithm="HS256")
  return access_token 
 
def get_user_from_token(request): 
  user_token = request.COOKIES.get("access_token")
  if user_token:
    try:
      payload = jwt.decode(user_token, settings.SECRET_KEY, algorithm=["HS256"])
      expiration_time = datetime.fromtimestamp(payload["exp"])
      if expiration_time > datetime.now():
        user_model = get_user_model()
        user = user_model.objects.get(id=payload["user_id"])
        return user 
      else:
        raise jwt.ExpiredSignatureError()
    except jwt.ExpiredSignatureError:
      response = Response({"message":"Unauthorized"}, status=status.HTTP_401_UNAUTHORIZED)
      response.delete_cookie("access_token")
      return response


class UserPermission(BasePermission):
    def has_object_permission(self, request, view, obj):
        if not request.user.is_authenticated:
            return False

        if view.action in ["retrieve", "update", "partial_update"]:
            return (
                obj == request.user
            )  
        else:
            return False  
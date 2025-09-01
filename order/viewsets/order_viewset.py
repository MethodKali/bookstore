<<<<<<< HEAD
#from rest_framework import status
#from rest_framework.mixins import CreateModelMixin
#from rest_framework.response import Response
#from rest_framework.viewsets import ModelViewSet
#from rest_framework.authentication import SessionAuthentication, BasicAuthentication, TokenAuthentication
=======
# from rest_framework import status
# from rest_framework.mixins import CreateModelMixin
# from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
#from rest_framework.authentication import (
#    SessionAuthentication,
#    BasicAuthentication,
#    TokenAuthentication,
#)
>>>>>>> bbb07ee8b2c73632e5b45c1694abbf76d8c5c3c4
#from rest_framework.permissions import IsAuthenticated

from order.models import Order
from order.serializers import OrderSerializer


class OrderViewSet(ModelViewSet):
<<<<<<< HEAD
#    authentication_classes = [SessionAuthentication, BasicAuthentication, TokenAuthentication]
#    permission_classes = [IsAuthenticated]
=======
 #   authentication_classes = [
 #       SessionAuthentication,
 #       BasicAuthentication,
 #       TokenAuthentication,
 #   ]
 #   permission_classes = [IsAuthenticated]
>>>>>>> bbb07ee8b2c73632e5b45c1694abbf76d8c5c3c4
    serializer_class = OrderSerializer
    queryset = Order.objects.all().order_by("id")

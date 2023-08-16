from django.urls import path
from . import views


urlpatterns = [
    path('',views.index),
    path('home',views.index,name = 'home'),
    path('user_registration', views.user_registration, name = 'user_registration'),
    path('user_login', views.user_login, name = 'user_login'),
    path('logout',views.logout,name="logout"),
    path('subscribe',views.subscribe,name = 'subscribe'),
    path('gallery', views.gallery),
    path('history', views.history),

#-----------------------super_admin-------------------------------------------------------
    path('super_admin',views.super_admin_login),
    path('super_admin_home',views.super_admin_home, name = 'super_admin_home'),
    path('super_admin_view_admins',views.super_admin_view_admins, name ="super_admin_view_admins"),
    path('super_admin_add_admins',views.super_admin_add_admins, name ="super_admin_add_admins"),
    path("super_admin_view_users",views.super_admin_view_users, name ="super_admin_view_users"),
    path("super_admin_user/<str:id>",views.super_admin_user, name ="super_admin_user"),
    path("super_admin_view_subscriptions",views.super_admin_view_subscriptions, name ="super_admin_view_subscriptions"),
    path('download_xml',views.download_xml, name ="download_xml"),
    path('super_admin_view_news',views.super_admin_view_news, name ="super_admin_view_news"),
    path('super_admin_add_news',views.super_admin_add_news, name ="super_admin_add_news"),
    path('super_admin_news/<str:id>',views.super_admin_news, name ="super_admin_news"),

#----------------------- admin -------------------------------------------------------
    path('admin',views.admin_login),
    path('admin_home',views.admin_home, name = 'admin_home'),
    path('admin_view_news',views.admin_view_news, name ="admin_view_news"),
    path('admin_news/<str:id>',views.admin_news, name ="admin_news"),
    path('admin_add_news',views.admin_add_news, name ="admin_add_news"),
    path("admin_view_users",views.admin_view_users, name ="admin_view_users"),
    path("admin_user/<str:id>",views.admin_user, name ="admin_user"),
    path("payment_gateway/<str:email>",views.payment_gateway, name ="payment_gateway"),

#----------------------- user -------------------------------------------------------

    path('user_home',views.user_home,name = 'user_home'),
    path('user_all_news',views.user_all_news,name = 'user_all_news'),
    path('user_news/<str:id>',views.user_news,name = 'user_news'),

]



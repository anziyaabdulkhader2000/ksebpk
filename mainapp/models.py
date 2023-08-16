from django.db import models

# Create your models here.


class login(models.Model):
    log_id = models.AutoField(primary_key=True)
    email = models.CharField("email", max_length=100, unique=True)
    password = models.CharField("password", max_length=100)
    role = models.CharField("role", max_length=100)

class Subscription(models.Model):
    Sub_id= models.AutoField(primary_key=True)
    Sub_date = models.CharField("sub_date", max_length=100,null=True)
    Sub_end=models.CharField("end_date", max_length=200, null=True)
    Sub_trans_id = models.CharField("sub_trans_id",max_length=16, null=True)


class User(models.Model):
    User_id= models.AutoField(primary_key=True)
    User_name=models.CharField("name", max_length=200)
    User_email = models.CharField("email", max_length=100, unique=True)
    User_address=models.CharField("address", max_length=200)
    User_phone=models.CharField("phone", max_length=12)
    User_ARU = models.CharField("ARU", max_length=100)
    User_nomin = models.CharField("nomin_name", max_length=100)
    User_join = models.CharField("join_date",max_length=100)
    User_retire = models.CharField("retire_date",max_length=100)
    User_age = models.IntegerField("age")
    User_birth = models.CharField("birth_date",max_length=100)
    User_position = models.CharField("retired_post", max_length=100)
    User_permitted = models.BooleanField(default=True)
    User_Sub = models.ForeignKey(Subscription, on_delete=models.CASCADE, null=True)
    Log_id=models.ForeignKey(login, on_delete=models.CASCADE, null=True)


class Admin(models.Model):
    Admin_id= models.AutoField(primary_key=True)
    Admin_name=models.CharField("name", max_length=200)
    Admin_email = models.CharField("email", max_length=100, unique=True)
    Admin_address=models.CharField("address", max_length=200)
    Admin_phone=models.CharField("phone", max_length=12)
    Admin_Area = models.CharField("ARU", max_length=100)
    Admin_position = models.CharField("working position", max_length=100)
    Admin_permitted = models.BooleanField(default=False)
    Admin_Picture = models.ImageField(upload_to = 'images/admins/', null=True)
    Log_id=models.ForeignKey(login, on_delete=models.CASCADE, null=True)


class News(models.Model):
    News_id= models.AutoField(primary_key=True)
    News_title=models.CharField("name", max_length=500)
    News_content = models.CharField("content", max_length=2000)
    News_date=models.DateField(auto_now_add=True)
    News_Picture = models.ImageField(upload_to = 'images/news/', null=True)
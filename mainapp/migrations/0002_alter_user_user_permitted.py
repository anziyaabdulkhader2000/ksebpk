# Generated by Django 3.2.7 on 2023-08-02 17:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='User_permitted',
            field=models.BooleanField(default=True),
        ),
    ]

# Generated by Django 4.1.4 on 2024-10-04 07:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('MYAPP', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='booking',
            name='date',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='chat',
            name='date',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='chat',
            name='from_id',
            field=models.BigIntegerField(),
        ),
        migrations.AlterField(
            model_name='chat',
            name='to_id',
            field=models.BigIntegerField(),
        ),
        migrations.AlterField(
            model_name='complaint',
            name='date',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='doctor',
            name='experience',
            field=models.BigIntegerField(),
        ),
        migrations.AlterField(
            model_name='doctor',
            name='phone',
            field=models.BigIntegerField(),
        ),
        migrations.AlterField(
            model_name='doctor',
            name='pin',
            field=models.BigIntegerField(),
        ),
        migrations.AlterField(
            model_name='notification',
            name='date',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='review',
            name='date',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='schedule',
            name='date',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='schedule',
            name='from_time',
            field=models.TimeField(),
        ),
        migrations.AlterField(
            model_name='schedule',
            name='to_time',
            field=models.TimeField(),
        ),
        migrations.AlterField(
            model_name='tips',
            name='date',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='trainer_request',
            name='date',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='phone',
            field=models.BigIntegerField(),
        ),
        migrations.AlterField(
            model_name='user',
            name='pin',
            field=models.BigIntegerField(),
        ),
        migrations.AlterField(
            model_name='videos',
            name='date',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='yoga_trainer',
            name='experience',
            field=models.BigIntegerField(),
        ),
        migrations.AlterField(
            model_name='yoga_trainer',
            name='phone',
            field=models.BigIntegerField(),
        ),
        migrations.AlterField(
            model_name='yoga_trainer',
            name='pin',
            field=models.BigIntegerField(),
        ),
    ]

# Generated by Django 3.2.25 on 2024-11-03 05:17

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('MYAPP', '0011_auto_20241103_0016'),
    ]

    operations = [
        migrations.CreateModel(
            name='trainer_review',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('review', models.CharField(max_length=100)),
                ('rating', models.CharField(max_length=100)),
                ('date', models.DateField(auto_now_add=True)),
                ('TRAINER', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='MYAPP.yoga_trainer')),
                ('USER', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='MYAPP.user')),
            ],
        ),
    ]

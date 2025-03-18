from django.db import models

# Create your models here.
class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)

class doctor(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone= models.BigIntegerField()
    place= models.CharField(max_length=100)
    pin= models.BigIntegerField()
    post= models.CharField(max_length=100)
    language= models.CharField(max_length=100)
    experience= models.BigIntegerField()
    certificate= models.FileField()
    image= models.FileField()
    licence= models.FileField()
    department=models.CharField(max_length=100)

class user(models.Model):
    LOGIN = models.ForeignKey(login_table, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    phone = models.BigIntegerField()
    place = models.CharField(max_length=100)
    pin = models.BigIntegerField()
    post = models.CharField(max_length=100)
    image = models.FileField()

class yoga_trainer(models.Model):
    LOGIN = models.ForeignKey(login_table, on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone= models.BigIntegerField()
    place= models.CharField(max_length=100)
    pin= models.BigIntegerField()
    post= models.CharField(max_length=100)
    language= models.CharField(max_length=100)
    experience= models.BigIntegerField()
    certificate= models.FileField()
    image= models.FileField()
    licence= models.FileField()

class schedule(models.Model):
    DOCTOR_ID= models.ForeignKey(doctor, on_delete=models.CASCADE)
    date= models.DateField()
    from_time= models.TimeField()
    to_time= models.TimeField()


class booking(models.Model):
    SCHEDULE_ID= models.ForeignKey(schedule, on_delete=models.CASCADE)
    USER_ID= models.ForeignKey(user, on_delete=models.CASCADE)
    date= models.DateField(auto_now_add=True)
    status= models.CharField(max_length=100)


class prescription(models.Model):
    BOOKING_ID= models.ForeignKey(booking, on_delete=models.CASCADE)
    prescription= models.CharField(max_length=100)

class notification(models.Model):
    notification= models.CharField(max_length=100)
    date= models.DateField(auto_now_add=True)
    type = models.CharField(max_length=100)

class review(models.Model):
    USER = models.ForeignKey(user, on_delete=models.CASCADE)
    DOCTOR_ID= models.ForeignKey(doctor,on_delete=models.CASCADE)
    review= models.CharField(max_length=100)
    rating= models.CharField(max_length=100)
    date= models.DateField(auto_now_add=True)

class complaint_table(models.Model):
    USER_ID= models.ForeignKey(user, on_delete=models.CASCADE)
    LOGIN= models.ForeignKey(login_table, on_delete=models.CASCADE)
    complaint= models.CharField(max_length=100)
    reply= models.CharField(max_length=100)
    date= models.DateField(auto_now_add=True)

class trainer_request(models.Model):
    USER_ID= models.ForeignKey(user, on_delete=models.CASCADE)
    TRAINER_ID= models.ForeignKey(yoga_trainer, on_delete=models.CASCADE)
    date= models.DateField(auto_now_add=True)
    status= models.CharField(max_length=100)
    description= models.CharField(max_length=100)

class videos(models.Model):
    TRAINER_ID = models.ForeignKey(yoga_trainer, on_delete=models.CASCADE)
    video= models.FileField()
    date= models.DateField(auto_now_add=True)
    descriptions= models.CharField(max_length=100)

class tips_table(models.Model):
    TRAINER_ID = models.ForeignKey(yoga_trainer, on_delete=models.CASCADE)
    tips= models.CharField(max_length=100)
    date= models.DateField(auto_now_add=True)
    descriptions= models.CharField(max_length=100)

class prescription_table(models.Model):
    date=models.DateField()
    pres=models.CharField(max_length=100)
    BOOK=models.ForeignKey(booking,on_delete=models.CASCADE)


class chat(models.Model):
    fromid=models.ForeignKey(login_table,on_delete=models.CASCADE,related_name='fromid')
    toid=models.ForeignKey(login_table,on_delete=models.CASCADE,related_name='toid')
    msg=models.CharField(max_length=1000)
    date=models.DateField()
    status=models.CharField(max_length=20)

class trainer_review(models.Model):
    USER = models.ForeignKey(user, on_delete=models.CASCADE)
    TRAINER= models.ForeignKey(yoga_trainer,on_delete=models.CASCADE)
    review= models.CharField(max_length=100)
    date= models.DateField(auto_now_add=True)
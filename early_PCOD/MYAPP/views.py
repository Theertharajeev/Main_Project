import datetime

from django.core.files.storage import FileSystemStorage
from django.db.models import Q, Avg
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.contrib.auth import logout
from django.contrib import auth
from django.contrib.auth.decorators import login_required
# Create your views here.
from MYAPP.models import *
from MYAPP.rec import recommendor


def login(request):
    return render(request, 'login/Login.html')

def log_out(request):
    logout(request)
    return HttpResponse('''<script> alert ('Logged Out');window.location='/'; </script>''')

def login_post(request):
    username = request.POST['textfield']
    password = request.POST['textfield2']
    print(username,password,'jjjjjjjjjjjj')

    user = login_table.objects.get(username=username, password=password)
    if user.type == 'admin':
       ob1 = auth.authenticate(username='admin', password='admin')
       if ob1 is not None:
           auth.login(request, ob1)
       request.session['lid'] = user.id
       return HttpResponse('''<script>alert('Admin Logged Succesfully');window.location='admin_home'</script>''')
    elif user.type == 'doctor':
        ob1 = auth.authenticate(username='admin', password='admin')
        if ob1 is not None:
          auth.login(request, ob1)
          request.session['lid'] = user.id
          return HttpResponse('''<script>alert('Doctor Logged Succesfully');window.location='/doctor_home'</script>''')
    elif user.type == 'yoga_trainer':
        ob1 = auth.authenticate(username='admin', password='admin')
        if ob1 is not None:
            auth.login(request, ob1)
            request.session['lid'] = user.id
        return HttpResponse('''<script>alert('Trainer Logged Succesfully');window.location='/yoga_home'</script>''')
    elif user.type == 'yoga_pending':
        return HttpResponse('''<script>alert('Trainer Request Pending');window.location='/'</script>''')
    elif user.type == 'doc_pending':
        return HttpResponse('''<script>alert('Doctor Request Pending');window.location='/'</script>''')
    else:
        return HttpResponse('''<script>alert('Invalid Request');window.location='/'</script>''')




@login_required(login_url='/')
def admin_home(request):
    users=user.objects.all()
    pdoc=doctor.objects.filter(LOGIN__type='doc_pending')
    ptra=yoga_trainer.objects.filter(LOGIN__type='yoga_pending').count()
    noti=notification.objects.all()
    book=booking.objects.all().count()

    return render(request, 'admin/admin_dash.html',{'user':len(users),'pdoc':len(pdoc),'ptra':ptra,'noti':len(noti),'book':book})

@login_required(login_url='/')
def viewuser(request):
    ob = user.objects.all()
    return render(request, 'admin/Admin userview.html', {'val': ob})

@login_required(login_url='/')
def viewdoctors(request):
    ob = doctor.objects.filter(LOGIN__type='doctor')
    return render(request, 'admin/Doctorview.html', {'val': ob})

@login_required(login_url='/')
def admin_doc_search(request):
    query=request.POST['quer']
    ob = doctor.objects.filter(LOGIN__type='doctor',name__icontains=query)
    return render(request, 'admin/Doctorview.html', {'val': ob})

@login_required(login_url='/')
def doctorverify(request):
    doc = doctor.objects.filter(LOGIN__type='doc_pending')
    return render(request, 'admin/doctor verify.html', {'doct': doc})

@login_required(login_url='/')
def viewbookings(request):
    date=datetime.datetime.today()
    bk = booking.objects.filter(date__gte=date)
    return render(request, 'admin/viewbooking.html', {'book': bk})

@login_required(login_url='/')
def viewnotification(request):
    notif = notification.objects.all()
    return render(request, 'admin/view Notification.html', {'noti': notif})

@login_required(login_url='/')
def viewdoctorbasedreview(request):
    vdb = review.objects.all()
    return render(request, 'admin/View Doctors Based Review.html', {'rev': vdb})

@login_required(login_url='/')
def search_doctor(request):
    name = request.POST['textfield']
    vdb = review.objects.filter(DOCTOR_ID__name__icontains=name)
    return render(request, 'admin/View Doctors Based Review.html', {'rev': vdb})

@login_required(login_url='/')
def Trainers(request):
    ob = yoga_trainer.objects.filter(LOGIN__type='yoga_trainer')
    return render(request, 'admin/admin_view_trainers.html', {'value': ob})

@login_required(login_url='/')
def Trainer_verify(request):
    ob = yoga_trainer.objects.filter(LOGIN__type='yoga_pending')
    return render(request, 'admin/Trainer_verify.html', {'value': ob})

@login_required(login_url='/')
def search_trainer(request):
    name = request.POST['textfield']
    stra = yoga_trainer.objects.filter(name__icontains=name)
    return render(request, 'admin/Trainer_verify.html', {'value': stra})

@login_required(login_url='/')
def search_view_trainer(request):
    name = request.POST['textfield']
    stra = yoga_trainer.objects.filter(name__icontains=name)
    return render(request, 'admin/admin_view_trainers.html', {'value': stra})


def yoga_view_notification(request):
    noti=notification.objects.filter(type='trainer')
    return render(request,'yogatrainer/noti.html',{'notifications':noti})

@login_required(login_url='/')
def adm_acceptyoga(request, id):
    yotra = login_table.objects.get(id=id)
    yotra.type = 'yoga_trainer'
    yotra.save()
    return HttpResponse('''<script>alert('yoga trainer Accepted');window.location='/Trainer_verify'</script>''')

@login_required(login_url='/')
def adm_rejectedyoga(request, id):
    yotra = login_table.objects.get(id=id)
    yotra.type = 'yoga_rejected'
    yotra.save()
    return HttpResponse('''<script>alert('yoga trainer Rejected');window.location='/Trainer_verify'</script>''')

@login_required(login_url='/')
def changepassword(request):
    return render(request, 'admin/Change Password.html')

@login_required(login_url='/')
def changepassword_POST(request):
    cpass = request.POST["textfield"]
    npass = request.POST["textfield2"]
    conpass = request.POST["textfield3"]
    ob = login_table.objects.get(id=request.session['lid'])
    if ob.password == cpass:
        if npass == conpass:
            ob.password = npass
            ob.save()
            return HttpResponse(
                '''<script>alert('change password successfully... ');window.location='admin_home';</script>''')
        else:
            return HttpResponse('''<script>alert('missmatch....');window.location='admin_home';</script>''')
    else:
        return HttpResponse('''<script>alert('Invalid Password...! ');window.location='admin_home';</script>''')

@login_required(login_url='/')
def admin_dash(request):
    return render(request,'admin/admin_dash.html')

@login_required(login_url='/')
def admin_accept(request, id):
    doc = login_table.objects.get(id=id)
    doc.type = 'doctor'
    doc.save()
    return HttpResponse('''<script>alert('Doctor Accepted');window.location='/doctorverify'</script>''')

@login_required(login_url='/')
def admin_recjected(request, id):
    doc = login_table.objects.get(id=id)
    doc.type = 'doc_rejected'
    doc.save()
    return HttpResponse('''<script>alert('Doctor Rejected');window.location='/doctorverify'</script>''')

@login_required(login_url='/')
def viewuser_post(request):
    na = request.POST['textfield']
    ob = user.objects.filter(name__icontains=na)
    return render(request, 'admin/Admin userview.html', {'val': ob})

@login_required(login_url='/')
def doctorverify_search(request):
    an = request.POST['textfield']
    doc = doctor.objects.filter(name__icontains=an)
    return render(request, 'admin/doctor verify.html', {'doct': doc})

@login_required(login_url='/')
def delete_notification(request, nid):
    noti = notification.objects.filter(id=nid)
    noti.delete()
    return HttpResponse('''<script>alert('Notification deleted');window.location='/viewnotification'</script>''')

@login_required(login_url='/')
def admin_add_noti(request):
    return render(request, 'admin/admin_add_noti.html')

@login_required(login_url='/')
def admin_add_noti_post(request):
    noti = request.POST['textarea']
    type = request.POST['type']

    not_table = notification()
    not_table.notification = noti
    not_table.type = type
    not_table.save()
    return HttpResponse('''<script>alert('Notification Added');window.location='/viewnotification'</script>''')

@login_required(login_url='/')
def admin_search_noti(request):
    dt = request.POST['date1']
    noti = notification.objects.filter(date__exact=dt)
    return render(request, 'admin/view Notification.html', {'noti': noti})

def doct_regi(request):
    return render(request, 'Doctor/Doctor Registration.html')

def doct_regi_code(request):
    name = request.POST['textfield12']
    email = request.POST['textfield']
    phone = request.POST['textfield13']
    place = request.POST['textfield14']
    pin = request.POST['textfield15']
    post = request.POST["textfield16"]
    language = request.POST['textfield17']
    experience = request.POST['textfield18']
    certificate = request.FILES['textfield19']
    image = request.FILES['textfield20']
    licence = request.FILES['textfield21']
    Username = request.POST['uname']
    Password = request.POST['pass']

    ob1 = login_table()
    ob1.username = Username
    ob1.password = Password
    ob1.type = 'doc_pending'
    ob1.save()

    fs = FileSystemStorage()
    fp = fs.save(image.name, image)
    fp2 = fs.save(licence.name, licence)
    fp3 = fs.save(certificate.name, certificate)

    ob2 = doctor()
    ob2.LOGIN = ob1
    ob2.name = name
    ob2.email = email
    ob2.phone = phone
    ob2.place = place
    ob2.pin = pin
    ob2.post = post
    ob2.language = language
    ob2.experience = experience
    ob2.certificate = fp3
    ob2.image = fp
    ob2.licence = fp2
    ob2.save()

    return HttpResponse('''<script>alert('Doctor Registered');window.location='/'</script>''')

@login_required(login_url='/')
def changepassword1(request):
    return render(request, 'Doctor/Change Password.html')

@login_required(login_url='/')
def changepassword1_POST(request):
    cupass = request.POST["textfield"]
    nepass = request.POST["textfield2"]
    confpass = request.POST["textfield3"]
    obh = login_table.objects.get(id=request.session['lid'])
    if obh.password == cupass:
        if nepass == confpass:
            obh.password = nepass
            obh.save()
            return HttpResponse(
                '''<script>alert('change password successfully... ');window.location='/doctor_home';</script>''')
        else:
            return HttpResponse('''<script>alert('missmatch....');window.location='/doctor_home';</script>''')
    else:
        return HttpResponse('''<script>alert('Invalid Password...! ');window.location='/doctor_home';</script>''')

@login_required(login_url='/')
def doctor_home(request):
    return render(request, 'Doctor/doct_home.html')

@login_required(login_url='/')
def Schedule(request):
    return render(request, 'Doctor/Schedule 2.html',{'d':datetime.datetime.now().strftime("%Y-%m-%d")})

@login_required(login_url='/')
def Schedule_post(request):
    date = request.POST['textfield']
    f_time = request.POST['textfield4']
    t_time = request.POST['textfield5']
    kk = doctor.objects.get(LOGIN_id=request.session['lid'])
    ob = schedule()
    ob.date = date
    ob.from_time = f_time
    ob.to_time = t_time
    ob.DOCTOR_ID_id = kk.id
    ob.save()
    return HttpResponse('''<script>alert('Scheduled ');window.location='/Manage_Schedule#content';</script>''')

@login_required(login_url='/')
def Manage_Schedule(request):
    date=datetime.datetime.today().date()
    sh = schedule.objects.filter(DOCTOR_ID__LOGIN_id=request.session['lid'],date__gte=date)
    return render(request, 'Doctor/Manage Schedule.html', {'sh': sh})

@login_required(login_url='/')
def delete_schedule(request, id):
    sh = schedule.objects.get(id=id)
    sh.delete()
    return HttpResponse('''<script>alert('Schedule Deleted ');window.location='/Manage_Schedule';</script>''')

@login_required(login_url='/')
def View_Notification(request):
    noti = notification.objects.filter(type='doctor')
    return render(request, 'Doctor/View Notification.html', {'noti': noti})

@login_required(login_url='/')
def admin_view_complaint(request):
    noti = complaint_table.objects.all()
    return render(request, 'admin/admin_view_complaint.html', {'noti': noti})

@login_required(login_url='/')
def admin_reply_complaint(request,id):
    dat=complaint_table.objects.get(id=id)
    request.session['cid']=id
    return render(request,'admin/admin_reply_complaint.html',{'c':dat})

@login_required(login_url='/')
def admin_reply_complaint_post(request):
    repp=request.POST['reply']
    rep=complaint_table.objects.filter(id=request.session['cid']).update(reply=repp)
    return HttpResponse('''<script>alert('Replied ');window.location='/admin_view_complaint';</script>''')

@login_required(login_url='/')
def View_Profile(request):
    details = doctor.objects.get(LOGIN_id=request.session['lid'])
    return render(request, 'Doctor/View Profile.html', {'details': details})

@login_required(login_url='/')
def doc_update(request):
    details = doctor.objects.get(LOGIN_id=request.session['lid'])

    return render(request, 'Doctor/doctor_update.html', {'details': details})

@login_required(login_url='/')
def update_save(request):
    ob2 = doctor.objects.get(LOGIN_id=request.session['lid'])

    name = request.POST['textfield12']
    email = request.POST['textfield']
    phone = request.POST['textfield13']
    place = request.POST['textfield14']
    pin = request.POST['textfield15']
    post = request.POST["textfield16"]
    language = request.POST['textfield17']
    experience = request.POST['textfield18']

    if 'textfield19' in request.FILES:
        certificate = request.FILES['textfield19']
        fs = FileSystemStorage()
        fp3 = fs.save(certificate.name, certificate)
        ob2.certificate = fp3
    if 'textfield20' in request.FILES:
        image = request.FILES['textfield20']
        fs = FileSystemStorage()
        fp = fs.save(image.name, image)
        ob2.image = fp
    if 'textfield21' in request.FILES:
        licence = request.FILES['textfield21']
        fs = FileSystemStorage()
        fp2 = fs.save(licence.name, licence)
        ob2.licence = fp2

    ob2.name = name
    ob2.email = email
    ob2.phone = phone
    ob2.place = place
    ob2.pin = pin
    ob2.post = post
    ob2.language = language
    ob2.experience = experience

    ob2.save()
    return HttpResponse('''<script>alert('Doctor updated');window.location='/View_Profile'</script>''')

@login_required(login_url='/')
def changepassword(request):
    return render(request, 'admin/Change Password.html')

@login_required(login_url='/')
def view_review_and_Rating(request):
    vdb = review.objects.filter(DOCTOR_ID__LOGIN_id=request.session['lid'])
    return render(request, 'Doctor/View Review And  Rating.html', {'rev': vdb})

@login_required(login_url='/')
def View_Accepted_Booking_p1(request):
    vdb = booking.objects.filter(SCHEDULE_ID__DOCTOR_ID__LOGIN_id=request.session['lid'], status='accepted')
    print(vdb)
    return render(request, 'Doctor/View Accepted Booking p1.html', {'rev': vdb})

@login_required(login_url='/')
def View_Accepted_Booking_p2(request, id):
    request.session['bid'] = id
    data = prescription_table.objects.filter(BOOK__SCHEDULE_ID__DOCTOR_ID__LOGIN=request.session['lid'])
    return render(request, 'Doctor/View Accepted Booking p2.html', {'data': data})

@login_required(login_url='/')
def View_Accepted_Booking_p2_post(request):
    pre = request.POST['textarea']

    ob = prescription_table()
    ob.date = datetime.datetime.today()
    ob.pres = pre
    ob.BOOK_id = request.session['bid']
    ob.save()
    return View_Accepted_Booking_p2(request, request.session['bid'])
    # return HttpResponse('''<script>alert('prescription added');window.location='/View_Accepted_Booking_p2'</script>''')

@login_required(login_url='/')
def View_Booking_And_Verify(request):
    bb = booking.objects.filter(SCHEDULE_ID__DOCTOR_ID__LOGIN_id=request.session['lid'], status='pending')
    return render(request, 'Doctor/View Booking And Verify.html', {'bok': bb})

@login_required(login_url='/')
def doctor_accept(request, id):
    usr = booking.objects.filter(id=id).update(status='accepted')
    return HttpResponse('''<script>alert('Booking Accepted');window.location='/View_Booking_And_Verify';</script>''')

@login_required(login_url='/')
def doctor_reject(request, id):
    usr = booking.objects.filter(id=id).update(status='rejected')
    return HttpResponse('''<script>alert('Booking Rejected');window.location='/View_Booking_And_Verify'</script>''')

@login_required(login_url='/')
def doc_search(request):
    fdt = request.POST['textfield']
    tdt = request.POST['textfield2']

    noti = booking.objects.filter(date__range=[fdt, tdt])
    return render(request, 'doctor/View Booking And Verify.html', {'bok': noti})

def yoga_regi(request):
    return render(request, 'yogatrainer/trainer_reg.html')

def yoga_regi_code(request):
    name = request.POST['textfield12']
    email = request.POST['textfield']
    phone = request.POST['textfield13']
    place = request.POST['textfield14']
    pin = request.POST['textfield15']
    post = request.POST["textfield16"]
    language = request.POST['textfield17']
    experience = request.POST['textfield18']
    certificate = request.FILES['textfield19']
    image = request.FILES['textfield20']
    licence = request.FILES['textfield21']
    Username = request.POST['uname']
    Password = request.POST['pass']

    ob11 = login_table()
    ob11.username = Username
    ob11.password = Password
    ob11.type = 'yoga_pending'
    ob11.save()

    fs = FileSystemStorage()
    fp = fs.save(image.name, image)
    fp2 = fs.save(licence.name, licence)
    fp3 = fs.save(certificate.name, certificate)

    ob2 = yoga_trainer()
    ob2.LOGIN = ob11
    ob2.name = name
    ob2.email = email
    ob2.phone = phone
    ob2.place = place
    ob2.pin = pin
    ob2.post = post
    ob2.language = language
    ob2.experience = experience
    ob2.certificate = fp3
    ob2.image = fp
    ob2.licence = fp2
    ob2.save()

    return HttpResponse('''<script>alert('yogatrainer Registered');window.location='/';</script>''')

@login_required(login_url='/')
def yoga_home(request):
    return render(request, 'yogatrainer/view User request and verify.html')

@login_required(login_url='/')
def View_User_request(request):
    req = trainer_request.objects.filter(TRAINER_ID__LOGIN_id=request.session['lid'])
    return render(request, 'yogatrainer/view User request and verify.html', {'req': req})

@login_required(login_url='/')
def trainer_accept_user(request, id):
    usr = trainer_request.objects.filter(id=id).update(status='accepted')
    return HttpResponse('''<script>alert('user Accepted');window.location='/View_User_request'</script>''')

@login_required(login_url='/')
def trainer_reject_user(request, id):
    usr = trainer_request.objects.filter(id=id).update(status='rejected')
    return HttpResponse('''<script>alert('User Request Rejected');window.location='/View_User_request'</script>''')

@login_required(login_url='/')
def View_Tips(request):
    tiped = tips_table.objects.filter(TRAINER_ID__LOGIN_id=request.session['lid'])
    return render(request, 'yogatrainer/View Tips.html', {'dic': tiped})

@login_required(login_url='/')
def add_Tips(request):
    return render(request, 'yogatrainer/Add Tips.html')

@login_required(login_url='/')
def yoga_videos(request):
    return render(request, 'yogatrainer/Add Yoga Videos.html')

@login_required(login_url='/')
def yoga_video_upl(request):
    video = request.FILES['file']
    descriptions = request.POST['textarea']
    obb = videos()
    obb.video = video
    obb.descriptions = descriptions
    obb.TRAINER_ID = yoga_trainer.objects.get(LOGIN_id=request.session['lid'])
    obb.date = datetime.datetime.today()
    obb.save()
    return HttpResponse('''<script>alert('videos uploaded');window.location='/View_uploaded_videos';</script>''')

@login_required(login_url='/')
def change_password(request):
    return render(request, 'yogatrainer/Change Password.html')

@login_required(login_url='/')
def changepasswordd_POST(request):
    cupass = request.POST["textfield"]
    nepass = request.POST["textfield2"]
    confpass = request.POST["textfield3"]
    obh = login_table.objects.get(id=request.session['lid'])
    if obh.password == cupass:
        if nepass == confpass:
            obh.password = nepass
            obh.save()
            return HttpResponse(
                '''<script>alert('change password successfully... ');window.location='/yoga_home';</script>''')
        else:
            return HttpResponse('''<script>alert('missmatch....');window.location='/yoga_home';</script>''')
    else:
        return HttpResponse('''<script>alert('Invalid Password...! ');window.location='/yoga_home';</script>''')

@login_required(login_url='/')
def View_accepted_User_request(request):
    return render(request, 'yogatrainer/view Accepted User request.html')

@login_required(login_url='/')
def view_profile(request):
    return render(request, 'yogatrainer/View Profile.html')

@login_required(login_url='/')
def View_uploaded_videos(request):
    vv = videos.objects.filter(TRAINER_ID__LOGIN_id=request.session['lid'])
    return render(request, 'yogatrainer/view Uploaded Yoga Videos.html', {'vv': vv})

@login_required(login_url='/')
def delete_videos(request, id):
    vidi = videos.objects.get(id=id)
    vidi.delete()
    return HttpResponse('''<script>alert('video Deleted ');window.location='/View_uploaded_videos';</script>''')

@login_required(login_url='/')
def trainer_search_request(request):
    dt = request.POST['textfield']
    noti = trainer_request.objects.filter(date__exact=dt)
    return render(request, 'yogatrainer/view User request and verify.html', {'req': noti})

@login_required(login_url='/')
def trainer_add_tips_post(request):
    tip = request.POST['textfield']
    detials = request.POST['textarea']

    ob = tips_table()
    ob.tips = tip
    ob.descriptions = detials
    ob.TRAINER_ID = yoga_trainer.objects.get(LOGIN_id=request.session['lid'])
    ob.date = datetime.datetime.today()
    ob.save()
    return HttpResponse('''<script>alert('Tips added');window.location='/View_Tips';</script>''')

@login_required(login_url='/')
def delete_tips(request, id):
    tii = tips_table.objects.get(id=id)
    tii.delete()
    return HttpResponse('''<script>alert('tips Deleted ');window.location='/View_Tips';</script>''')


# ---------------trainer chat user-----------------
@login_required(login_url='/')
def chatwithuser(request):
    ob = user.objects.all()
    print(ob)
    return render(request, "yogatrainer/fur_chat.html", {'val': ob})

@login_required(login_url='/')
def chatview(request):
    ob = user.objects.all()
    d = []
    for i in ob:
        r = {"name": i.name, 'photo': i.image.url, 'email': i.email, 'loginid': i.LOGIN.id}
        d.append(r)
    return JsonResponse(d, safe=False)

@login_required(login_url='/')
def coun_insert_chat(request, msg, id):
    print("===", msg, id)
    ob = chat()
    ob.fromid = login_table.objects.get(id=request.session['lid'])
    ob.toid = login_table.objects.get(id=id)
    ob.msg = msg
    ob.date = datetime.datetime.now().strftime("%Y-%m-%d")
    ob.save()

    return JsonResponse({"task": "ok"})
    # refresh messages chatlist

@login_required(login_url='/')
def coun_msg(request, id):
    ob1 = chat.objects.filter(fromid__id=id, toid__id=request.session['lid'])
    ob2 = chat.objects.filter(fromid__id=request.session['lid'], toid__id=id)
    combined_chat = ob1.union(ob2)
    combined_chat = combined_chat.order_by('id')
    res = []
    for i in combined_chat:
        res.append({"from_id": i.fromid.id, "msg": i.msg, "date": i.date, "chat_id": i.id})

    obu = user.objects.get(LOGIN__id=id)

    return JsonResponse({"data": res, "name": obu.name, "photo": obu.image.url, "user_lid": obu.LOGIN.id})


# ------------------------doc to user----------------------
@login_required(login_url='/')
def chatwith_doc(request):
    ob = user.objects.all()
    print(ob)
    return render(request, "Doctor/fur_chat.html", {'val': ob})

@login_required(login_url='/')
def chat_doc(request):
    ob = user.objects.all()
    d = []
    for i in ob:
        id=0


        obc=chat.objects.filter(toid__id=request.session['lid'],fromid__id= i.LOGIN.id).order_by("-id")
        obc1=chat.objects.filter(fromid__id=request.session['lid'],toid__id= i.LOGIN.id).order_by("-id")

        if len(obc)>0:
            id=obc[0].id
        if len(obc1)>0:
            if obc1[0].id>id:
                id=obc1[0].id
        obc=chat.objects.filter(toid__id=request.session['lid'],fromid__id= i.LOGIN.id,status='pending')
        name=i.name
        if len(obc)>0:
            name=name+" ("+str(len(obc))+")"
        r = {"name": name, 'photo': i.image.url, 'email': i.email, 'loginid': i.LOGIN.id,"id":id}
        d.append(r)
    d= sorted(d, key=lambda x: x['id'], reverse=True)
    return JsonResponse(d, safe=False)

@login_required(login_url='/')
def coun_insert_chat_doc(request, msg, id):
    print("===", msg, id)
    ob = chat()
    ob.fromid = login_table.objects.get(id=request.session['lid'])
    ob.toid = login_table.objects.get(id=id)
    ob.msg = msg
    ob.date = datetime.datetime.now().strftime("%Y-%m-%d")
    ob.save()
    return JsonResponse({"task": "ok"})
    # refresh messages chatlist

@login_required(login_url='/')
def coun_msg_doc(request, id):
    ob1 = chat.objects.filter(fromid__id=id, toid__id=request.session['lid'])
    obb = chat.objects.filter(fromid__id=id, toid__id=request.session['lid'],status='pending')
    for i in obb:

        i.status='viwed'
        i.save()
    ob2 = chat.objects.filter(fromid__id=request.session['lid'], toid__id=id)
    combined_chat = ob1.union(ob2)
    combined_chat = combined_chat.order_by('id')
    res = []
    for i in combined_chat:
        res.append({"from_id": i.fromid.id, "msg": i.msg, "date": i.date, "chat_id": i.id})

    obu = user.objects.get(LOGIN__id=id)

    return JsonResponse({"data": res, "name": obu.name, "photo": obu.image.url, "user_lid": obu.LOGIN.id})


# ------------------------flutter-----------------------

def and_login(request):
    print(request.POST, 'llllllllllll')
    name = request.POST['username']
    pswd = request.POST['password']
    user = login_table.objects.get(username=name, password=pswd)
    if user:

        print("====================================",user.id)
        return JsonResponse({'status': 'ok', 'lid': user.id, 'type': user.type})
    else:
        return JsonResponse({'status': 'invalid'})


def and_register(request):
    print(request.POST, 'hhhhhhhhhhhhhhhhhhhhhhhhhhhh')
    Name = request.POST['name']
    Place = request.POST['place']
    Pin = request.POST['pin']
    Phone = request.POST['phone']
    Email = request.POST['email']
    Username = request.POST['username']
    Password = request.POST['password']
    Image = request.FILES['image']

    fs = FileSystemStorage()
    fp = fs.save(Image.name, Image)

    if login_table.objects.filter(username=Username,password=Password).exists():
        return JsonResponse({'status': '300'})

    a = login_table()
    a.username = Username
    a.password = Password
    a.type = 'user'
    a.save()

    b = user()
    b.LOGIN = a
    b.name = Name
    b.place = Place
    b.pin = Pin
    b.phone = Phone
    b.email = Email
    b.image = fp
    b.save()

    return JsonResponse({'status': 'ok'})


def and_view_profile(request):
    print(request.POST, 'lllllllllll')
    lid = request.POST['lid']
    des = user.objects.get(LOGIN_id=lid)
    return JsonResponse({'status': 'ok', 'name': str(des.name),
                         'place': str(des.place),
                         'email': str(des.email),
                         'phone': str(des.phone),
                         'pin': str(des.pin),
                         'image': request.build_absolute_uri(des.image.url), })


def and_editprofile(request):
    lid = request.POST['lid']
    name = request.POST['name']
    place = request.POST['place']
    post = request.POST['pin']
    phone = request.POST['phone']
    email = request.POST['email']

    # Fetch user profile based on lid
    try:
        profile = user.objects.get(LOGIN_id=lid)
    except user.DoesNotExist:
        return JsonResponse({'status': 'error', 'message': 'User not found'})

        # Update user profile fields
    profile.name = name
    profile.place = place
    profile.pin = post
    profile.phone = phone
    profile.email = email

    # Handle image upload
    print(request.FILES)
    print(request.POST)
    if 'photo' in request.FILES:
        image = request.FILES['photo']
        fs = FileSystemStorage()
        filename = fs.save(image.name, image)
        profile.image = filename  # Assuming your UserProfile has a 'photo' field

    profile.save()  # Save the updated profile
    return JsonResponse({'status': 'ok'})


def user_view_bookings(request):
    lid = request.POST['lid']
    det = booking.objects.filter(USER_ID__LOGIN_id=lid)
    book_data = []
    for i in det:
        book = {
            'bid': i.id,
            # 'image':request.build_absolute_uri(i.OUTFIT.image.url),
            'name': i.USER_ID.name,
            'doctor': i.SCHEDULE_ID.DOCTOR_ID.name,
            'date': str(i.date),
            'status': str(i.status),
            'schedule_date': i.SCHEDULE_ID.date,

        }
        book_data.append(book)
        print(book_data)
    return JsonResponse({"status": "ok", "data": book_data})


def user_view_schedules(request):
    lid = request.POST['lid']
    date=datetime.datetime.now().today()
    det = schedule.objects.filter(date__gte=date )
    # det = schedule.objects.all()
    book_data = []
    for i in det:
        book = {
            'sid': i.id,
            'doctor': i.DOCTOR_ID.name,
            'date': str(i.date),
            'from_time': str(i.from_time),
            'to_time': str(i.to_time),
        }
        book_data.append(book)
        print(book_data)
    return JsonResponse({"status": "ok", "data": book_data})


def book_schedule(request):
    lid = request.POST['lid']
    sid = request.POST['sid']
    print(sid, 'sid', lid, lid)

    hh=booking.objects.filter(USER_ID__LOGIN_id=lid, SCHEDULE_ID_id=sid)
    print(hh,"kkkkkkkkhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhkkk")
    if len(hh)==0:
        a = booking()
        a.SCHEDULE_ID_id = sid
        a.USER_ID = user.objects.get(LOGIN_id=lid)
        a.date = datetime.datetime.today()
        a.status = 'pending'
        a.save()
        return JsonResponse({"status": "ok"})
    else:
        return JsonResponse({"status": "error", "message": "You have already booked this schedule."})


# def user_view_doctor(request):
#     did = request.POST['did']
#     det = doctor.objects.all()
#     book_data = []
#     for i in det:
#         book = {
#             'did': i.id,
#             'image': request.build_absolute_uri(i.image.url),
#             'name': i.name,
#             'email': i.email,
#             'phone': str(i.phone),
#             'experience': str(i.experience),
#             'department': i.department,
#
#         }
#         book_data.append(book)
#         print(book_data)
#     return JsonResponse({"status": "ok", "data": book_data})


# def user_view_trainers(request):
#     tid = request.POST['tid']
#
#     # Fetch all trainers
#     det = yoga_trainer.objects.all()
#     book_data = []
#
#     for i in det:
#         # Get the request status for the current user and trainer
#         try:
#             request_status = trainer_request.objects.get(USER_ID=tid, TRAINER_ID=i.id)
#             status = request_status.status  # Get the status of the request
#         except trainer_request.DoesNotExist:
#             status = 'No Request'  # If no request exists, set the status accordingly
#
#         book = {
#             'tid': i.id,
#             'image': request.build_absolute_uri(i.image.url),
#             'name': i.name,
#             'email': i.email,
#             'phone': str(i.phone),
#             'experience': str(i.experience),
#             'language': i.language,
#             'status': status,  # Include the status in the response
#         }
#
#         book_data.append(book)
#         print(book_data)
#
#     return JsonResponse({"status": "ok", "data": book_data})

def user_view_doctor(request):
    did = request.POST['did']
    det = doctor.objects.all()
    book_data = []
    for i in det:
        ob = chat.objects.filter(toid__id=did,fromid__id=i.LOGIN.id, status='pending')
        name=i.name
        if len(ob)>0:
            name=name+"("+str(len(ob))+")"
        book = {
            'did': i.id,
            'image': request.build_absolute_uri(i.image.url),
            'name': name,
            'email': i.email,
            'phone': str(i.phone),
            'experience': str(i.experience),
            'department': i.department,

        }
        book_data.append(book)
        print(book_data)
    return JsonResponse({"status": "ok", "data": book_data})


def user_view_trainers(request):
    tid = request.POST['tid']

    # Fetch all trainers
    det = yoga_trainer.objects.all()
    book_data = []

    for i in det:
        # Get the request status for the current user and trainer
        try:
            request_status = trainer_request.objects.get(USER_ID=tid, TRAINER_ID=i.id)
            status = request_status.status  # Get the status of the request
        except trainer_request.DoesNotExist:
            status = 'No Request'

        ob = chat.objects.filter(toid__id=tid, fromid__id=i.LOGIN.id, status='pending')
        name = i.name
        if len(ob) > 0:
            name = name + "(" + str(len(ob)) + ")"

        book = {
            'tid': i.id,
            'image': request.build_absolute_uri(i.image.url),
            'name': name,
            'email': i.email,
            'phone': str(i.phone),
            'experience': str(i.experience),
            'language': i.language,
            'status': status,  # Include the status in the response
        }

        book_data.append(book)
        print(book_data)

    return JsonResponse({"status": "ok", "data": book_data})




def trainer_profile(request):
    print(request.POST, 'trainer_profile')

    # Safely get the trainer ID
    tid = request.POST.get('tid', None)

    if tid is None:
        return JsonResponse({'status': 'error', 'message': 'Trainer ID not provided'})

    try:
        trainer = yoga_trainer.objects.get(id=tid)

        # Fetch videos associated with the trainer
        vid = videos.objects.filter(TRAINER_ID=trainer)

        # Prepare video data for the response
        video_data = []
        for video in vid:
            video_data.append({
                'id': video.id,
                'video': request.build_absolute_uri(video.video.url),  # Use absolute URL for video
                'description': video.descriptions,
                'date': video.date.isoformat(),  # Format date as needed
            })
            print(request.build_absolute_uri(video.video.url))

        return JsonResponse({
            'status': 'ok',
            'name': str(trainer.name),
            'place': str(trainer.place),
            'email': str(trainer.email),
            'phone': str(trainer.phone),
            'pin': str(trainer.pin),
            'post': str(trainer.post),
            'language': str(trainer.language),
            'experience': str(trainer.experience),
            'certificate': request.build_absolute_uri(trainer.certificate.url) if trainer.certificate else None,
            'image': request.build_absolute_uri(trainer.image.url) if trainer.image else None,
            'licence': request.build_absolute_uri(trainer.licence.url) if trainer.licence else None,
            'videos': video_data,  # Include the videos in the response
        })
    except yoga_trainer.DoesNotExist:
        return JsonResponse({'status': 'error', 'message': 'Trainer not found'})
    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)})


def user_view_trainer_review(request):
    tid = request.POST['tid']
    print(request.POST)
    ob = trainer_review.objects.filter(TRAINER_id=tid)
    compdata = []
    for i in ob:
        print(i.USER.name)
        data = {
            'tid': str(i.id),
            'date': i.date,
            'user': i.USER.name,
            'review': i.review,
        }
        compdata.append(data)
    print(compdata)
    return JsonResponse({"status": "ok", "data": compdata})


def user_send_trainer_review(request):
    if request.method == "POST":
        print(request.POST, "lllllllll")
        lid = request.POST["lid"]
        tid = request.POST["tid"]
        rev = request.POST["review"]
        print(request.POST)
        try:
            ob = trainer_review()
            ob.USER = user.objects.get(LOGIN_id=lid)
            ob.TRAINER = yoga_trainer.objects.get(id=tid)
            ob.review = rev
            ob.date = datetime.datetime.today()
            ob.save()

            return JsonResponse({"status": "ok"})
        except user.DoesNotExist:
            return JsonResponse({"status": "error", "message": "Client not found."})
    return JsonResponse({"status": "error", "message": "Invalid request method."})


def user_send_trainer_request(request):
    if request.method == "POST":
        print(request.POST, "lllllllll")
        lid = request.POST["lid"]
        tid = request.POST["tid"]
        description = request.POST["description"]
        print(request.POST)
        try:
            ob = trainer_request()
            ob.USER_ID = user.objects.get(LOGIN_id=lid)
            ob.TRAINER_ID = yoga_trainer.objects.get(id=tid)
            ob.status = 'pending'
            ob.description = description
            ob.date = datetime.datetime.today()
            ob.save()

            return JsonResponse({"status": "ok"})
        except user.DoesNotExist:
            return JsonResponse({"status": "error", "message": "Client not found."})
    return JsonResponse({"status": "error", "message": "Invalid request method."})


def user_view_trainer_request(request):
    lid = request.POST['lid']
    print(request.POST)
    ob = trainer_request.objects.filter(USER_ID__LOGIN_id=lid)
    compdata = []
    for i in ob:
        print(i.USER_ID.name)
        data = {
            'lid': str(i.id),
            'date': i.date,
            'trainer': i.TRAINER_ID.name,
            'description': i.description,
            'status': i.status,
        }
        compdata.append(data)
    print(compdata)
    return JsonResponse({"status": "ok", "data": compdata})



def user_view_doc_complaint(request):
    lid = request.POST['lid']
    did=request.POST['did']

    print(request.POST)
    dc = doctor.objects.get(id=did)
    ob = complaint_table.objects.filter(USER_ID__LOGIN_id=lid,LOGIN__id=dc.LOGIN.id)
    compdata = []
    for i in ob:
        print(i.USER_ID.name)
        data = {
            'cid': str(i.id),
            'date': i.date,
            'complaint': i.complaint,
            'reply': i.reply
        }
        compdata.append(data)
    print(compdata)
    return JsonResponse({"status": "ok", "data": compdata})


def user_send_doctor_complaint(request):
    print(request.POST,'jjjjjjjjjjj')
    if request.method == "POST":
        print(request.POST, "lllllllll")
        lid = request.POST["lid"]
        did = request.POST["did"]
        comp = request.POST["complaint"]
        print(request.POST)
        try:
            ob = complaint_table()
            ob.USER_ID = user.objects.get(LOGIN_id=lid)
            dc=doctor.objects.get(id=did)
            ob.LOGIN= dc.LOGIN
            ob.complaint = comp
            ob.reply = "pending"
            ob.date = datetime.datetime.today()
            ob.save()

            return JsonResponse({"status": "ok"})
        except user.DoesNotExist:
            return JsonResponse({"status": "error", "message": "Client not found."})
    return JsonResponse({"status": "error", "message": "Invalid request method."})

def user_view_complaint(request):
    lid = request.POST['lid']
    tid=request.POST['tid']

    print(request.POST)
    dc = yoga_trainer.objects.get(id=tid)
    ob = complaint_table.objects.filter(USER_ID__LOGIN_id=lid,LOGIN__id=dc.LOGIN.id)
    compdata = []
    for i in ob:
        print(i.USER_ID.name)
        data = {
            'cid': str(i.id),
            'date': i.date,
            'complaint': i.complaint,
            'reply': i.reply
        }
        compdata.append(data)
    print(compdata)
    return JsonResponse({"status": "ok", "data": compdata})


def user_send_complaint(request):
    print(request.POST, 'jjjjjjjjjjj')
    if request.method == "POST":
        print(request.POST, "lllllllll")
        lid = request.POST["lid"]
        did = request.POST["tid"]
        comp = request.POST["complaint"]
        print(request.POST)
        try:
            ob = complaint_table()
            ob.USER_ID = user.objects.get(LOGIN_id=lid)
            dc = yoga_trainer.objects.get(id=did)
            ob.LOGIN = dc.LOGIN
            ob.complaint = comp
            ob.reply = "pending"
            ob.date = datetime.datetime.today()
            ob.save()

            return JsonResponse({"status": "ok"})
        except user.DoesNotExist:
            return JsonResponse({"status": "error", "message": "Client not found."})
    return JsonResponse({"status": "error", "message": "Invalid request method."})


def user_delete_comlaint(request):
    print(request.POST, 'kkkkkkkkkkkkkkk')
    cid = request.POST['cid']
    book = complaint_table.objects.get(id=cid)
    book.delete()
    return JsonResponse({'status': 'ok'})


def user_view_prescription(request):
    lid = request.POST['lid']
    print(request.POST)
    ob = prescription_table.objects.filter(BOOK__USER_ID__LOGIN_id=lid)
    compdata = []
    for i in ob:
        print(i.BOOK.USER_ID.name)
        data = {
            'date': i.BOOK.SCHEDULE_ID.date,
            'doctor': i.BOOK.SCHEDULE_ID.DOCTOR_ID.name,
            'prescription': i.pres,
        }
        compdata.append(data)
    print(compdata)
    return JsonResponse({"status": "ok", "data": compdata})




def user_changepassword(request):
    lid = request.POST["lid"]
    cpass = request.POST["old"]
    npass = request.POST["new"]
    conpass = request.POST["confirm"]
    ob = login_table.objects.get(id=lid)
    if ob.password == cpass:
        if npass == conpass:
            ob.password = npass
            ob.save()
            return JsonResponse({'status': 'ok'})
        else:
            return JsonResponse({'status': 'not ok'})
    else:
        JsonResponse({'status': 'not ok'})


def user_send_feedback(request):
    print(request.POST, 'kkkkkkkkkkkkkkk')
    lid = request.POST["lid"]
    did = request.POST["did"]
    feed = request.POST["feed"]  # Use the 'feed' key to match the Dart code
    rating = request.POST['rating']

    ob = review()
    ob.USER = user.objects.get(LOGIN_id=lid)
    ob.DOCTOR_ID = doctor.objects.get(id=did)
    ob.review = feed
    ob.rating = rating
    ob.date = datetime.datetime.now().date()
    ob.save()

    return JsonResponse({"status": "ok"})


def user_delete_bookings(request):
    print(request.POST, 'kkkkkkkkkkkkkkk')
    # lid=request.POST['lid']
    bid = request.POST['bid']
    book = booking.objects.get(id=bid)
    book.delete()
    return JsonResponse({'status': 'ok'})


def doc_profile(request):
    if request.method == 'POST':
        did = request.POST.get('did')  # Safely get the doctor ID
        try:
            des = doctor.objects.get(id=did)
            # Build the response with all required fields
            return JsonResponse({
                'status': 'ok',
                'name': str(des.name),
                'place': str(des.place),
                'email': str(des.email),
                'phone': str(des.phone),
                'pin': str(des.pin),
                'post': str(des.post),
                'language': str(des.language),
                'experience': str(des.experience),
                'certificate': request.build_absolute_uri(des.certificate.url) if des.certificate else None,
                'image': request.build_absolute_uri(des.image.url) if des.image else None,
                'licence': request.build_absolute_uri(des.licence.url) if des.licence else None,
                'department': str(des.department),
            })
        except doctor.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Doctor not found'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    else:
        return JsonResponse({'status': 'error', 'message': 'Invalid request method'})


def fetch_schedule(request):
    did = request.POST['did']
    det = schedule.objects.filter(DOCTOR_ID=did)
    book_data = []
    for i in det:
        book = {
            'sid': i.id,
            'doctor': i.DOCTOR_ID.name,
            'date': str(i.date),
            'from_time': str(i.from_time),
            'to_time': str(i.to_time),
        }
        book_data.append(book)
        print(book_data)
    return JsonResponse({"status": "ok", "data": book_data})

# -------------------chat_with_doctor-----------------

def user_doc_sendchat(request):
    print(request.POST, 'jkjijjjjj')
    FROM_id = request.POST['from_id']
    TOID_id = request.POST['to_id']
    print(FROM_id)
    print(TOID_id)
    msg = request.POST['message']

    from  datetime import datetime
    c = chat()
    c.fromid_id = FROM_id
    x = doctor.objects.get(id=TOID_id)
    c.toid_id = x.LOGIN.id
    c.msg = msg
    c.status = 'pending'
    c.date = datetime.today().now()
    c.save()
    return JsonResponse({'status': "ok"})


# def user_doc_viewchat(request):
#     print(request.POST, 'jkjijjjjj')
#
#     fromid = request.POST["from_id"]
#     td = doctor.objects.get(id=request.POST["to_id"])
#     toid = td.LOGIN.id
#     print(fromid, toid, 'kkkkkkkkkkkkkk')
#
#     # Fetch chat messages between fromid and toid
#     res = chat.objects.filter(Q(fromid=fromid, toid=toid) | Q(fromid=toid, toid=fromid)).order_by('id')
#     messages = []
#
#     for message in res:
#         messages.append({
#             "id": message.id,
#             "msg": message.msg,
#             "from": message.fromid.id,  # Include the id of the sender
#             "to": message.toid.id,  # Include the id of the receiver
#             "date": message.date.isoformat(),  # Use isoformat for date serialization
#         })
#
#     return JsonResponse({"status": "ok", 'data': messages})


def user_doc_viewchat(request):
    print(request.POST, 'jkjijjjjj')

    fromid = request.POST["from_id"]
    td = doctor.objects.get(id=request.POST["to_id"])
    toid = td.LOGIN.id
    print(fromid, toid, 'kkkkkkkkkkkkkk')

    # Fetch chat messages between fromid and toid
    res = chat.objects.filter(fromid=toid, toid=fromid,status='pending')
    for i in res:
        i.status='viwed'
        i.save()
    res = chat.objects.filter(Q(fromid=fromid, toid=toid) | Q(fromid=toid, toid=fromid)).order_by('id')
    messages = []

    for message in res:
        messages.append({
            "id": message.id,
            "msg": message.msg,
            "from": message.fromid.id,  # Include the id of the sender
            "to": message.toid.id,  # Include the id of the receiver
            "date": message.date.isoformat(),  # Use isoformat for date serialization
        })

    return JsonResponse({"status": "ok", 'data': messages})


# --------------chat with trainer-----------------

def user_trainer_sendchat(request):
    if request.method == "POST":
        try:
            FROM_id = request.POST['from_id']
            TOID_id = request.POST['to_id']
            msg = request.POST['message']

            from datetime import datetime
            c = chat()
            c.fromid_id = FROM_id
            x = yoga_trainer.objects.get(id=TOID_id)
            c.toid_id = x.LOGIN.id
            c.msg = msg
            c.date = datetime.now()
            c.save()

            return JsonResponse({'status': "ok", 'data': {
                "msg": msg,
                "from": FROM_id,
                "to": TOID_id,
                "date": c.date.isoformat()
            }})
        except Exception as e:
            return JsonResponse({'status': "error", 'message': str(e)})
def user_trainer_viewchat(request):
    if request.method == "POST":
        try:
            fromid = request.POST["from_id"]
            td = yoga_trainer.objects.get(id=request.POST["to_id"])
            toid = td.LOGIN.id
            res = chat.objects.filter(fromid=toid, toid=fromid, status='pending')
            for i in res:
                i.status = 'viwed'
                i.save()
                res = chat.objects.filter(Q(fromid=fromid, toid=toid) | Q(fromid=toid, toid=fromid)).order_by('id')
                messages = []
                for message in res:
                    messages.append({
                        "id": message.id,
                        "msg": message.msg,
                        "from": message.fromid.id,
                        "to": message.toid.id,
                        "date": message.date.isoformat(),
                            })
            return JsonResponse({"status": "ok", 'data': messages})
        except Exception as e:
            return JsonResponse({'status': "error", 'message': str(e)})




# def user_trainer_viewchat(request):
#     if request.method == "POST":
#         try:
#             fromid = request.POST["from_id"]
#             td = yoga_trainer.objects.get(id=request.POST["to_id"])
#             toid = td.LOGIN.id
#
#             # Fetch chat messages between fromid and toid
#             res = chat.objects.filter(Q(fromid=fromid, toid=toid) | Q(fromid=toid, toid=fromid)).order_by('id')
#             messages = []
#
#             for message in res:
#                 messages.append({
#                     "id": message.id,
#                     "msg": message.msg,
#                     "from": message.fromid.id,
#                     "to": message.toid.id,
#                     "date": message.date.isoformat(),
#                 })
#
#             return JsonResponse({"status": "ok", 'data': messages})
#         except Exception as e:
#             return JsonResponse({'status': "error", 'message': str(e)})


def user_view_tips(request):
    lid = request.POST['lid']
    det = tips_table.objects.all()
    book_data = []
    for i in det:
        book = {
            # 'sid': i.id,
            'trainer': i.TRAINER_ID.name,
            'date': str(i.date),
            'descriptions': str(i.descriptions),
            'tips': str(i.tips),
            }
        book_data.append(book)
    print(book_data)
    return JsonResponse({"status": "ok", "data": book_data})

def user_view_noti(request):
    det = notification.objects.filter(type='user')
    book_data = []
    for i in det:
        book = {
            # 'sid': i.id,
            'date': str(i.date),
            'notification': i.notification,
        }
        book_data.append(book)
    print(book_data)
    return JsonResponse({"status": "ok", "data": book_data})







# ------------------text based symptom----------
import json
import pickle
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt



# Load the model once when the server starts
MODEL_PATH = r"MYAPP/knn_model.sav"
try:
    with open(MODEL_PATH, 'rb') as f:
        model = pickle.load(f)
except Exception as e:
    model = None
    print("Error loading model: {e}")


def symp2_api(request):
    if request.method == 'POST':
        if not model:
            return JsonResponse({"error": "Model not loaded."}, status=500)
        try:
            # Retrieve POST data
            age = request.POST.get("age", "")
            bloodgroup = request.POST.get("blood_group", "")
            height = request.POST.get('height')
            weight = request.POST.get("weight", "")
            TSH = request.POST.get("tsh", "")
            AMH = request.POST.get("amh", "")
            VitD3 = request.POST.get("vit_d3", "")
            BMI = request.POST.get("bmi", "")
            MenstrualCycle = request.POST.get("menstrual_cycle", "")
            marriagestatus = request.POST.get("marriage_status", "")
            pregnent = request.POST.get("pregnant", "")
            abortions = request.POST.get("abortions", "")
            weightgain = request.POST.get("weight_gain", "")
            hairgrowth = request.POST.get("hair_growth", "")
            skindarkning = request.POST.get("skin_darkening", "")
            hairloss = request.POST.get("hair_loss", "")
            pimples = request.POST.get("fast_food", "")
            fastfood = request.POST.get("fast_food", "")
            regexcercise = request.POST.get("regular_exercise", "")
            hips = request.POST.get("hips", "")
            waist = request.POST.get("waist", "")
            menstrulcycle = request.POST.get("menstrual_cycle_days", "")



            # Create the input list for prediction
            lst = [
                str(age), str(bloodgroup), str(weight), str(height), str(TSH),
                str(AMH), str(VitD3), str(BMI), str(MenstrualCycle),
                str(marriagestatus), str(pregnent), str(abortions),
                str(weightgain), str(hairgrowth), str(fastfood),
                str(skindarkning), str(hairloss), str(pimples),
                str(regexcercise), str(hips), str(waist), str(menstrulcycle)
            ]
            print(lst, "eeeee")
            numeric_data = [float(x) if '.' in x else int(x) for x in lst]

            # Now numeric_data contains numeric types
            print(numeric_data)
            # Perform prediction
            re = model.predict([numeric_data])
            print(re, "n")
            if float(re[0]) == 0.0:
                resss = "No"
            else:
                resss = "Yes"

            if resss == 'Yes':
                out='PCOD DETECTED'
            else:
                out='NO PCOD DETECTED'

            # Return JSON response
            return JsonResponse({"data": out})

        except Exception as e:
            print("Error processing request: {e}",e)
            return JsonResponse({"error": str(e)}, status=400)
    else:
        return JsonResponse({"error": "Invalid request method."}, status=405)


# -------image prediction------------
from django.http import JsonResponse
from MYAPP.predict_fn import predict

# @csrf_exempt  # Only use this for testing; add proper CSRF handling for production
def prediction_load_post(request):
    # try:
        if request.method == 'POST' and request.FILES['file']:
            img = request.FILES['file']
            fs = FileSystemStorage()
            fsave = fs.save(img.name, img)
            # path = "C:/Users/user/PycharmProjects/early_PCOD/early_PCOD/media/"+fsave
            path = r"C:\Users\Asus\Downloads\early_PCOD\early_PCOD\media\\"+fsave

            print(path)
            res = predict(path)

            return JsonResponse({"result": res})
    # except Exception as e:
    #     print('error',e)
    # return JsonResponse({"error": "Invalid request"}, status=400)





import subprocess

python_310 = r"C:\Users\Asus\AppData\Local\Programs\Python\Python310\python.exe"
script_310_1 = r"C:\Users\Asus\Downloads\early_PCOD\early_PCOD\MYAPP\cam.py"
# script_310_2 = r"C:\Users\user\PycharmProjects\early_PCOD\early_PCOD\MYAPP\yoga.py"
def posture(request):
    subprocess.run([python_310, script_310_1])
    return HttpResponse('''<script> alert('Exited');window.location='/';</script>''')





def recom(request):
    lid = request.POST['lid']
    print(lid,'lllllll')
    from django.db import connection
    cursor = connection.cursor()
    res=recommendor(lid)
    ob=user.objects.get(LOGIN=lid)
    print(ob.id,"=====",res)
    # cursor.execute("SELECT * FROM hreview_hotel WHERE id IN(SELECT hid_id FROM hreview_feedbacks WHERE uid_id IN(" + res + ") ) AND id NOT IN(SELECT hid_id FROM hreview_feedbacks WHERE uid_id='"+str(ob.id)+"')")
    cursor.execute("SELECT * FROM myapp_doctor WHERE id IN"
                   "(SELECT USER_id FROM myapp_review WHERE DOCTOR_ID_id IN(" + res + ") ) AND id NOT IN(SELECT DOCTOR_ID_id FROM myapp_review WHERE USER_id='" + str(
        ob.id) + "')")


    s = cursor.fetchall()

    print(s,"==================www")
    data = []
    for i in s:

        # r=rating_table.objects.filter(TOID=i[0])
        average_rating = review.objects.filter(DOCTOR_ID=i[0]).aggregate(Avg('rating'))['rating__avg']
        print(average_rating,"-------------------")
        if average_rating is None:
            average_rating = 0
        row = {'did':i[0],'name': i[1], 'place': i[2], "post": i[3], 'phone': i[4],'email': i[5],'image': i[6],
              'average_rating':average_rating }
        data.append(row)
    r = json.dumps(data)
    print(r,"==================")
    return JsonResponse({'status': 'success',"data":data})


def delete_user(request,id):
    user=login_table.objects.get(id=id)
    user.delete()
    return HttpResponse('''<script>alert('User Deleted');window.location='/admin_view_complaint'</script>''')





def yoga_profile(request):
    prf=yoga_trainer.objects.get(LOGIN_id=request.session['lid'])
    return render(request,'yogatrainer/Yoga profile.html',{'details':prf})

def trainer_update(request):
    prf=yoga_trainer.objects.get(LOGIN_id=request.session['lid'])
    print(prf)
    return render(request,'yogatrainer/update_profile.html',{'data':prf})


def trainer_update_post(request):
    profile = yoga_trainer.objects.get(LOGIN_id=request.session['lid'])  # Fetch profile data
    profile.name = request.POST['name']
    profile.email = request.POST['email']
    profile.phone = request.POST['phone']
    profile.place = request.POST['place']
    profile.pin = request.POST['pin']
    profile.post = request.POST['post']
    profile.language = request.POST['language']
    profile.experience = request.POST['experience']
    if 'certificate' in request.FILES:
        profile.certificate = request.FILES['certificate']
    if 'licence' in request.FILES:
        profile.licence = request.FILES['licence']
    if 'image' in request.FILES:
        profile.image = request.FILES['image']

    profile.save()
    return HttpResponse('''<script>alert('Profile Updated');window.location='/yoga_profile'</script>''')



def msg_count(request):
    ob=chat.objects.filter(toid__id=request.GET['id'],status='pending').order_by("-id")
    t="na"
    if len(ob)>0:
        t=ob[0].fromid.type
    print(ob)
    data={'messageCount':str(len(ob)),"t":t}
    return JsonResponse(data)


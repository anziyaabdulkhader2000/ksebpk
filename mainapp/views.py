
from django.shortcuts import render,redirect

from mainapp.models import *
# Create your views here.
from email.message import EmailMessage
import ssl
import smtplib
import random
import string
from datetime import datetime
from dateutil.relativedelta import relativedelta
import pandas as pd

from .external_functions import qr_sender_main,xl_creater

# ----------------------------------------------------------------

def generate_random_password():
    # Define the character sets for letters, digits, and symbols (# * $ % ^ & @ !)
    letters = string.ascii_letters
    digits = string.digits
    symbols = '#*$%^&@!'

    # Generate the random password by randomly selecting 3 letters, 3 digits, and 2 symbols
    random_letters = random.choices(letters, k=3)
    random_digits = random.choices(digits, k=3)
    random_symbols = random.choices(symbols, k=2)

    # Combine the randomly selected characters to form the password
    password = ''.join(random_letters + random_digits + random_symbols)

    # Shuffle the password to randomize the order of characters
    password_list = list(password)
    random.shuffle(password_list)
    password = ''.join(password_list)

    return password


def email_sender(To,Password):
    
    sender = "aswindas.209official@gmail.com"
    password = "zutmiuhnzbauohkd"
    receiver = To

    subject = "Pension Management System Account Set-up"
    body = f"""Password for your newly registered account on Pension Management System is :
                                {Password}
               Do not share your password with others,
               You will receive Transaction ID if admin approves your request.
               Subscribe by completing the transaction and log in.
               You can change your password once logged in. """

    em = EmailMessage()

    em['From'] = sender
    em['To'] = receiver
    em['Subject'] = subject
    em.set_content(body)

    context = ssl.create_default_context()
    with smtplib.SMTP_SSL('smtp.gmail.com',465,context=context) as smtp:
        smtp.login(sender,password)
        smtp.sendmail(sender,receiver,em.as_string())


def calculate_age(birth_date_str):
    # Parse the birth date string into a datetime object
    birth_date = datetime.strptime(birth_date_str, '%d/%m/%Y')
    
    # Get the current date
    current_date = datetime.now()
    
    # Calculate the time difference between the current date and the birth date
    time_difference = current_date - birth_date
    
    # Extract the number of years from the time difference to get the age
    age = time_difference.days // 365  # Approximate age in years
    
    return age




#____________________________________________________________________________________________



def subscribe(request):

    if request.method == 'POST':

        user_id = request.POST.get('user_id')
        user_data = User.objects.get(User_id=user_id)

        entered_trans_id = request.POST.get('transaction_id')
        try:
            Sub_data = Subscription.objects.get(Sub_trans_id=entered_trans_id)

            if Sub_data.Sub_date is None:
                # Get the current date
                current_date = datetime.today()
                Sub_data.Sub_date = current_date.date()
                # Calculate the date exactly one year from today
                next_year_date = current_date + relativedelta(years=1)
                Sub_data.Sub_end = next_year_date.date()
                Sub_data.save()

                user_data.User_Sub = Sub_data
                user_data.save()
                return render(request,'index.html',{'msg':'Thank you for subscribing, You can start using your account now.'})
            
            
            else:
                return render(request,'Subscribe.html',{'user_data' : user_data,"msg":"This Transaction is already completed, if you have any queries, Contact Admin",'user':user_data})
        except:
            return render(request,'Subscribe.html',{'user_data' : user_data,"msg":"Invalid transaction ID,Check your mail for Transaction ID. If you have any queries, Contact Admin",'user':user_data})

def index(request):
    if(request.session.get('role', '')=="super_admin"):
        return render(request,'super_admin/super_admin_home.html',{'msg':""})

    elif(request.session.get('role', '')=="admin"):
        return render(request,'admin/admin_home.html',{'msg':""})

    elif(request.session.get('role', '')=="user"):
        return redirect(user_home)
    newses = News.objects.all()
    return render(request, 'index.html',{'msg':"","newses":newses})

def gallery(request):
    return render(request,"gallery.html",{"msg":""})

def history(request):
    return render(request,"history.html",{"msg":""})

def user_registration(request):
    if request.method == 'POST':
        try:
            data = User()
            data.User_name = request.POST.get('name')
            data.User_phone = request.POST.get('phone')
            data.User_address = request.POST.get('address')
            data.User_email = request.POST.get('email')
            data.User_ARU = request.POST.get('ARU')
            data.User_nomin = request.POST.get('nomin_name')
            data.User_join = request.POST.get('join_date')
            data.User_retire = request.POST.get('retire_date')
            data.User_birth = request.POST.get('birth_date')
            data.User_position = request.POST.get('retired_post')

            password = generate_random_password()

            try :
                email_sender(data.User_email, password)
            except:
                return render(request, 'index.html',{'msg':"Couldn't send Email"})

            data.User_age = calculate_age(data.User_birth)

            if data.User_age >=60:
                pass
            else:
                return render(request, 'index.html',{'msg':"Inapplicable Date of birth, User is not above 60"})
            
            email = request.POST.get('email')
            login.objects.create(email=email, password=password, role="user")

            data.Log_id =login.objects.last()
            data.save()

            return render(request,'index.html', {"msg":" Registration SUCCESSFULL, Password Send To Your Registered Email Account"})

        except:
            message = "Registration DENIED              This may be due to : Email Id is Already existing OR Invalid credentials"
            return render(request,'index.html', {"msg": message})


    return render(request,'registration.html',{'msg':""})

def user_login(request):

    if request.method == 'POST':
        email=request.POST["email"]
        password=request.POST["password"]

        try:
            data=login.objects.get(email = email,password = password )

            if(data.role=="user"):
                request.session['email'] = data.email
                request.session['role'] = data.role
                request.session['id'] = data.log_id
                ids=request.session["id"]
                data = User.objects.get(Log_id = ids)


                if data.User_Sub is None:
                    del request.session['id']
                    del request.session['role']
                    del request.session['email'] 
                    
                    return render(request,'Subscribe.html',{'user' : data,"msg":"Hello {}" .format(data.User_name)})
                
                elif data.User_permitted:
                    return render(request,'user/user_home.html',{'user' : data,"msg":"Hello {}" .format(data.User_name)})
                
                else:
                    del request.session['id']
                    del request.session['role']
                    del request.session['email']                   
                    message = "Could not Login. This may be due to : Admin DENIED Your PERMISSION, Contact Admin for details "
                    return render(request,'index.html',{'msg':message})

        except:
            return render(request, "index.html", {"msg":"Invalid Email Id of Password "})

    return render(request,'user_login.html',{'msg':""})


def logout(request):
    try:
        del request.session['id']
        del request.session['role']
        del request.session['email']
        return render(request, "index.html",{"msg":"Logged out"})

    except:
        return render(request, "index.html",{"msg":"Logged out"})



#-----------------------super_admin-------------------------------------------------------

def super_admin_login(request):
    if request.method == 'POST':
        email=request.POST["email"]
        password=request.POST["password"]

        try:
            data=login.objects.get(email = email,password = password )

            if(data.role=="super_admin"):
                request.session['email'] = data.email
                request.session['role'] = data.role
                request.session['id'] = data.log_id
                ids=request.session["id"]

                return render(request,'super_admin/super_admin_home.html',{'msg':"Welcom Back Super Admin"})
            else:
                return render(request, "super_admin/super_admin_login.html", {"msg":"Only Super Admin can Log in through here"})
        except:
            return render(request, "super_admin/super_admin_login.html", {"msg":"Invalid Email Id of Password "})

        
    return render(request, "super_admin/super_admin_login.html", {"msg":""})

def super_admin_home(request):
    return render(request,'super_admin/super_admin_home.html',{'msg':""})

def super_admin_view_admins(request):
    data = Admin.objects.all()
    return render(request,'super_admin/super_admin_view_admins.html',{'msg':"",'admins':data})

def super_admin_add_admins(request):
    if request.method == 'POST':
        try:
            data = Admin()
            data.Admin_name = request.POST.get('name')
            data.Admin_phone = request.POST.get('phone')
            data.Admin_address = request.POST.get('address')
            data.Admin_email = request.POST.get('email')
            data.Admin_Area = request.POST.get('area')
            data.Admin_position = request.POST.get('position')

            password = generate_random_password()

            # ******************  comment this section for avoiding email sending **************************
            
            try :
                email_sender(data.User_email, password)
            except:
                return render(request, 'super_admin/super_admin_add_admins.html',{'msg':"Could not send Email"})

            #***********************************************************************************************

            email = request.POST.get('email')
            login.objects.create(email=email, password=password, role="admin")

            data.Log_id =login.objects.last()
            if len(request.FILES) != 0:
                data.Admin_Picture = request.FILES['image']

            data.save()

            return render(request,'super_admin/super_admin_add_admins.html', {"msg":" Registration SUCCESSFULL, Password Send To The Registered Email Account"})

        except:
            message = "Registration DENIED. This may be due to : Email Id is Already existing OR Invalid credentials"
            return render(request,'super_admin/super_admin_add_admins.html', {"msg": message})
        
    return render(request,'super_admin/super_admin_add_admins.html',{'msg':""})

def super_admin_view_users(request):
    users = User.objects.all()
    return render(request,'super_admin/super_admin_view_users.html',{'msg':"",'users':users})

def super_admin_user(request,id):
    user = User.objects.get(User_id = id)
    return render(request, "super_admin/super_admin_user.html",{'msg':'','user':user})

def super_admin_view_news(request):
    data = News.objects.all().order_by('-News_date')
    return render(request,'super_admin/super_admin_view_news.html',{'msg':"",'newses':data})

def super_admin_news(request,id):
    news = News.objects.get(News_id = id)
    return render(request, "super_admin/super_admin_news.html",{'msg':'','news':news})


def super_admin_add_news(request):
    if request.method == 'POST':

        data = News()
        data.News_title = request.POST.get('title')
        data.News_content = request.POST.get('content')
        if len(request.FILES) != 0:
            data.News_Picture = request.FILES['image']

        data.News_date = datetime.today()
        data.save()

        return render(request,'super_admin/super_admin_add_news.html', {"msg":"News Added"})

    return render(request,'super_admin/super_admin_add_news.html',{'msg':""})



def super_admin_view_subscriptions(request):
    if request.method == 'POST':

        option = request.POST.get('option')
        from_date = request.POST.get('from_date')
        to_date = request.POST.get('to_date')
        if option == "from":
            users = User.objects.filter(User_Sub__Sub_date__range=(from_date, to_date))
            #Here, the double underscore __ is used to traverse the relationship -
            # from the User model to the related Subscription model and then filter -
            # based on the Sub_date field.
            searched = f"Filtered by Subscription Start Date : {from_date} to {to_date}"
            request.session['searched'] = searched
            request.session['users'] = list(users.values()) 

            return render(request,'super_admin/super_admin_view_subscriptions.html',{'msg':"",'users':users,"searched":searched})
        
        elif option=="upto":
            users = User.objects.filter(User_Sub__Sub_end__range=(from_date, to_date))
            searched = f"Filtered by Subscription End Date : {from_date} to {to_date}"

            request.session['searched'] = searched
            request.session['users'] = list(users.values()) 
            return render(request,'super_admin/super_admin_view_subscriptions.html',{'msg':"",'users':users,"searched":searched})

    users = User.objects.all()
    return render(request,'super_admin/super_admin_view_subscriptions.html',{'msg':"",'users':users})


def download_xml(request):
    title = request.session.get('searched')
    users_data = request.session.get('users', [])
    file_path = r"C:\Users\aswin\Desktop\PMS_files"

    download = xl_creater(title, users_data,file_path)

    users = User.objects.all()
    if download is True:
        return render(request,'super_admin/super_admin_view_subscriptions.html',{'msg':"File saved to device",'users':users})
    else:
        return render(request,'super_admin/super_admin_view_subscriptions.html',{'msg':"Could not save file",'users':users})
 

#---------------------- admin -------------------------------------------------------

def admin_login(request):
    if request.method == 'POST':
        email=request.POST["email"]
        password=request.POST["password"]

        try:
            data=login.objects.get(email = email,password = password )

            if(data.role=="admin"):
                request.session['email'] = data.email
                request.session['role'] = data.role
                request.session['id'] = data.log_id
                ids=request.session["id"]

                return render(request,'admin/admin_home.html',{'msg':"Welcom Back Admin"})
            else:
                return render(request, "admin/admin_login.html", {"msg":"Only Admin can Log in through here"})
        except:
            return render(request, "admin/admin_login.html", {"msg":"Invalid Email Id of Password "})

        
    return render(request, "admin/admin_login.html", {"msg":""})


def admin_home(request):
    return render(request,'admin/admin_home.html',{'msg':""})

def admin_view_news(request):
    data = News.objects.all().order_by("-News_date")
    return render(request,'admin/admin_view_news.html',{'msg':"",'newses':data})

def admin_news(request,id):
    news = News.objects.get(News_id = id)
    return render(request, "admin/admin_news.html",{'msg':'','news':news})


def admin_add_news(request):
    if request.method == 'POST':

        data = News()
        data.News_title = request.POST.get('title')
        data.News_content = request.POST.get('content')
        if len(request.FILES) != 0:
            data.News_Picture = request.FILES['image']

        data.News_date = datetime.today()
        data.save()

        return render(request,'admin/admin_add_news.html', {"msg":"News Added"})

    return render(request,'admin/admin_add_news.html',{'msg':""})

def admin_view_users(request):

    users = User.objects.all()
    return render(request, "admin/admin_view_users.html",{'msg':'','users':users})


def admin_user(request,id):
    user = User.objects.get(User_id = id)
    return render(request, "admin/admin_user.html",{'msg':'','user':user})

def payment_gateway(request,email):

    transaction_id = qr_sender_main(email)  # receiving transaction id from external function

    sub_data = Subscription()

    sub_data.Sub_trans_id = transaction_id  # creating a row in subscription table 
    sub_data.save()

    users = User.objects.all()
    return render(request,"admin/admin_view_users.html",{'msg':'Gateway opened','users':users})




#__________________________  User area  __________________________________________________________________

def user_home(request):

    ids=request.session['id']
    data = User.objects.get(Log_id = ids) 

    if data.User_permitted:
        return render(request,'user/user_home.html',{'user' : data,"msg":""})
    else:
        del request.session['id']
        del request.session['role']
        del request.session['email']                   
        message = "Could not Login. This may be due to : Admin DENIED Your PERMISSION, Contact Admin for details "
        return render(request,'index.html',{'msg':message})

def user_all_news(request):
    newses = News.objects.all()
    ids=request.session['id']
    user = User.objects.get(Log_id = ids) 
    return render(request,'user/user_all_news.html',{"msg":"",'newses':newses,'user':user})


def user_news(request,id):
    news = News.objects.get(News_id = id)
    latest_news = News.objects.all().order_by('-News_date')
    return render(request,'user/user_news.html',{'msg':"",'news':news,'latest_news':latest_news[:3]})
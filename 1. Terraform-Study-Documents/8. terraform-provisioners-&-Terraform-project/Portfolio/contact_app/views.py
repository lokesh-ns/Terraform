from django.shortcuts import render
from django.http import HttpRequest, HttpResponse
from django.core.mail import send_mail

# Create your views here.

def contact(request):
    if request.method == "POST":
        name = request.POST.get('your_name')
        email = request.POST.get('your_email')
        subject = request.POST.get('your_subject')
        message = request.POST.get('your_message')

        data = {
                'name': name,
                'email': email,
                'subject': subject,
                'message': message,
        }
        message = ''' 
        New message: {}

        From: {}
        '''.format(data['message'], data['email'])
        send_mail(data['subject'], message, '', ['lokeshns7476loki@gmail.com'])
        return render(request, 'thanking_template.html')

    # else:
    #     return HttpResponse('Please fill the following contact form to reach me...')

    return render(request, 'contact.html')
# ritlinks
A website that displays a dynamically updated list of the many websites that Rochester Institute of Technology has.
Check it out at [ritlinks.com](http://ritlinks.com)!

## Features
+ Dynamically generated content including links, link names, and descriptions.
+ Administrative accounts to update content with no programming knowledge necessary.
+ An easy to use interface that loads very quickly.
+ Backend using Django for high scalability.
+ Containerized with Docker.
+ Hosted on an Openshift/OKD 4 cluster.

## The Problem
Often new students, or even those who have been enrolled for a while, have trouble figuring out where the information and tools that they need are. It doesn't help that many websites are added, switched out, or removed entirely by RIT every year. This site attemps to alleviate that problem by providing not only a place where students can see the current sites in use, but also has administrative accounts where RIT departments can easily add or remove sites themselves in order to keep everything updated.

## Dependencies
+ Python 3.8.5
+ Django 3.1.2

## Installation
+ Be sure to use a Python virtual environment, such as with virtualenv.
+ In the environment, run
```
pip install requirements.txt
```
+ Then in the project's root directory run
```
python manage.py makemigrations
python manage.py migrate
python manage.py runserver
```
To use a different local IP address or port, simply provide that as an argument to manage.py
```
python manage.py runserver 127.0.0.1:8000
```
Make sure that if you use a different IP address that you change the ALLOWED_HOSTS setting in settings.py to reflect that.

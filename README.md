# ritlinks
A website that displays a dynamically updated list of the many websites that Rochester Institute of Technology has.
Check it out at [ritlinks.com](http://ritlinks.com)!

## Features
- Dynamically generated content including links, link names, and descriptions.
- Administrative accounts to update content.
- An easy to use interface that loads very quickly.
- Backend using Django for high scalability.
- Containerized with Docker.
- Deployed on an Openshift/OKD 4 cluster.

## The Problem
Often new students, or even those who have been enrolled for a while, have trouble figuring out where the information and tools that they need are. It doesn't help that many websites are added, switched out, or removed entirely by RIT every year. This site attemps to alleviate that problem by providing not only a place where students can see the current sites in use, but also has administrative accounts where RIT departments can easily add or remove sites themselves in order to keep everything updated.

## Dependencies
- Python 3.8.5
- Django 3.1.2
- PostgreSQL 12.6+
    - This is for the psycop2 module.
    - Developer tools are needed in some environments.

## Local Installation
- Be sure to use a Python virtual environment, such as with virtualenv.
- In the environment, run
```
pip install requirements.txt
```
- Then in the project's root directory run
```
python manage.py createsuperuser
python manage.py makemigrations
python manage.py migrate
python manage.py runserver
```
To use a different local IP address or port, simply provide that as an argument to manage.py
```
python manage.py runserver 127.0.0.1:8000
```
Make sure that if you use a different IP address that you change the ALLOWED_HOSTS setting in settings.py to reflect that.


## Docker Deployment
- This project requires certain environment variables at build time.
- Run the ``generate_secret_key`` script to generate your secret key.
- Edit the ``bootstrap_env.sh`` script to include that secret key as well as credentials for your database.
    - This script quickly sets all the environment variables the project needs.
- Run (source in this case) the ``bootstrap_env.sh`` script as follows:
    - ``. bootstrap_env.sh``
- Build the image as follows:
    - ``docker build -t ritlinks --build-arg ritlinks_db_pw=${RITLINKS_DB_PW} --build-arg ritlinks_db_host=${RITLINKS_DB_HOST} --build-arg secret_key=${SECRET_KEY} .``
- Run the container as follows:
    - ``docker run -p 0.0.0.0:8000:8000 ritlinks:latest``

## Deploying on Openshift/OKD 4
### General Notes
- It is convenient to create a ConfigMap for all of the secrets.
- Add all the variables via ConfigMap or individually to the following
objects:
    - Deployment
    - BuildConfig
    - ReplicaSet
- The container exposes port 8000 by default.
- Without using environment variables, sensitive secret values can be accessed in the Docker history.  
- Remember to create a Django admin account.

### Web UI Steps:
- Create a new project.
- Create a ConfigMap and fill it with keys and values using the
``bootstrap-env.sh`` script as a reference.
- Add an application, using the "From Git" option is recommended
(for your own fork).
- The recommended builder image is Python, select it if not already.
- Next select either Deployent (recommended) or DeploymentConfig
- Creating a route here is convenient.
    - Set the hostname according to what you set in the settings.py file.
    - Set the port to 8000, or whatever you exposed in the Dockerfile.
    - Make it a secure route with OKD's automatic SSL certs.
- Add the ConfigMap you created to the Deployment and Build Configuration.
- Click create.
- The application should attempt to build, and will be available at the route
that you set.

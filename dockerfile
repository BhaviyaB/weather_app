FROM python:3.7.3-alpine3.9 
#create Directory to workvsd
RUN mkdir -p /app
#To work in that directory
WORKDIR /app
# To copy the requirements file from source to wokring directory
COPY ./requirements.txt /app/requirements.txt
#install teh requirements file using python
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt
# copy the all the file from source to the container
COPY ./ /app/
# creating environment varibale for .py file
ENV FLASK_APP=app.py
#running the python application along with ports
CMD flask run -h 0.0.0 -p 5000


#install --trusted-host pypi.org --trusted-host files.pythonhosted.org pip
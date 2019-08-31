# base image
FROM python:3.7.0

# set working directory
RUN mkdir -p /app
WORKDIR /app

# add requirements (to leverage Docker cache)
ADD ./requirements.txt /app/requirements.txt

ADD . /app/

# Install dependencies
#RUN apt-get install net-tools
RUN pip install -r requirements.txt
RUN ls -al

# install requirements
EXPOSE 80
ENTRYPOINT ["python", "manage.py", "run", "-h" , "0.0.0.0", "-p","80"]

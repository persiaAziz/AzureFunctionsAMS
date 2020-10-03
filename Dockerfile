# To enable ssh & remote debugging on app service change the base image to the one below
# FROM mcr.microsoft.com/azure-functions/python:3.0-python3.8-appservice
FROM mcr.microsoft.com/azure-functions/python:3.0-python3.8

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

RUN apt-get install git -y
RUN apt-get install git gcc libffi-dev g++ unixodbc-dev -y

COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY . /home/site/wwwroot

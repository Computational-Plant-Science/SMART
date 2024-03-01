#Name: Dockerfile
#Version: 1.0
#Summary: Docker recipe file for smart pipeline
#Author: suxing liu
#Author-email: suxingliu@gmail.com
#Created: 2022-10-29

#USAGE:
#docker build -t plant_test -f Dockerfile .
#docker run -v /path to test image:/images -it plant_test
#cd /opt/smart/
#python3 trait_extract_parallel_demo.py -p ~/example/plant_test/ -ft png


FROM ubuntu:22.04

LABEL maintainer='Suxing Liu, Wes Bonelli'

COPY ./ /opt/smart


RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" TZ="America/New_York" apt-get install -y \
    apt-utils \
    build-essential \
    python3-setuptools \
    python3 \
    python3-pip \
    python3-numexpr \
    libgl1-mesa-glx \
    libsm6 \
    libxext6 \
    cmake-gui \
    nano \
    libdmtx0b
    


RUN python3 -m pip install --upgrade pip 

ENV PIP_ROOT_USER_ACTION=ignore


RUN pip3 install numpy \
    Pillow \
    scipy \
    scikit-image \
    scikit-learn \
    matplotlib \
    pandas \
    pytest \
    opencv-python-headless \
    openpyxl \
    imutils \
    numba \
    skan \
    tabulate \
    pylibdmtx \
    psutil \
    natsort \
    pathlib \
    pandas 


RUN python3 -m pip install --upgrade Pillow

RUN chmod -R a+rwx /opt/smart/

WORKDIR /opt/smart/




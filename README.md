# Speedy Measurement of Arabidopsis Rosette Traits (SMART)

Author: Suxing Liu

![CI](https://github.com/Computational-Plant-Science/arabidopsis-rosette-analysis/workflows/CI/badge.svg)

![Optional Text](../master/media/Smart.png) 

Robust and parameter-free plant image segmentation and trait extraction.

1. Process with plant image top view, including whole tray plant image, this tool will segment it into individual images.
2. Robust segmentation based on parameter-free color clustering method.
3. Extract individual plant gemetrical traits, and write output into excel file.


## Requirements

Input images: Top view of individual plant tray images, default in *.jpg format. 


![Optional Text](../master/media/image_01.png)

![Optional Text](../master/media/Slide1.png)

![Optional Text](../master/media/Slide2.png)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Contents**

- [Requirements](#requirements)
- [Usage](#usage)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->



## Usage in local environment by cloning the whole GitHub repo 

sample test

Input: Individual plant top view images, in jpg or png format

Output: Realted folders with same name of inout image files, which contains image results

and trait.xlsx and trait.csv for summary of traits computation results. 


Input image requirement:

Plant top view image captured by HD resolution RGB camera, prefer black background with even illumination environment. 

Example input can be downled from "/sample_test/" folder, which contains top view images of a same Arabidopsis plant from different timepoints. 


1. Download the repo into local host PC:

```bash

    git clone https://github.com/Computational-Plant-Science/SMART.git

```

   Now you should have a clone of the SMART pipeine source code in your local PC, the folder path was:
```
   /$host_path/SMART/
   
    Note: $host_path can be any path chosen by user. 
```

2. Prepare your input image folder path,

   here we use the sample images inside the repo as input, the path was:
```
   /$host_path/SMART/sample_test/
```

2. extract traits:

```bash

   cd /$host_path/SMART/

   python3 /opt/smart/core/trait_extract_parallel_demo.py -p /$host_path/SMART/sample_test/ `

```
Results will be generated in the same input folder, however, user can specify the output folder by adding "-r /path/to/output/folder"

Default input image type as jpg, can be changed by adding parameter such as " -ft png".

E.g. 

```bash

   python3 /opt/smart/core/trait_extract_parallel_demo.py -p /$host_path/$inout_image_folder/ -ft png -r /$path_to_output_folder/`

```


## Usage for Docker contianer 


[Docker](https://www.docker.com/) is suggested to run this project in a Unix environment.

1. Download prebuilt docker container from DockerHub 

```bash

    docker pull computationalplantscience/smart

    docker run -v /$path_to_test_image:/images -it computationalplantscience/smart

Note: The "/" at the end of the path was NOT needed when mounting a host directory into a Docker container. Above command mount the local directory "/$path_to_test_image" inside the container path "/images"
Reference: https://docs.docker.com/storage/bind-mounts/
```

For example, to run the sample test inside this repo, under the folder "sample_test", first locate the local path 
```
    docker run -v /$path_to_SMART_repo/SMART/sample_test:/images -it computationalplantscience/smart
```

    then run the mounted input images inside the container:
``` 
    python3 /opt/smart/core/trait_extract_parallel_demo.py -p /images/ -ft jpg
```
    or 
```
    docker run -v /$path_to_SMART_repo/SMART/sample_test:/images -it computationalplantscience/smart  python3 /opt/smart/core/trait_extract_parallel_demo.py -p /images/ -ft jpg
```

2. Build your local container

```bash

    docker build -t smart_container -f Dockerfile .

    docker run -v  /home/suxing/SMART/sample_test:/images -it smart_container

```

Results will be generated in the same input folder, trait.xlsx and trait.csv contains traits computation results.

The other folde with the same name of inout images contains all related image results for visualization purpose. 

They are processed copies of the original images, all the image content information was processed and extracted as traits inforamtion. 

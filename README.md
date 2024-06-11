# SMART: Speedy Measurement of Arabidopsis Rosette Traits

Speedy Measurement of Arabidopsis Rossette Traits for time-course monitoring morphological and physiological development

Plant phenotyping using computer vision: Compute geometrical traits and analyze plant surface colors

Author: Suxing Liu


##



![Optional Text](../main/media/Smart.png) 

Robust and parameter-free plant image segmentation and trait extraction.

1. Process with plant image top view, including whole tray plant image, this tool will segment it into individual images.
2. Robust segmentation based on parameter-free color clustering method.
3. Extract individual plant geometrical traits, and write output into an Excel file.


## Sample workflow

![Pipeline](../main/media/Slide1.png)

![Leaf surface color analysis](../main/media/Slide2.png)

![Plant color analysis using Color Checker](../main/media/Slide3.png)

![Monitor plant growth](../main/media/monitor_time_growth.gif)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Contents**

<!-- END doctoc generated TOC please keep comment here to allow auto-update -->




## Inputs 

   Individual plant tray image from top view, captured by ANY modern digital camera. 

## Results 

trait.xlsx, trait.csv

Excel or csv file which contains trait computation values.

## Traits summary

![Pipeline](../main/media/traits_summary.png)


## Usage in the local environment by cloning the whole GitHub repo 

sample test

Input: Individual plant top view images, in jpg or png format

Output: Realted folders with the same name of input image files, which contain image results

and trait.xlsx and trait.csv for a summary of trait computation results. 


Input image requirement:

Plant top view image captured by HD resolution RGB camera, prefer a black background with even illumination environment. 

Example input can be downloaded from the "/sample_test/" folder, which contains top-view images of the same Arabidopsis plant from different time points. 


1. Download the repo into the local host PC:

```bash

    git clone https://github.com/Computational-Plant-Science/SMART.git

```

   Now you should have a clone of the SMART pipeline source code in your local PC, the folder path was:
```
   /$host_path/SMART/
   
    Note: $host_path can be any path chosen by the user. 
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
Results will be generated in the same input folder, however, the user can specify the output folder by adding "-r /path/to/output/folder"

The default input image type jpg, can be changed by adding a parameter such as " -ft png".

E.g. 

```bash

   python3 /opt/smart/core/trait_extract_parallel_demo.py -p /$host_path/$inout_image_folder/ -ft png -r /$path_to_output_folder/`

```


## Usage for Docker container 


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

Results will be generated in the same input folder, trait.xlsx and trait.csv, which contains trait computation results.

The other folder with the same name of input images contains all related image results for visualization purposes. 

They are processed copies of the original images, all the image content information was processed and extracted as traits information. 


## Collaboration


The SMART pipeline has been integrated into CyVerse cloud computing-based website: PlantIT (https://plantit.cyverse.org/)

CyVerse users can upload data and run the SMART pipeline for free. 


The SMART pipeline has also been applied in collaboration with following research institutes and companies: 

1. Dr. David G. Mendoza-Cozatl at [University of Missouri](https://cafnr.missouri.edu/person/david-mendoza-cozatl/)

2. Dr. Kranthi Varala at [Purdue University](https://www.purdue.edu/gradschool/pulse/groups/profiles/faculty/varala.html) 

3. Dr. Filipe Matias at [Syngenta](https://www.linkedin.com/in/filipe-matias-27bab5199/)

4. Dr. Tara Enders at [Hofstra University](https://sites.google.com/view/enders-lab/people?pli=1)

5. Briony Parker at [Rothamsted Research](https://repository.rothamsted.ac.uk/staff/98225/briony-parker)

6. Dr. Fiona L. Goggin at [University of Arkansas](https://enpl.uark.edu/people/faculty/uid/fgoggin/name/Fiona+Goggin/)


<br/><br/> 


## Imaging protocol for SMART


![Optional Text](../main/media/plant.jpg)

Setting up plants

    1. Place one plant in one tray.
    2. Use black color mesh to cover the soil.
    3. Place the maker object on the left corner of the tray.
    4. Prefer the plant did not grow out of the boundaries of the tray.




![Optional Text](../main/media/camera.jpg)

Setting up camera

    1. The camera lens should be parallel to the plant surface to capture an undistorted top view. 
    2. The plant object should be in the center of the image and within the focus of the camera lens.
    3. The depth of field should cover the different layers of the plant leaves. 
    4. Higher resolution (e.g., an 8-megapixel camera produces a file size that is 2448 x 3264 PPI) is suggested to acquire clear and sharp image data.



Setting up the lighting environment

    1. Diffuse lighting is suggested. 
    2. Reduce shadow as much as possible.
    3. Keep the illumination environment constant between imaging different plants. 
    4. Avoid overexposure and reflection effects.



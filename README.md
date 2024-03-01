# Speedy Measurement of Arabidopsis Rosette Traits (SMART)

Author: Suxing Liu

![CI](https://github.com/Computational-Plant-Science/arabidopsis-rosette-analysis/workflows/CI/badge.svg)

![Optional Text](../master/media/Smart.png) 

Robust and parameter-free plant image segmentation and trait extraction.

1. Process with plant image top view, including whole tray plant image, this tool will segment it into individual images.
2. Robust segmentation based on parameter-free color clustering method.
3. Extract individual plant gemetrical traits, and write output into excel file.


## Requirements

Either [Docker](https://www.docker.com/) or [Singularity](https://sylabs.io/singularity/) is required to run this project in a Unix environment.

Input images: Top view of individual plant tray images, default in *.jpg format. 

## Usage

### Docker

```bash
docker pull computationalplantscience/smart
docker run -v "$(pwd)":/opt/arabidopsis-rosette-analysis -w /opt/arabidopsis-rosette-analysis computationalplantscience/arabidopsis-rosette-analysis python3 /opt/arabidopsis-rosette-analysis/trait_extract_parallel.py -i input -o output -ft "jpg,png"
```

### Singularity

```bash
singularity exec docker://computationalplantscience/arabidopsis-rosette-analysis python3 trait_extract_parallel.py -i input -o output -ft "jpg,png"
```

![Optional Text](../master/media/image_01.png)

![Optional Text](../master/media/Slide1.png)

![Optional Text](../master/media/Slide2.png)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Contents**

- [Requirements](#requirements)
- [Usage](#usage)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Requirements

The easiest way to run this project is with [Docker](https://www.docker.com/) or [Singularity ](https://sylabs.io/singularity/).

To pull the `computationalplantscience/smart` image, the current working directory, and open a shell with Docker:

`docker run -it -v $(pwd):/opt/dev -w /opt/dev computationalplantscience/smart bash`

Singularity users:

`singularity shell docker://computationalplantscience/smart`

## Usage

sample test

Input: Individual plant top view images, in jpg or png format

Output: Realted folders with same name of inout image files, which contains image results

and trait.xlsx and trait.csv for summary of traits computation results. 




Input image requirement:

Plant top view image captured by HD resolution RGB camera, prefer black background with even illumination environment. 

Example input can be downled from "/sample_test/" folder, which contains top view images of a same Arabidopsis plant from different timepoints. 


You can pass a folder path (`-p /path/to/dir`). By default any `JPG` and `PNG` are included. You can choose filetype explicitly with e.g. `-ft jpg`.

To extract traits:

`python3 /opt/smart/core/trait_extract_parallel_demo.py -p /path/to/input/file -r /path/to/output/folder`

You can also use a folder path as above, likewise for filetype specification.

By default this script will not perform leaf segmentation and analysis. To enable leaf analysis, use the `-l` flag.

To indicate that your input is a multiple-tray or -individual photo, add the `-m` flag.



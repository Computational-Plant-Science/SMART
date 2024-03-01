# SMART: Speedy Measurement of Arabidopsis Rosette Traits

Author: Suxing Liu

![CI](https://github.com/Computational-Plant-Science/SMART/workflows/CI/badge.svg)

Robust and parameter-free top-down plant image segmentation and trait extraction.

1. Process with plant image top view, including whole tray plant image, this tool will segment it into individual images.
2. Robust segmentation based on parameter-free color clustering method.
3. Extract individual plant gemetrical traits, and write output into excel file.

![Optional Text](../master/media/image_01.png)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Contents**

- [Requirements](#requirements)
- [Usage](#usage)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Requirements

The easiest way to run this project in a Unix environment is with [Docker](https://www.docker.com/) or [Singularity ](https://sylabs.io/singularity/).

For instance, to pull the `computationalplantscience/smart` image, mount the current working directory, and open a shell:

`docker run -it -v $(pwd):/opt/dev -w /opt/dev computationalplantscience/smart bash`

Singularity users:

`singularity shell docker://computationalplantscience/smart`

## Usage

To perform color segmentation:

`python3 /opt/smart/core/color_seg.py -p /path/to/input/folder -r /path/to/output/folder -ft jpg,png`

To extract traits:

`python3 /opt/smart/core/trait_extract_parallel_ori.py -p /path/to/input/folder -r /path/to/output/folder -ft jpg,png`

# Speedy Measurement of Arabidopsis Rosette Traits (SMART)

Author: Suxing Liu


![CI](https://github.com/Computational-Plant-Science/SMART/workflows/CI/badge.svg)
[![GitHub tag](https://img.shields.io/github/tag/Computational-Plant-Science/SMART.svg)](https://github.com/Computational-Plant-Science/SMART/tags/latest)

[![PyPI Version](https://img.shields.io/pypi/v/smart-arabidopsis-traits.png)](https://pypi.python.org/pypi/smart-arabidopsis-traits)
[![PyPI Status](https://img.shields.io/pypi/status/smart-arabidopsis-traits.png)](https://pypi.python.org/pypi/smart-arabidopsis-traits)
[![PyPI Versions](https://img.shields.io/pypi/pyversions/smart-arabidopsis-traits.png)](https://pypi.python.org/pypi/smart-arabidopsis-traits)

![Optional Text](../master/media/Smart.png) 

Robust and parameter-free plant image segmentation and trait extraction.

1. Process with plant image top view, including whole tray plant image, this tool will segment it into individual images.
2. Robust segmentation based on parameter-free color clustering method.
3. Extract individual plant gemetrical traits, and write output into excel file.

![Optional Text](../master/media/image_01.png)

![Optional Text](../master/media/slides/Slide1.png)

![Optional Text](../master/media/slides/Slide2.png)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Speedy Measurement of Arabidopsis Rosette Traits (SMART)](#speedy-measurement-of-arabidopsis-rosette-traits-smart)
  - [Requirements](#requirements)
  - [Installation](#installation)
    - [Python](#python)
    - [Docker](#docker)
    - [Apptainer](#apptainer)
  - [Quickstart](#quickstart)
    - [Docker](#docker-1)
    - [Apptainer](#apptainer-1)
  - [Usage](#usage)
    - [Input](#input)
    - [Output](#output)
    - [Filetypes](#filetypes)
    - [Flags](#flags)
  - [Input image guidelines](#input-image-guidelines)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Requirements

Python3.8+ is required to run SMART directly. Alternatively, a [Docker](https://www.docker.com/) [image definition](https://hub.docker.com/r/computationalplantscience/smart) is provided.

## Installation

### Python

SMART is available on the Python Package Index. To install it use:

```shell
pip install smart-arabidopsis-traits
```

### Docker

```shell
docker pull computationalplantscience/smart
```

### Apptainer

```shell
apptainer pull docker://computationalplantscience/smart
```

## Quickstart

A few sample photos are baked into the Docker image definition. If you have installed SMART with `pip`, you will need to manually download the photos or clone this repository before running the example below.

### Docker

```bash

docker run \
  -w /opt/smart \
  computationalplantscience/smart \
  python3 trait_extract_parallel.py -i sample_test -o output -ft "jpg,png"
```

### Apptainer

```bash
apptainer exec \
  -H /opt/smart \
  docker://computationalplantscience/smart \
  python3 trait_extract_parallel.py -i sample_test -o output -ft "jpg,png"
```

## Usage

The `trait_extract_parallel.py` script is this repository's main entry point. It accepts the following options:

- `-i`: the input file or directory
- `-o`: the output directory
- `-ft`: input filetypes (optional)
- `-l`: enable leaf analysis (optional)
- `-m`: toggle multiple plant detection (optional)

### Input

The input file or directory path. This parameter is required.

### Output

The path to the directory to write output files to. Output files include a number of PNG images, as well as traits extracted from the input images (written to `trait.csv` and `trait.xlsx`).

If no output directory path is provided, results are written to the current working directory.

### Filetypes

By default, JPG and PNG files are included. 

### Flags

By default this script will not perform leaf segmentation and analysis. To enable leaf analysis, use the `-l` flag.

To indicate that your input photo(s) contain(s) multiple plants or trays of plants, add the `-m` flag.

## Input image guidelines

Images should be captured top-down with an HD resolution RGB camera. Black background and even illumination are recommended for best results.

High-quality sample input images are available in the `sample_test` folder. This folder contains images of an Arabidopsis rosette at different growth stages.

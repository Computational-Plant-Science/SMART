#!/bin/bash

python3 /opt/smart/core/trait_extract_parallel_demo.py -p $INPUT -o $OUTPUT 


# copy nested output files to working directory
find . -type f -name "*.xlsx" -exec cp {} $WORKDIR \;

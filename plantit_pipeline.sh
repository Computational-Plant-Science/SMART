#!/bin/bash

python3 /opt/smart/core/color_seg.py -p $INPUT
python3 /opt/smart/core/trait_extract_parallel_ori.py -p $INPUT -m $MULTIPLE -l

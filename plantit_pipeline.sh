#!/bin/bash

#python3 /opt/smart/core/color_seg.py -p $INPUT
#python3 /opt/smart/core/trait_extract_parallel_demo.py -p $INPUT -m $MULTIPLE -l

python3 /opt/smart/core/trait_extract_parallel_demo.py -p $INPUT -ft $FILETYPE -s $COLOR-SPACE -c $CHANNELS -n $NUM_CLUSTERS -min $MIN_SIZE -min $MAX_SIZE -md $MIN_DIST -da $DIAGONAL -cc $CUE_COLOR -cl $CUE_LOC -ob $OUT_BOUNDARY




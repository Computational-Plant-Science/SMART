#!/bin/bash

#python3 /opt/smart/core/color_seg.py -p $INPUT
#python3 /opt/smart/core/trait_extract_parallel_demo.py -p $INPUT -m $MULTIPLE -l

python3 /opt/smart/core/trait_extract_parallel_demo.py -p $INPUT -o $OUTPUT --color_space $COLOR_SPACE --channels $CHANNELS --num_clusters $NUM_CLUSTERS --min_size $MIN_SIZE --max_size $MAX_SIZE --min_dist $MIN_DIST --diagonal $DIAGONAL 



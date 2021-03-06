#!/bin/bash

case=$2    # $2 is ${case}, $3 is ${case}.t2w-brain.nrrd 

T2=$(eval echo $(<config/T2))
t2nii=/tmp/$(basename $T2).nii.gz
t2brainnii=/tmp/${case}.t2w-brain.nii.gz

ConvertBetweenFileFormats $T2 $t2nii

bet ${t2nii} ${t2brainnii} -m -f 0.50
ConvertBetweenFileFormats ${t2brainnii} ${3}
rm $t2nii ${t2brainnii}

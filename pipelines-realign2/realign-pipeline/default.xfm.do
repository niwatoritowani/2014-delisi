case=$2
T1=$(eval echo $(<config/REALIGN_T1))
T2=$(eval echo $(<config/T2))

#redo-ifchange config/REALIGN_T1 config/T2 $T1 $T2

t1nii=/tmp/$(basename $T1).nii.gz
t2nii=/tmp/$(basename $T2).nii.gz
t2realign=$2-t2w-realign.nrrd

ConvertBetweenFileFormats $T1 $t1nii
ConvertBetweenFileFormats $T2 $t2nii
fslswapdim $t1nii LR AP SI $t1nii >/dev/null || true 
fslswapdim $t1nii RL AP SI $t1nii >/dev/null || true
fslswapdim $t2nii LR AP SI $t2nii >/dev/null || true
fslswapdim $t2nii RL AP SI $t2nii >/dev/null || true
flirt -dof 6 -in $t2nii -ref $t1nii -omat $3 -o $t2realign.nii.gz && \
fslswapdim $t2realign.nii.gz  AP SI LR $t2realign.nii.gz >/dev/null || true # jun added
fslswapdim $t2realign.nii.gz  AP SI RL $t2realign.nii.gz >/dev/null || true # jun added
ConvertBetweenFileFormats $t2realign.nii.gz $t2realign # && \
rm $t2nii $t1nii $t2realign.nii.gz

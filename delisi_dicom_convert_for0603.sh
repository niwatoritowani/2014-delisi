#!/bin/bash

#  Script.sh
#  
#
#  Created by Gabriëlla Blokland on 1/22/15.
#

ORIG_DIR=/rfanfs/pnl-a/pnl/Collaborators/Delisi
DATA_DIR=/rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/data
SUBJECTS_DIR=/rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/subjects

if [ ! -d ${DATA_DIR} ]; then mkdir -p ${DATA_DIR}; fi
if [ ! -d ${SUBJECTS_DIR} ]; then mkdir -p ${SUBJECTS_DIR}; fi

for subject in DELISI_HM_0603 ; do

#    mkdir -p ${DATA_DIR}/${subject}/T1_dcm/
#    mkdir -p ${DATA_DIR}/${subject}/T2_dcm/
#    mkdir -p ${DATA_DIR}/${subject}/T1/
#    mkdir -p ${DATA_DIR}/${subject}/T2/

    if [ ${subject} != "DELISI_HM_2803" ] && [ ${subject} != "DELISI_HM_3703" ] && [ ${subject} != "DELISI_HM_4403" ] && [ ${subject} != "DELISI_HM_5903" ] && [ ${subject} != "DELISI_HM_8103" ]; then
        cp ${ORIG_DIR}/${subject}/dicom/4-*.dcm.gz ${DATA_DIR}/${subject}/T1_dcm/
        cp ${ORIG_DIR}/${subject}/dicom/5-*.dcm.gz ${DATA_DIR}/${subject}/T2_dcm/
#    elif [ ${subject} == "DELISI_HM_2803" ]; then
#        cp ${ORIG_DIR}/${subject}/dicom/*-7-*.dcm.gz ${DATA_DIR}/${subject}/T1_dcm/
#        cp ${ORIG_DIR}/${subject}/dicom/*-8-*.dcm.gz ${DATA_DIR}/${subject}/T2_dcm/
#    elif [ ${subject} == "DELISI_HM_3703" ]; then
#        cp ${ORIG_DIR}/${subject}/dicom/*-7-*.dcm.gz ${DATA_DIR}/${subject}/T1_dcm/
#        cp ${ORIG_DIR}/${subject}/dicom/*-8-*.dcm.gz ${DATA_DIR}/${subject}/T2_dcm/
#    elif [ ${subject} == "DELISI_HM_4403" ]; then
#        cp ${ORIG_DIR}/${subject}/dicom/*-7-*.dcm.gz ${DATA_DIR}/${subject}/T1_dcm/
#        cp ${ORIG_DIR}/${subject}/dicom/*-15-*.dcm.gz ${DATA_DIR}/${subject}/T2_dcm/
#    elif [ ${subject} == "DELISI_HM_5903" ]; then
#        cp ${ORIG_DIR}/${subject}/dicom/*-7-*.dcm.gz ${DATA_DIR}/${subject}/T1_dcm/
#        cp ${ORIG_DIR}/${subject}/dicom/*-8-*.dcm.gz ${DATA_DIR}/${subject}/T2_dcm/
#    elif [ ${subject} == "DELISI_HM_8103" ]; then
#        cp ${ORIG_DIR}/${subject}/dicom/*-12-*.dcm.gz ${DATA_DIR}/${subject}/T1_dcm/
#        #cp ${ORIG_DIR}/${subject}/dicom/*-8-*.dcm.gz ${DATA_DIR}/${subject}/T2_dcm/
#    else
#        echo "something else is going on"
    fi
#
#    #subject 2803 (T1 is series 7; T2 is series 8),
#    #subject 3703 (T1 is series 7; T2 is series 8),
#    #subject 4403 (T1 is series 7; T2 is series 15),
#    #subject 5903 (T1 is series 7; T2 is series 8),
#    #subject 8103 (T1 is series 12; T2 is missing)
#
    gunzip -f ${DATA_DIR}/${subject}/T1_dcm/*.dcm.gz
#    #scan="`ls -1 ${DATA_DIR}/${subject}/T1_dcm/ | head -n 1`"
#    #recon-all -i ${DATA_DIR}/${subject}/T1_dcm/${scan} -subjid ${subject}
#    #mri_convert ${DATA_DIR}/${subject}/T1_dcm/${scan} ${DATA_DIR}/${subject}/T1/T1.nii.gz
#    #dcm2nii -o ${DATA_DIR}/${subject}/T1/ -d n -e n -g y -i n -p n ${DATA_DIR}/${subject}/T1_dcm/${scan} 
    ConvertBetweenFileFormats ${DATA_DIR}/${subject}/T1_dcm ${DATA_DIR}/${subject}/T1/${subject}-T1.nrrd

    if [ ${subject} != "DELISI_HM_8103" ]; then
        gunzip -f ${DATA_DIR}/${subject}/T2_dcm/*.dcm.gz
#        #scan="`ls -1 ${DATA_DIR}/${subject}/T2_dcm/ | head -n 1`"
#        #mri_convert ${DATA_DIR}/${subject}/T2_dcm/${scan} ${DATA_DIR}/${subject}/T2/T2.nii.gz
#	#dcm2nii -o ${DATA_DIR}/${subject}/T2/ -d n -e n -g y -i n -p n ${DATA_DIR}/${subject}/T2_dcm/${scan} 
        ConvertBetweenFileFormats ${DATA_DIR}/${subject}/T2_dcm ${DATA_DIR}/${subject}/T2/${subject}-T2.nrrd
    fi
done

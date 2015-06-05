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

for subject in DELISI_HM_2003 DELISI_HM_3503 DELISI_HM_5403 DELISI_HM_6803 DELISI_HM_8203 DELISI_HM_0403 DELISI_HM_2103 DELISI_HM_3603 DELISI_HM_5503 DELISI_HM_6903 DELISI_HM_8303 DELISI_HM_0503 DELISI_HM_2203 DELISI_HM_3703 DELISI_HM_5603 DELISI_HM_7003 DELISI_HM_8403 DELISI_HM_0603 DELISI_HM_2303 DELISI_HM_3903 DELISI_HM_5703 DELISI_HM_7103 DELISI_HM_8503 DELISI_HM_0703 DELISI_HM_2403 DELISI_HM_4203 DELISI_HM_5803 DELISI_HM_7203 DELISI_HM_8603 DELISI_HM_0703_2 DELISI_HM_2503 DELISI_HM_4303 DELISI_HM_5903 DELISI_HM_7303 DELISI_HM_8703 DELISI_HM_0903 DELISI_HM_2803 DELISI_HM_4403 DELISI_HM_6003 DELISI_HM_7403 DELISI_HM_8803 DELISI_HM_1003 DELISI_HM_2903 DELISI_HM_4503 DELISI_HM_6103 DELISI_HM_7503 DELISI_HM_8903 DELISI_HM_11_03 DELISI_HM_3003 DELISI_HM_4703 DELISI_HM_6203 DELISI_HM_7603 DELISI_HM_1103 DELISI_HM_3103 DELISI_HM_4803 DELISI_HM_6303 DELISI_HM_7703 DELISI_HM_1203 DELISI_HM_3203 DELISI_HM_4903 DELISI_HM_6403 DELISI_HM_7803 DELISI_HM_1303 DELISI_HM_3203_2 DELISI_HM_5103 DELISI_HM_6503 DELISI_HM_7903 DELISI_HM_1403 DELISI_HM_3303 DELISI_HM_5203 DELISI_HM_6603 DELISI_HM_8003 DELISI_HM_1703 DELISI_HM_3403 DELISI_HM_5303 DELISI_HM_6703 DELISI_HM_8103; do

#    mkdir -p ${DATA_DIR}/${subject}/T1_dcm/
#    mkdir -p ${DATA_DIR}/${subject}/T2_dcm/
#    mkdir -p ${DATA_DIR}/${subject}/T1/
#    mkdir -p ${DATA_DIR}/${subject}/T2/

#    if [ ${subject} != "DELISI_HM_2803" ] && [ ${subject} != "DELISI_HM_3703" ] && [ ${subject} != "DELISI_HM_4403" ] && [ ${subject} != "DELISI_HM_5903" ] && [ ${subject} != "DELISI_HM_8103" ]; then
#        cp ${ORIG_DIR}/${subject}/dicom/*-4-*.dcm.gz ${DATA_DIR}/${subject}/T1_dcm/
#        cp ${ORIG_DIR}/${subject}/dicom/*-5-*.dcm.gz ${DATA_DIR}/${subject}/T2_dcm/
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
#    fi
#
#    #subject 2803 (T1 is series 7; T2 is series 8),
#    #subject 3703 (T1 is series 7; T2 is series 8),
#    #subject 4403 (T1 is series 7; T2 is series 15),
#    #subject 5903 (T1 is series 7; T2 is series 8),
#    #subject 8103 (T1 is series 12; T2 is missing)
#
#    gunzip -f ${DATA_DIR}/${subject}/T1_dcm/*.dcm.gz
#    #scan="`ls -1 ${DATA_DIR}/${subject}/T1_dcm/ | head -n 1`"
#    #recon-all -i ${DATA_DIR}/${subject}/T1_dcm/${scan} -subjid ${subject}
#    #mri_convert ${DATA_DIR}/${subject}/T1_dcm/${scan} ${DATA_DIR}/${subject}/T1/T1.nii.gz
#    #dcm2nii -o ${DATA_DIR}/${subject}/T1/ -d n -e n -g y -i n -p n ${DATA_DIR}/${subject}/T1_dcm/${scan} 
    ConvertBetweenFileFormats ${DATA_DIR}/${subject}/T1_dcm ${DATA_DIR}/${subject}/T1/${subject}-T1.nrrd

    if [ ${subject} != "DELISI_HM_8103" ]; then
#        gunzip -f ${DATA_DIR}/${subject}/T2_dcm/*.dcm.gz
#        #scan="`ls -1 ${DATA_DIR}/${subject}/T2_dcm/ | head -n 1`"
#        #mri_convert ${DATA_DIR}/${subject}/T2_dcm/${scan} ${DATA_DIR}/${subject}/T2/T2.nii.gz
#	#dcm2nii -o ${DATA_DIR}/${subject}/T2/ -d n -e n -g y -i n -p n ${DATA_DIR}/${subject}/T2_dcm/${scan} 
        ConvertBetweenFileFormats ${DATA_DIR}/${subject}/T2_dcm ${DATA_DIR}/${subject}/T2/${subject}-T2.nrrd
    fi
done

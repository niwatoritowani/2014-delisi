# workflow

- participants :  genetically high risk group. 74cases? 
- DICOM (t1w and t2w) -> nrrd,
- t2w nrrd -> Multi-atlas-based masking (t2w)
- Multi-atlas-based masking (t2w) -> edit mask manually
- t1w nrrd -> aligned t1w
- aligned t1w and t2w mask -> FreeSurfer in masked aligned t1w


# data description

- Project directory ${projectdir} : 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi
- caselist          : 
    - ${projectdir}/caselist_jun.txt 
- original DICOM directory : 
    - ${projectdir}/${caseid}/dicom/*.dcm.gz
- decompressed copied DICOM data : 
    - ${projectdir}/dicom_to_nifti/data/${caseid}/T1_dcm/*.dcm
    - ${projectdir}/dicom_to_nifti/data/${caseid}/T2_dcm/*.dcm
- NRRD (created from DICOM) : 
    - ${projectdir}/dicom_to_nifti/data/${caseid}/T1/${caseid}-T1.nrrd
    - ${projectdir}/dicom_to_nifti/data/${caseid}/T2/${caseid}-T2.nrrd
- NRRD (Which are someone had created and their axis is aligned to voxel space)
    - ${projectdir}/${caseid}/${caseid}-t1w.nhdr
    - ${projectdir}/${caseid}/${caseid}-t2w.nhdr
- atlasmask directory : 
    - ${projectdir}/masks-fromcluster/
- atlasmask : 
    - ${projectdir}/masks-fromcluster/${caseid}.atlasmask.thresh50.nrrd
- training mask file list
    - ${projectdir}/masks-fromcluster/masks.txt
- training T2 file list
    - ${projectdir}/masks-fromcluster/t2s.txt
- edited atlasmask :
    - ${projectdir}/masks-fromcluster/${caseid}.atlasmask.thresh50-edr.nrrd
- aligned T1 :
    - some realigned t1w images have been created by someone
    - from ${projectdir}/${caseid}/${caseid}-t1w.nhdr
    - to ${projectdir}/${caseid}/align-space/${caseid}-t1w-realign.nrrd
- freesurfer-pipeline directory
    - ${projectdir}/pipelines-realign/freesurfer-pipeline/
- created files by fressurfer-pipelne
    - ${projectdir}/pipelines-realign/realign-pipeline/${caseid}.xfm 
    - ${projectdir}/pipelines-realign/realign-pipeline/${caseid}-t2w-realign.nrrd 
    - ${projectdir}/pipelines-realign/realign-edrmasks-pipeline/${caseid}.t1-realign-masked.nrrd
    - ${projectdir}/pipelines-realign/realign-edrmasks-pipeline/${caseid}.mask-realign 
    - ${projectdir}/pipelines-realign/freesurfer-pipeline/${caseid}.freesurfer


# step by step

## We created nrrd files from DICOM in (use ConvertBetweenFileFormats)

- input DICOM directory
    - ${projectdir}/${caseid}/dicom/
- output files
    - ${projectdir}/dicom_to_nifti/data/${caseid}/T1/${caseid}-T1.nrrd
    - ${projectdir}/dicom_to_nifti/data/${caseid}/T2/${caseid}-T2.nrrd

### Or someone had created nhdr files as 

- They are axis aligned to parallele to voxel space.  
- files : 
    - ${projectdir}/${caseid}/${caseid}-t1w.nhdr
    - ${projectdir}/${caseid}/${caseid}-t2w.nhdr

## We can create Multi Atlas Based Masks by "redo ${caseid}" in 

- directory : 
    - ${projectdir}/masks-fromcluster/
- training mask file list
    - ${projectdir}/masks-fromcluster/masks.txt
- training T2 file list
    - ${projectdir}/masks-fromcluster/t2s.txt
- output file
    - ${projectdir}/masks-fromcluster/${caseid}.atlasmask.thresh50.nrrd

## Then we edit the mask manually to create by 3D Slicer 4. 

- input file : 
    - ${projectdir}/dicom_to_nifti/data/${caseid}/T2/${caseid}-T2.nrrd
    - ${projectdir}/masks-fromcluster/${caseid}.atlasmask.thresh50.nrrd
- output file :
    - ${projectdir}/masks-fromcluster/${caseid}.atlasmask.thresh50-edr.nrrd

## we align t1w images 

- input file  : 
    - ${projectdir}/${caseid}-t1w.nhdr 
    - These T1 file are created by someone and axisaligned to parallel to voxel. 
- output file :  
    - ${projectdir}/${caseid}/align-space/${caseid}-t1w-realign.nrrd

## we execute freesurfer-pipeline by "redo ${caseid}" in 

- directory : 
    - ${projectdir}/pipelines-realign/freesurfer-pipeline/
- output files : 
    - ${projectdir}/pipelines-realign/realign-pipeline/${caseid}.xfm 
    - ${projectdir}/pipelines-realign/realign-pipeline/${caseid}-t2w-realign.nrrd 
    - ${projectdir}/pipelines-realign/realign-edrmasks-pipeline/${caseid}.t1-realign-masked.nrrd
    - ${projectdir}/pipelines-realign/realign-edrmasks-pipeline/${caseid}.mask-realign 
    - ${projectdir}/pipelines-realign/freesurfer-pipeline/${caseid}.freesurfer



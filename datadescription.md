# workflow

- participants :  genetically high risk group. 74cases? 
- DICOM (t1w and t2w) -> nrrd,
- t2w nrrd -> Multi-atlas-based masking (t2w)
- Multi-atlas-based masking (t2w) -> edit mask manually
- t1w nrrd -> aligned t1w
- aligned t1w and t2w mask -> FreeSurfer in masked aligned t1w


# data description

- Project directory
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi
- caselist
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/caselist_jun.txt 
- original DICOM directory 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/${caseid}/dicom/*.dcm.gz
- decompressed copied DICOM data
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/data/${caseid}/T1_dcm/*.dcm
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/data/${caseid}/T2_dcm/*.dcm
- NRRD
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/data/${caseid}/T1/${caseid}-T1.nrrd
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/data/${caseid}/T2/${caseid}-T2.nrrd
- NRRD (Which are someone had created and their axis is aligned to voxel space)
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/${caseid}/${caseid}-t1w.nhdr
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/${caseid}/${caseid}-t2w.nhdr
- atlasmask directory : 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/
- atlasmask : 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/${caseid}.atlasmask.thresh50.nrrd
- training mask file list
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/masks.txt
- training T2 file list
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/t2s.txt
- edited atlasmask :
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/${caseid}.atlasmask.thresh50-edr.nrrd
- aligned T1 :
    - some realigned t1w images have been created by someone
    - from /rfanfs/pnl-a/pnl/Collaborators/Delisi/${caseid}/${caseid}-t1w.nhdr
    - to /rfanfs/pnl-a/pnl/Collaborators/Delisi/${caseid}/align-space/${caseid}-t1w-realign.nrrd
- freesurfer-pipeline directory
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/freesurfer-pipeline/
- created files by fressurfer-pipelne
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-pipeline/${caseid}.xfm 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-pipeline/${caseid}-t2w-realign.nrrd 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-edrmasks-pipeline/${caseid}.t1-realign-masked.nrrd
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-edrmasks-pipeline/${caseid}.mask-realign 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/freesurfer-pipeline/${caseid}.freesurfer


# step by step

- Project directory and caselist
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/caselist_jun.txt 

## We created nrrd files from DICOM in (use ConvertBetweenFileFormats)
- input DICOM directory
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/${caseid}/dicom/
- output files
        - /rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/data/${caseid}/T1/${caseid}-T1.nrrd
        - /rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/data/${caseid}/T2/${caseid}-T2.nrrd

### Or someone had created nhdr files as 
    - They are different in physical axis paralleled to voxel space.  
        - /rfanfs/pnl-a/pnl/Collaborators/Delisi/${caseid}/${caseid}-t1w.nhdr
        - /rfanfs/pnl-a/pnl/Collaborators/Delisi/${caseid}/${caseid}-t2w.nhdr

## We can create Multi Atlas Based Masks by "redo ${caseid}" in 
- directory : 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/
- output file
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/${caseid}.atlasmask.thresh50.nrrd

## Then we edit the mask manually to create 
- output file
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/${caseid}.atlasmask.thresh50-edr.nrrd

## we align t1w images 
- input file
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/${caseid}-t1w.nhdr 
    - These T1 file are created by someone and axisaligned to parallel to voxel. 
- output file :  
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/${caseid}/align-space/${caseid}-t1w-realign.nrrd

## we execute freesurfer-pipeline by "redo ${caseid}" in 
- directory : 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/freesurfer-pipeline/
- output files : 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-pipeline/${caseid}.xfm 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-pipeline/${caseid}-t2w-realign.nrrd 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-edrmasks-pipeline/${caseid}.t1-realign-masked.nrrd
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-edrmasks-pipeline/${caseid}.mask-realign 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/freesurfer-pipeline/${caseid}.freesurfer



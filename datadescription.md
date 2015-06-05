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
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/<case_ID>/dicom/*.dcm.gz
- decompressed copied DICOM data
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/data/<case_ID>/T1_dcm/*.dcm
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/data/<case_ID>/T2_dcm/*.dcm
- NRRD
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/data/<case_ID>/T1/<case_ID>-T1.nrrd
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/data/<case_ID>/T2/<case_ID>-T2.nrrd
- NRRD (Which are someone had created and their axis is aligned to voxel space)
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/<case_ID>/<case_ID>-t1w.nhdr
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/<case_ID>/<case_ID>-t2w.nhdr
- atlasmask directory : 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/
- atlasmask : 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/<case_ID>.atlasmask.thresh50.nrrd
- training mask file list
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/masks.txt
- training T2 file list
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/t2s.txt
- edited atlasmask :
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/<case_ID>.atlasmask.thresh50-edr.nrrd
- aligned T1 :
    - some realigned t1w images have been created by someone
    - from /rfanfs/pnl-a/pnl/Collaborators/Delisi/<case_ID>/<case_ID>-t1w.nhdr
    - to /rfanfs/pnl-a/pnl/Collaborators/Delisi/<case_ID>/align-space/<case_ID>-t1w-realign.nrrd
- freesurfer-pipeline directory
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/freesurfer-pipeline/
- created files by fressurfer-pipelne
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-pipeline/<case_ID>.xfm 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-pipeline/<case_ID>-t2w-realign.nrrd 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-edrmasks-pipeline/<case_ID>.t1-realign-masked.nrrd
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-edrmasks-pipeline/<case_ID>.mask-realign 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/freesurfer-pipeline/<case_ID>.freesurfer


# step by step

- Project directory and caselist
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/caselist_jun.txt 

## We created nrrd files from DICOM in (use ConvertBetweenFileFormats)

- input DICOM directory
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/<case_ID>/dicom/
- output files
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/data/<case_ID>/T1/<case_ID>-T1.nrrd
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/dicom_to_nifti/data/<case_ID>/T2/<case_ID>-T2.nrrd

### Or someone had created nhdr files as 

They are axis aligned to parallele to voxel space.  

- files
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/<case_ID>/<case_ID>-t1w.nhdr
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/<case_ID>/<case_ID>-t2w.nhdr

## We can create Multi Atlas Based Masks by "redo <case_ID>" in 

- directory : 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/
- output file
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/<case_ID>.atlasmask.thresh50.nrrd

## Then we edit the mask manually to create 

- output file
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/masks-fromcluster/<case_ID>.atlasmask.thresh50-edr.nrrd

## we align t1w images 

- input file
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/<case_ID>-t1w.nhdr 
    - These T1 file are created by someone and axisaligned to parallel to voxel. 
- output file :  
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/<case_ID>/align-space/<case_ID>-t1w-realign.nrrd

## we execute freesurfer-pipeline by "redo <case_ID>" in 

- directory : 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/freesurfer-pipeline/
- output files : 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-pipeline/<case_ID>.xfm 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-pipeline/<case_ID>-t2w-realign.nrrd 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-edrmasks-pipeline/<case_ID>.t1-realign-masked.nrrd
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/realign-edrmasks-pipeline/<case_ID>.mask-realign 
    - /rfanfs/pnl-a/pnl/Collaborators/Delisi/pipelines-realign/freesurfer-pipeline/<case_ID>.freesurfer



case=$2
XFM=$(eval echo $(<config/XFM))
STRUCTURAL=$(eval echo $(<config/STRUCTURAL))
REALIGN_T1=$(eval echo $(<config/REALIGN_T1))

#redo-ifchange $XFM $STRUCTURAL
redo-ifchange $XFM

scripts/applyxfm.sh $STRUCTURAL $XFM $REALIGN_T1 $3

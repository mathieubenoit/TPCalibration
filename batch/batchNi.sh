#!/bin/bash

#BSUB -J FitPixelNi[1-256]
#BSUB -q 8nh
#BSUB -o /afs/cern.ch/work/m/mbenoit/public/LNLS_Analysis/SinglePixelAnalysis/results_NiXRF/jobs/out.%J_%I
#BSUB -e /afs/cern.ch/work/m/mbenoit/public/LNLS_Analysis/SinglePixelAnalysis/results_NiXRF/jobs/err.%J_%I
#BSUB -R "type==SLC6_64"

#for LSB_JOBINDEX in {1..256}
#do
XMIN=$(( $LSB_JOBINDEX - 1 ))
#echo $XMIN
#done

# source environment
. /afs/cern.ch/eng/clic/TBData/software/ROOT6_gcc48_python2.7/setup_CERN_ROOT6_gcc48_PYTHON2.7.sh

# get program and input root file
cp /afs/cern.ch/work/m/mbenoit/public/LNLS_Analysis/SinglePixelAnalysis/MatrixTOT.py .

# execute sNiipt
python MatrixTOT.py $XMIN $LSB_JOBINDEX 0 256 6

# get output file
cp NiXRF_A06-W0110_totperpixel*txt /afs/cern.ch/work/m/mbenoit/public/LNLS_Analysis/SinglePixelAnalysis/results_NiXRF

cp NiXRF_A06-W0110_totperpixelFailedFit*txt /afs/cern.ch/work/m/mbenoit/public/LNLS_Analysis/SinglePixelAnalysis/results_NiXRF



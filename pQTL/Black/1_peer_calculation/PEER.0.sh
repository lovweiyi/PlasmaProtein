#!/usr/bin/env bash
#$ -N v3b0
#$ -cwd
#$ -l mem_free=5G,h_vmem=5G,h_fsize=10G
#$ -m e
#$ -M jzhan218@jhu.edu

module load R/3.6.1

r=black
s='0'

runr(){
    R CMD BATCH --no-save --no-restore "$1" PEER_0.R PEER_wb.${r}.${s}.Rout
}
runr "--args race='${r}' n_peer=${s}"

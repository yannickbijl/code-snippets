inputfile=$1
outputfile=$2

fgrep '>' ${inputfile} > ${outputfile}
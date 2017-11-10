#FILES=`grep -Ir "using llvm" be/src/ | awk -F ":" '{print $1}' | sort -u`
FILES=`grep -Ir "<CallInst" be/src | awk -F ":" '{print $1}' | sort -u | grep -v ".bak" | grep -v tags`
for F in $FILES
do
  echo $F
  sed -i "s/<CallInst/<llvm::CallInst/g" ${F}
  SPECIFIERS=`grep "using llvm" $F | awk -F "using " '{print $2}' | sed -e "s/;//g" | sed -e "s/^llvm:://g"`
  for S in $SPECIFIERS
  do
    sed -i "s/<${S}>/<llvm::${S}>/g" ${F}
#    sed -i "s/(${S}/(llvm::${S}/g" ${F}
#    sed -i "s/^${S}/llvm::${S}/g" ${F}
  done
done
#| sort -u | awk '{print "grep \"using llvm\" " $1}'

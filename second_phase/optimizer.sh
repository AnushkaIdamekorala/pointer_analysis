
ops=("--ipsccp" "--instcombine" "--simplifycfg" "--dce" "--dse" "--licm" "--loop-unroll")


flags=("--basic-aa" "--globals-aa" "--scev-aa" "--cfl-steens-aa" "--cfl-anders-aa")
#flags=("--cfl-steens-aa --globals-aa" "--cfl-steens-aa --scev-aa" "--globals-aa --scev-aa" )
#flags=("")

##Replace the value of op by values in ops and do re-run. This will copy the required result.json to ./results folder
##I have provided all generated results files

op="--loop-unroll"
for aa in "${flags[@]}"
  do
  cp -r ../first_phase/test-suite-build-00 .
  renamed="result$aa-$op.json"
  echo "Copied"

  files=$(find test-suite-build-00 -name "*.c.o")

  for file in $files
      do
        if [  "$file" != "test-suite-build-00/tools/fpcmp.c.o" ]; then
            if [ "$file" != "test-suite-build-00/tools/timeit.c.o" ]; then
                  opt  -enable-new-pm=0 $aa  $op $file -o $file
            fi
        fi
  done
  echo "optimized"
  cd test-suite-build-00
  lit -v -j 1 -o results.json .
  cd ..
  mv ./test-suite-build-00/results.json  ./results/$renamed
  #
  rm -r test-suite-build-00

done
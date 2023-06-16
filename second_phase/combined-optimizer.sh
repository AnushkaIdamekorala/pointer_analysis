


flags=("--basic-aa" "--globals-aa" "--scev-aa" "--cfl-steens-aa" "--cfl-anders-aa")


##This script is to execute the combined optimizations and  copy the required result.json to ./combined_opt_results folder
##I have provided all generated results files


for aa in "${flags[@]}"
  do
  cp -r ../first_phase/test-suite-build-00 .
  renamed="result$aa.json"
  echo "Copied"

  files=$(find test-suite-build-00 -name "*.c.o")

  for file in $files
      do
        if [  "$file" != "test-suite-build-00/tools/fpcmp.c.o" ]; then
            if [ "$file" != "test-suite-build-00/tools/timeit.c.o" ]; then
                  opt  -enable-new-pm=0 $aa  --ipsccp --instcombine --simplifycfg --dce --dse --licm --loop-unroll $file -o $file
            fi
        fi
  done
  echo "optimized"
  cd test-suite-build-00
  lit -v -j 1 -o results.json .
  cd ..
  mv ./test-suite-build-00/results.json  ./combined_opt_results/$renamed
  #
  rm -r test-suite-build-00

done
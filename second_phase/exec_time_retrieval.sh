ops=("--ipsccp" "--instcombine" "--simplifycfg" "--dce" "--dse" "--licm" "--loop-unroll")


flags=("--basic-aa" "--globals-aa" "--scev-aa" "--cfl-steens-aa" "--cfl-anders-aa")
for op in "${ops[@]}"
do
  echo "For $op"
  for aa in "${flags[@]}"
  do
    echo "$aa"
    file="./results/result$aa-$op.json"
    python3 utils/compare.py $file
  done
done
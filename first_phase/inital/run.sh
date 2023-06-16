





flags=("--basic-aa" "--tbaa" "--globals-aa" "--scev-aa" "--objc-arc-aa" "--cfl-steens-aa" "--external-aa" "--scoped-noalias-aa" "--cfl-anders-aa")
op_levels=("00" "01" "02" "03" "0s" "0z")
no=0
partial=0
may=0
must=0



for op in "${op_levels[@]}"
do
##  echo "" | tee  ./op-"$op"/summary.txt
  files=$(find ../test-suite-build-"$op" -name "*.c.o")
  for fl in "${flags[@]}"
  do
    echo "" | tee  ./op-"$op"/f"$fl"out.txt

    SECONDS=0
    no=0
    partial=0
    may=0
    must=0
    peak_memory=0
    for file in $files
    do
        opt  -enable-new-pm=0  "$fl" -aa-eval < $file  -disable-output -stats>/dev/null 2> output1.txt
        string1=$(cat output1.txt)
        current_memory=$(ps -o rss= -p $$)
        if ((current_memory > peak_memory)); then
          peak_memory=$current_memory
        fi

        previous=""
        bf_prev=""
        concat=$file
        for item in $string1
          do
            if [ "$item" = "alias" ]; then
              case "$previous" in
                      "must")
                        let must="$bf_prev + $must"
                        concat="$concat must $bf_prev"
                        ;;
                      "may")
                        let may="$bf_prev + $may"
                        concat="$concat may $bf_prev"
                        ;;
                      "partial")
                        let partial="$bf_prev + $partial"
                        concat="$concat partial $bf_prev"
                        ;;
                      "no")
                        let no="$bf_prev + $no"
                        concat="$concat no $bf_prev"
                      ;;
                      *)
                      ;;
                    esac
            fi

            bf_prev="$previous"
            previous="$item"
          done
          echo "$concat" | tee -a ./op-"$op"/f"$fl"out.txt
    done
    final_memory=$(vm_stat | awk '/Pages free/ {print $3 * 4}')
    echo "Final no $no partial $partial may $may must $must" | tee -a ./op-"$op"/f"$fl"out.txt
    echo "$fl no $no partial $partial may $may must $must time $SECONDS memory$peak_memory" | tee -a  ./op-"$op"/summary.txt

  done
done


#!/bin/bash

if ! [[ -e testvoc.conf ]]; then
    echo "Testvoc configuration file (testvoc.conf) not found."
    exit 1
fi

while getopts "eq" opt; do
  case $opt in
    e)
      ENCLITICS=true  # If the -e flag is used, enclitics are skipped for faster processing
      ;;
    q)
      QUIET=true  # If the -q flag is used, no summary is generated
      ;;
  esac
done

IFS=","
modes=($(grep -m 1 "^PairModes=" testvoc.conf | cut -d = -f 2))
names=($(grep -m 1 "^PairNames=" testvoc.conf | cut -d = -f 2))
unset IFS

for i in "${!modes[@]}";
do
    echo ""
    printf "== %.45s\n" "${names[$i]} ============================================"
    if [[ $ENCLITICS ]]; then
        bash inconsistency.sh -e ${modes[$i]} auto > .testvoc
    else
        bash inconsistency.sh ${modes[$i]} auto > .testvoc
    fi
    grep ' #' .testvoc > testvoc-errors.${modes[$i]}.txt
    if ! [[ $QUIET ]]; then
        bash inconsistency-summary.sh .testvoc ${modes[$i]}
    fi
    rm .testvoc
done

exit 0

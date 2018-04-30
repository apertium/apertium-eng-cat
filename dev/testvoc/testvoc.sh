#!/bin/bash
echo "==English->Catalan==========================";

bash inconsistency.sh eng-cat ../../../apertium-eng/apertium-eng.eng.dix > /tmp/eng-cat.testvoc; bash inconsistency-summary.sh /tmp/eng-cat.testvoc eng-cat; grep ' #' /tmp/eng-cat.testvoc > ./testvoc-errors.eng-cat.txt; grep '@' /tmp/eng-cat.testvoc >> ./testvoc-errors.eng-cat.txt

if [[ $1 = "-u" ]];
then
  echo "Looking for bidix entries missing from English monodix …";
  pushd ../../ > /dev/null; bash dev/testvoc/bidix-unknowns.sh eng | grep -v ":<:" | grep -v "REGEX" > dev/testvoc/testvoc-missing.eng.txt; popd > /dev/null;
  echo "Entries missing from monodix: "$(wc -l < testvoc-missing.eng.txt) | tee -a testvoc-summary.eng-cat.txt;
fi
echo ""


echo "==Catalan->English==========================";

bash inconsistency.sh cat-eng ../../../apertium-cat/apertium-cat.cat.dix > /tmp/cat-eng.testvoc; bash inconsistency-summary.sh /tmp/cat-eng.testvoc cat-eng; grep ' #' /tmp/cat-eng.testvoc > ./testvoc-errors.cat-eng.txt; grep '@' /tmp/cat-eng.testvoc >> ./testvoc-errors.cat-eng.txt

if [[ $1 = "-u" ]];
then
  echo "Looking for bidix entries missing from Catalan monodix …";
  pushd ../../ > /dev/null; bash dev/testvoc/bidix-unknowns.sh cat | grep -v ":<:" | grep -v "REGEX" > dev/testvoc/testvoc-missing.cat.txt; popd > /dev/null;
  echo "Entries missing from monodix: "$(wc -l < testvoc-missing.cat.txt) | tee -a testvoc-summary.cat-eng.txt;
fi

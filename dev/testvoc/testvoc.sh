#!/bin/bash
echo "==English->Catalan==========================";

bash inconsistency.sh eng-cat ../../../apertium-eng/apertium-eng.eng.dix > /tmp/eng-cat.testvoc; bash inconsistency-summary.sh /tmp/eng-cat.testvoc eng-cat; grep ' #' /tmp/eng-cat.testvoc > ./testvoc-errors.eng-cat.txt; grep '@' /tmp/eng-cat.testvoc >> ./testvoc-errors.eng-cat.txt; rm /tmp/eng-cat.testvoc

echo ""
echo "==English->Catalan (val_gva)================";

bash inconsistency.sh eng-cat_valencia_gva ../../../apertium-eng/apertium-eng.eng.dix > /tmp/eng-cat_valencia_gva.testvoc; bash inconsistency-summary.sh /tmp/eng-cat_valencia_gva.testvoc eng-cat_valencia_gva; grep ' #' /tmp/eng-cat_valencia_gva.testvoc > ./testvoc-errors.eng-cat_valencia_gva.txt; grep '@' /tmp/eng-cat_valencia_gva.testvoc >> ./testvoc-errors.eng-cat_valencia_gva.txt; rm /tmp/eng-cat_valencia_gva.testvoc

echo ""
echo "==English->Catalan (val_uni)================";

bash inconsistency.sh eng-cat_valencia_uni ../../../apertium-eng/apertium-eng.eng.dix > /tmp/eng-cat_valencia_uni.testvoc; bash inconsistency-summary.sh /tmp/eng-cat_valencia_uni.testvoc eng-cat_valencia_uni; grep ' #' /tmp/eng-cat_valencia_uni.testvoc > ./testvoc-errors.eng-cat_valencia_uni.txt; grep '@' /tmp/eng-cat_valencia_uni.testvoc >> ./testvoc-errors.eng-cat_valencia_uni.txt; rm /tmp/eng-cat_valencia_uni.testvoc

if [[ $1 = "-u" ]];
then
  echo "Looking for bidix entries missing from English monodix …";
  pushd ../../ > /dev/null; bash dev/testvoc/bidix-unknowns.sh eng | grep -v ":<:" | grep -v "REGEX" | grep -v "<prn><enc>" > dev/testvoc/testvoc-missing.eng.txt; popd > /dev/null;
  echo "Entries missing from monodix: "$(wc -l < testvoc-missing.eng.txt) | tee -a testvoc-summary.eng-cat.txt;
fi
echo ""


echo "==Catalan->English==========================";

bash inconsistency.sh cat-eng ../../../apertium-cat/apertium-cat.cat.dix > /tmp/cat-eng.testvoc; bash inconsistency-summary.sh /tmp/cat-eng.testvoc cat-eng; grep ' #' /tmp/cat-eng.testvoc > ./testvoc-errors.cat-eng.txt; grep '@' /tmp/cat-eng.testvoc >> ./testvoc-errors.cat-eng.txt; rm /tmp/cat-eng.testvoc

if [[ $1 = "-u" ]];
then
  echo "Looking for bidix entries missing from Catalan monodix …";
  pushd ../../ > /dev/null; bash dev/testvoc/bidix-unknowns.sh cat | grep -v ":<:" | grep -v "REGEX" | grep -v "<prn><enc>" > dev/testvoc/testvoc-missing.cat.txt; popd > /dev/null;
  echo "Entries missing from monodix: "$(wc -l < testvoc-missing.cat.txt) | tee -a testvoc-summary.cat-eng.txt;
fi

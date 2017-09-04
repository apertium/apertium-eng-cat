echo "==English->Catalan==========================";
bash inconsistency.sh eng-cat ../../../apertium-eng/apertium-eng.eng.dix > /tmp/eng-cat.testvoc; bash inconsistency-summary.sh /tmp/eng-cat.testvoc eng-cat; grep '  #' /tmp/eng-cat.testvoc > ./eng-cat.testvoc 
echo ""
echo "==Catalan->English==========================";
bash inconsistency.sh cat-eng ../../../apertium-cat/apertium-cat.cat.dix > /tmp/cat-eng.testvoc; bash inconsistency-summary.sh /tmp/cat-eng.testvoc cat-eng; grep '  #' /tmp/cat-eng.testvoc > ./cat-eng.testvoc 

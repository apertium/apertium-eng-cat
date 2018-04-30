TMPDIR=/tmp

if [[ $1 = "cat-eng" ]]; then

lt-expand $2 | grep -v REGEX | grep -v ':<:' | sed 's/:>:/\'$'\t/g' | sed 's/:/\'$'\t/g' | cut -f2 -d$'\t' | sed 's/^/^/g' | sed 's/$/$/g' | tee $TMPDIR/tmp_testvoc1-$1.txt |\
        apertium-pretransfer|\
        lt-proc -b ../../cat-eng.autobil.bin | sed 's/$ ^/$\n ~^/g' | awk -F '>/' '{lemma=">$ "$1">/"; OFS=lemma; $1=""; print;}' | sed "s|^>$ ||" | sed 's/>\$ \^/>\$ \^.<sent>\/.<sent>\$ \^/g' | awk 'BEGIN{ RS="\n ~"; ORS=" " }{print }' | sed 's/>\$$/>\$ \^.<sent>\/.<sent>\$/g' |\
        apertium-transfer -b ../../apertium-eng-cat.cat-eng.t1x  ../../cat-eng.t1x.bin | apertium-interchunk ../../apertium-eng-cat.cat-eng.t2x  ../../cat-eng.t2x.bin | apertium-postchunk ../../apertium-eng-cat.cat-eng.t3x  ../../cat-eng.t3x.bin | tee $TMPDIR/tmp_testvoc2-$1.txt |\
        lt-proc -d ../../cat-eng.autogen.bin > $TMPDIR/tmp_testvoc3-$1.txt
paste -d _ $TMPDIR/tmp_testvoc1-$1.txt $TMPDIR/tmp_testvoc2-$1.txt $TMPDIR/tmp_testvoc3-$1.txt | sed 's/ \^.<sent>\$//g' | sed 's/ \.//g' | sed 's/_/   --------->   /g' | grep -v '@'
rm $TMPDIR/tmp_testvoc1-$1.txt
rm $TMPDIR/tmp_testvoc2-$1.txt
rm $TMPDIR/tmp_testvoc3-$1.txt

elif [[ $1 = "eng-cat" ]]; then

lt-expand $2 | grep -v REGEX | grep -v ':<:' | sed 's/:>:/\'$'\t/g' | sed 's/:/\'$'\t/g' | cut -f2 -d$'\t' | sed 's/^/^/g' | sed 's/$/$/g' | tee $TMPDIR/tmp_testvoc1-$1.txt |\
        apertium-pretransfer|\
        lt-proc -b ../../eng-cat.autobil.bin | sed 's/$ ^/$\n ~^/g' | awk -F '>/' '{lemma=">$ "$1">/"; OFS=lemma; $1=""; print;}' | sed "s|^>$ ||" | sed 's/>\$ \^/>\$ \^.<sent>\/.<sent>\$ \^/g' | awk 'BEGIN{ RS="\n ~"; ORS=" " }{print }' | sed 's/>\$$/>\$ \^.<sent>\/.<sent>\$/g' |\
        apertium-transfer -b ../../apertium-eng-cat.eng-cat.t1x  ../../eng-cat.t1x.bin | apertium-interchunk ../../apertium-eng-cat.eng-cat.t2x  ../../eng-cat.t2x.bin | apertium-postchunk ../../apertium-eng-cat.eng-cat.t3x  ../../eng-cat.t3x.bin | tee $TMPDIR/tmp_testvoc2-$1.txt |\
        lt-proc -d ../../eng-cat.autogen.bin > $TMPDIR/tmp_testvoc3-$1.txt
paste -d _ $TMPDIR/tmp_testvoc1-$1.txt $TMPDIR/tmp_testvoc2-$1.txt $TMPDIR/tmp_testvoc3-$1.txt | sed 's/ \^.<sent>\$//g' | sed 's/ \.//g' | sed 's/_/   --------->   /g' | grep -v '@'
rm $TMPDIR/tmp_testvoc1-$1.txt
rm $TMPDIR/tmp_testvoc2-$1.txt
rm $TMPDIR/tmp_testvoc3-$1.txt

else
	echo "sh inconsistency.sh <direction>";
fi

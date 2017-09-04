TMPDIR=/tmp

if [[ $1 = "cat-eng" ]]; then

lt-expand $2 | grep -v REGEX | grep -v '<prn><enc>' | sed 's/:>:/%/g' | grep -v ':<:' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |\
        apertium-pretransfer|\
        lt-proc -b ../../cat-eng.autobil.bin |\
        apertium-transfer -b ../../apertium-eng-cat.cat-eng.t1x  ../../cat-eng.t1x.bin | apertium-interchunk ../../apertium-eng-cat.cat-eng.t2x  ../../cat-eng.t2x.bin | apertium-postchunk ../../apertium-eng-cat.cat-eng.t3x  ../../cat-eng.t3x.bin | tee $TMPDIR/tmp_testvoc2.txt |\
        lt-proc -d ../../cat-eng.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g' | grep -v '\^@'

elif [[ $1 = "eng-cat" ]]; then

lt-expand $2 | grep -v REGEX | grep -v '<prn><enc>' | sed 's/:>:/%/g' | grep -v ':<:' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |\
        apertium-pretransfer|\
        lt-proc -b ../../eng-cat.autobil.bin |\
        apertium-transfer -b ../../apertium-eng-cat.eng-cat.t1x  ../../eng-cat.t1x.bin | apertium-interchunk ../../apertium-eng-cat.eng-cat.t2x  ../../eng-cat.t2x.bin | apertium-postchunk ../../apertium-eng-cat.eng-cat.t3x  ../../eng-cat.t3x.bin | tee $TMPDIR/tmp_testvoc2.txt |\
        lt-proc -d ../../eng-cat.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g' | grep -v '\^@'

else
	echo "sh inconsistency.sh <direction>";
fi

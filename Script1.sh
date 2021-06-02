echo `date` " Moving FDC to temperory" >>

find /var/mqm/errors - name '*.FDC' | head -5 > list.txt
while read g
do cp -pr $g /tmp/temps/
rm -rf $g
done < list.txt

echo "---------------------------------------" >> abcd.txt
echo ""

echo "Checking Large files under /var/mqm" >> abcd.txt

find /var/mqm -xdev -size  +102400 -ls |sort -r +6 >> abcd.txt




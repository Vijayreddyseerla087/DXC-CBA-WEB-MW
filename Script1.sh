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

echo "----------------------------------------"
echo ""

echo "Checking depth and channel status" >> abcd.txt

while read g
do

echo "dis qs(*) CURDEPTH where(CURDEPTH gt 1000)" |runmqsc $qm |grep -vE 'MQSC|dis|AMQ8450I|Copyright' >> abcd.txt

echo "dis chs(*) where(status ne running) |runmqsc $qm |grep -v AMQ8417 >> abcd.txt

done < qm.txt

echo "----------------------------------------"
echo ""

echo "Removing 7 days older file from /temp/temps" >> abcd.txt

find /tmp/temps -name '*.FDC' -mtime +7 > qwerty.txt

find /tmp/temps -name '*.FDC' -mtime +7 -exec rm {} \;

echo "Removing 30 days older abcd.txt" >> qwerty.txt

find /var/mqm -name 'abcd.txt' -mtime +30 -exec rm {} \;


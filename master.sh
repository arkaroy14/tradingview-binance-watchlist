#MERGE ALL TXT
#cat *.txt > all.txt (no newline bw files)
mkdir out
find *.txt -exec cat {} \; -exec echo \; > 'out/all.txt'
#REPLACE , WITH \n
sed -i -z 's/,/\n/g' 'out/all.txt'

mkdir final
#FUTURE USDT + BUSD
grep "USDTPERP" 'out/all.txt' > 'out/future1.txt'
grep "BUSDPERP" 'out/all.txt' > 'out/future2.txt'


cat 'out/future1.txt' 'out/future2.txt' > 'final/future.txt'

#FUTURE USDT
grep "USDT$" 'out/all.txt' > 'final/spotusdt.txt'
#FUTURE BUSD
grep "BUSD$" 'out/all.txt' > 'final/spotbusd.txt'

#REPLACE \n WITH  ,
sed -i -z 's/\n/,/g' 'final/spotusdt.txt'
sed -i -z 's/\n/,/g' 'final/spotbusd.txt'
sed -i -z 's/\n/,/g' 'final/future.txt'

#!/bin/bash


#Checking if executable exists
if [ ! -f "bin/atoms" ]
then
	echo "Fatal error : \"bin/atoms\" does not exist !"
	exit
fi

echo "config file: '$1'"

#Launching tests for sequential version
#Sed-ing results into a gnuplot file
touch tmp_get_perfs
echo "" > plot_ocl.g
for i in $(seq 2000 2000 50000)
do
	echo "natoms = $i"
	./bin/atoms -v -d 1 -i 10 -n $i $1 2> tmp_get_perfs
	sed -i '/^\[PERF\]/!d' tmp_get_perfs
	sed -i '2!d' tmp_get_perfs
	sed -i "s/^..................//" tmp_get_perfs
	sed -i "s/....$//" tmp_get_perfs
	sed -i "s/ //" tmp_get_perfs
	sed -i "s/ //" tmp_get_perfs
	sed -i "s/ //" tmp_get_perfs
	sed -i "s/ //" tmp_get_perfs
	sed -i "s/ //" tmp_get_perfs
	sed -i "s/ //" tmp_get_perfs
	sed -i "s/ //" tmp_get_perfs
	sed -i "s/ //" tmp_get_perfs
	echo "$i	$(cat tmp_get_perfs)" >> plot_ocl.g
done

rm tmp_get_perfs

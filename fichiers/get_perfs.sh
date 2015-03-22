#!/bin/bash


#Checking if executable exists
if [ ! -f "bin/atoms" ]
then
	echo "Fatal error : \"bin/atoms\" does not exist !"
	exit
fi

#Launching tests for sequential version 
#Sed-ing results into a gnuplot file
touch tmp_get_perfs
touch plot_seq.g
for i in $(seq 2000 2000 50000)
do
	./bin/atoms -v -s 0 -i 10 -n $i 2> tmp_get_perfs
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
	echo "$i	$(cat tmp_get_perfs)" >> plot_seq.g
done

touch plot_omp1.g
for i in $(seq 2000 2000 50000)
do
	./bin/atoms -v -O 0 -i 10 -n $i 2> tmp_get_perfs
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
	echo "$i	$(cat tmp_get_perfs)" >> plot_omp1.g
done

touch plot_omp2.g
for i in $(seq 2000 2000 50000)
do
	OMP_NUM_THREADS=2 ./bin/atoms -v -O 0 -i 10 -n $i 2> tmp_get_perfs
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
	echo "$i	$(cat tmp_get_perfs)" >> plot_omp2.g
done

touch plot_omp4.g
for i in $(seq 2000 2000 50000)
do
	OMP_NUM_THREADS=4 ./bin/atoms -v -O 0 -i 10 -n $i 2> tmp_get_perfs
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
	echo "$i	$(cat tmp_get_perfs)" >> plot_omp4.g
done

touch plot_omp8.g
for i in $(seq 2000 2000 50000)
do
	OMP_NUM_THREADS=8 ./bin/atoms -v -O 0 -i 10 -n $i 2> tmp_get_perfs
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
	echo "$i	$(cat tmp_get_perfs)" >> plot_omp8.g
done

touch plot_omp16.g
for i in $(seq 2000 2000 50000)
do
	OMP_NUM_THREADS=16 ./bin/atoms -v -O 0 -i 10 -n $i 2> tmp_get_perfs
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
	echo "$i	$(cat tmp_get_perfs)" >> plot_omp16.g
done

rm tmp_get_perfs
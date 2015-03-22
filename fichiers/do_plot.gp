#!/usr/bin/gnuplot

set term pdf #enhanced monochrome dashed
set output "exemple.pdf"

set key right bottom

set xlabel "N"
set ylabel "Temps (µs)"

plot "plot_seq.g" with linespoints title "Séquentiel",\
     "plot_omp1.g" with linespoints title "OMP - 1 thread",\
     "plot_omp2.g" with linespoints title "OMP - 2 threads",\
     "plot_omp4.g" with linespoints title "OMP - 4 threads",\
     "plot_omp8.g" with linespoints title "OMP - 8 threads",\
     "plot_omp16.g" with linespoints title "OMP - 16 threads"

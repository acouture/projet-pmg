#!/usr/bin/gnuplot

set term pdf #enhanced monochrome dashed
set output "exemple.pdf"

set key left top

set xlabel "N"
set ylabel "Temps (µs)"

plot "plot_seq.g" with linespoints title "Séquentiel",\
     "plot_omp1.g" with linespoints title "OMP - 1 threads",\
     "plot_omp2.g" with linespoints title "OMP - 2 threads",\
     "plot_omp4.g" with linespoints title "OMP - 4 threads",\
     "plot_omp8.g" with linespoints title "OMP - 8 threads",\
     "plot_omp16.g" with linespoints title "OMP - 16 threads",\
     "plot_omp_max.g" with linespoints title "OMP - 40 threads"

set output "speedup.pdf"
set ylabel "Speedup"

plot "speedup.g" with linespoints title "Speedup"

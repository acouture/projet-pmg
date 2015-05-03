#!/usr/bin/gnuplot

set term pdf #enhanced monochrome dashed
set output "seq-omp.pdf"

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

set output "ocl_z-ocl_box.pdf"
plot "plot_ocl_z.g" with linespoints title "Tri par Z",\
     "plot_ocl_box.g" with linespoints title "Tri par box"

set output "speedup_omp.pdf"
set ylabel "Speedup"

plot "speedup_seq-omp.g" with linespoints title "Speedup omp"

set output "speedup_ocl.pdf"
plot "speedup_seq-ocl.g" with linespoints title "Speedup ocl"

set output "speedup_omp-ocl.pdf"
plot "speedup_omp-ocl.g" with linespoints title "Speedup omp/ocl"


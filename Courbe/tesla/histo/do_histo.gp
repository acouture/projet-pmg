#!/usr/bin/gnuplot

set term png #enhanced monochrome dashed
set output "histogram.png"

set key left top

set xlabel "Configuration"
set ylabel "Temps (µs)"


set xtics border in scale 1,0.5 nomirror rotate by 0 offset character 0, 0, 0

plot "plot_seq.g" using 2:xticlabels(1) with histogram title "Séquentiel",\
     "plot_omp_dyn.g" using 2:xticlabels(1) with histogram title "OpenMP dynamique - tri par Z",\
     "plot_ocl_z.g" using 2:xticlabels(1) with histogram title "OpenCL - tri par Z",\
     "plot_ocl_box" using 2:xticlabels(1) with histogram title "OpenCL - tri par boites"

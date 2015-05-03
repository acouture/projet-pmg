#!/bin/bash

./speedup.sh plot_seq.g plot_omp_max.g speedup_seq-omp.g
./speedup.sh plot_seq.g plot_ocl_box.g speedup_seq-ocl.g
./speedup.sh plot_omp_max.g plot_ocl_box.g speedup_omp-ocl.g

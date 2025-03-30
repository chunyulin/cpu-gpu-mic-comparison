#!/usr/bin/gnuplot

set term postscript eps enhanced color

set style data lines
set style line 1  linetype -1 linewidth 3 lc rgb "#005197"
set style line 2  linetype -1 linewidth 3 lc rgb "#00680c"
set style line 3  linetype -1 linewidth 3 lc rgb "#971c00"
set style line 4  linetype -1 linewidth 3 lc rgb "#000000"
set style increment user

set size 1.3,1
set border linewidth 1.5

#set logscale y
#set format y "10^{%L}"
set xrange [2013.4:2023.4]
set key samplen 6 spacing 3.0
set key left top
set grid lw 3
set xlabel "End of Year" font ",16"
set ylabel "GFLOP/sec" font ",16"

set yrange [30:50000]
set output "gflops-sp.eps"
#set title "Theoretical Peak Performance, Single Precision"

# THIS PART MUST YET TBD
# Labels AMD
set label "FirePro W9100"   at 2014,3700 center rotate by 20 textcolor rgb "#971c00"
set label "Instinct MI60"   at 2018,7000 center rotate by 40 textcolor rgb "#971c00"
set label "Instinct MI100"  at 2020,9000 center rotate by 40 textcolor rgb "#971c00"

# Labels Intel
set label "E5-2699 v3"    at 2014,1100  center rotate by 40 textcolor rgb "#005197"
set label "E5-2699 v4"    at 2016,1100 center rotate by 40 textcolor rgb "#005197"
set label "Platinum 8180" at 2017,2700 center rotate by 40 textcolor rgb "#005197"
set label "Platinum 9282" at 2018,5000 center rotate by 40 textcolor rgb "#005197"

# Labels NVIDIA
set label "Tesla K40"      at 2014,8000  center rotate by 40 textcolor rgb "#00680c"
set label "GTX Titan X"    at 2015,9000  center rotate by 40 textcolor rgb "#00680c"
set label "Titan X"        at 2016,17000 center rotate by 40 textcolor rgb "#00680c"
set label "Titan V"        at 2017,20000 center rotate by 40 textcolor rgb "#00680c"
set label "Titan RTX"      at 2018,22000 center rotate by 40 textcolor rgb "#00680c"

plot 'data-intel.txt'     using 1:2 with linesp pt 9 ps 3.0 title "INTEL Xeon CPUs", \
     'data-sp-nvidia.txt' using 1:2 with linesp pt 5 ps 3.0 title "NVIDIA GeForce GPUs", \
     'data-amd.txt'       using 1:2 with linesp pt 7 ps 3.0 title "AMD Radeon GPUs", \
     #'data-amd-cpus.txt' using 1:2 with linesp pt 11 ps 3.0 title "AMD Epyc CPUs"

set yrange [30:50000]
set output "gflops-dp.eps"
set title "Theoretical Peak Performance, Double Precision"


unset label

# Labels AMD
set label "FirePro W9100"   at 2014,7200 center rotate by 40 textcolor rgb "#971c00"
set label "Instinct MI60"   at 2018,12000 center rotate by 40 textcolor rgb "#971c00"
set label "Instinct MI100"  at 2020,16100 center rotate by 40 textcolor rgb "#971c00"
set label "Instinct MI250"  at 2021,47300 center rotate by 40 textcolor rgb "#971c00"

# Labels AMD CPUs
#set label "Epyc 7742" at 2019,4400 center rotate by 48

# Labels Intel
set label "E5-2699 v3"    at 2014,5400 center rotate by 40 textcolor rgb "#005197"
set label "E5-2699 v4"    at 2016,7700 center rotate by 40 textcolor rgb "#005197"
set label "Platinum 8180" at 2017,10800 center rotate by 40 textcolor rgb "#005197"
set label "Platinum 9282" at 2018,10200 center rotate by 40 textcolor rgb "#005197"

# Labels NVIDIA
set label "Tesla K40"    at 2014,9000 center rotate by 40 textcolor rgb "#00680c"
set label "Tesla P100"   at 2016,10500 center rotate by 40 textcolor rgb "#00680c"
set label "Tesla V100"   at 2017,13500 center rotate by 40 textcolor rgb "#00680c"
set label "Tesla A100"   at 2020,17800 center rotate by 40 textcolor rgb "#00680c"
set label "Tesla H100"   at 2023,30600 center rotate by 40 textcolor rgb "#00680c"

plot 'data-intel.txt'     using 1:3 with linesp pt  9 ps 3.0 title "INTEL Xeon CPUs", \
     'data-dp-nvidia.txt' using 1:2 with linesp pt  5 ps 3.0 title "NVIDIA GPUs", \
     'data-amd.txt'       using 1:3 with linesp pt  7 ps 3.0 title "AMD GPUs", \
     #'data-amd-cpus.txt' using 1:3 with linesp pt 11 ps 3.0 title "AMD Epyc CPUs"

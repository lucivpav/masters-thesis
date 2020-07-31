set term epslatex
set output "distThreshVsAccuracy.tex"
set style data lp
set xlabel "Distance threshold [meters]"
set ylabel "Correctly localized queries [\\%]"
set xtics 0,0.25,2 nomirror
set ytics 0,20,100 nomirror
set xrange [0:2]
set yrange [0:100]
set style line 1 lw 4 pt 7 ps 1.5
set grid lt -1 linecolor rgb "gray"
set border 3 back
set size square
set key at 2,20
plot "InLocDistThreshVsAccuracy.csv" using 1:2 ls 1 lt rgb "blue" title "InLoc", \
    "distThreshVsAccuracy.csv" using 1:2 ls 1 lt rgb "red" title "InLocCIIRC"
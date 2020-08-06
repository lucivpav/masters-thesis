set term epslatex
set output "temp.tex"
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
set key at 2,60
plot "distThreshVsAccuracy-HL1-v4.2-k1.csv" using 1:2 ls 1 lt rgb "blue" title "k1", \
    "distThreshVsAccuracy-HL1-v4.2-k2.csv" using 1:2 ls 1 lt rgb "red" title "k2-MCP", \
    "distThreshVsAccuracy-HL1-v4.2-k1-estimatesAreFromHL.csv" using 1:2 ls 1 lt rgb "green" title "HoloLens" #, \
    #"distThreshVsAccuracy-HL1-v4.2-k3.csv" using 1:2 ls 1 lt rgb "yellow" title "k3-MCP", \
    #"distThreshVsAccuracy-HL1-v4.2-k5.csv" using 1:2 ls 1 lt rgb "purple" title "k5-MCP", \
    #"distThreshVsAccuracy-HL1-v4.2-k2-sequentialPV.csv" using 1:2 ls 1 lt rgb "magenta" title "k2-sequentialPV", \
    #"distThreshVsAccuracy-HL1-v4.2-k3-sequentialPV.csv" using 1:2 ls 1 lt rgb "cyan" title "k3-sequentialPV", \
    #"distThreshVsAccuracy-HL1-v4.2-k4-sequentialPV.csv" using 1:2 ls 1 lt rgb "pink" title "k4-sequentialPV"

# fix problem with relative path
set output # Closes the temporary output files.
!sed 's|includegraphics{temp}|includegraphics{distThreshVsAccuracy-HL1/distThreshVsAccuracy-HL1}|' < temp.tex > distThreshVsAccuracy-HL1.tex
!sed 's|temp\.tex|distThreshVsAccuracy-HL1/distThreshVsAccuracy-HL1.tex|' < temp.eps > distThreshVsAccuracy-HL1.eps
!rm temp.{tex,eps}
#!/bin/bash

start=`date +%s`
app=cliques inputgraph=./datasets/reddit.graph steps=3 $FRACTAL_HOME/bin/fractal.sh
end=`date +%s`
time_3_cliques=$((end-start))

start=`date +%s`
app=cliques inputgraph=./datasets/reddit.graph steps=4 $FRACTAL_HOME/bin/fractal.sh
end=`date +%s`
time_4_cliques=$((end-start))

start=`date +%s`
app=cliques inputgraph=./datasets/reddit.graph steps=5 $FRACTAL_HOME/bin/fractal.sh
end=`date +%s`
time_5_cliques=$((end-start))

start=`date +%s`
app=motifs inputgraph=./datasets/reddit.graph steps=3 $FRACTAL_HOME/bin/fractal.sh
end=`date +%s`
time_3_motifs=$((end-start))

start=`date +%s`
app=motifs inputgraph=./datasets/reddit.graph steps=4 $FRACTAL_HOME/bin/fractal.sh
end=`date +%s`
time_4_motifs=$((end-start))

start=`date +%s`
app=fsm inputgraph=./datasets/reddit.graph steps=2 fsmsupp=1000 $FRACTAL_HOME/bin/fractal.sh
end=`date +%s`
time_fsm=$((end-start))

echo "3-cliques: $time_3_cliques s"
echo "4-cliques: $time_4_cliques s"
echo "5-cliques: $time_5_cliques s"
echo "3-motifs: $time_3_motifs s"
echo "4-motifs: $time_4_motifs s"
echo "fsm $time_fsm s"s


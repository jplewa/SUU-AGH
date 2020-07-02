#!/bin/bash

export ARABESQUE_HOME=/home/arabesque/Arabesque/

hadoop dfsadmin -safemode leave
hdfs dfs -put ./datasets/reddit.graph reddit.graph
cd $ARABESQUE_HOME
mvn package -DskipTests
cp ./target/arabesque-1.1.0-SPARK*.jar ./scripts
cd scripts
./run_arabesque.sh /app/scripts/cluster.yaml /app/scripts/motifs.yaml

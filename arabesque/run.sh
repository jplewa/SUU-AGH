#!/bin/bash

export PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_131
export ARABESQUE_HOME=/home/arabesque
export HADOOP_PREFIX=/home/arabesque/hadoop-2.6.5
export HADOOP_HOME=$HADOOP_PREFIX
export HADOOP_COMMON_HOME=$HADOOP_PREFIX
export HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
export HADOOP_HDFS_HOME=$HADOOP_PREFIX
export HADOOP_MAPRED_HOME=$HADOOP_PREFIX
export HADOOP_YARN_HOME=$HADOOP_PREFIX
export PATH=$PATH:/home/arabesque/hadoop-2.6.5/bin
bash $ARABESQUE_HOME/start-hadoop.sh
export SPARK_HOME=/home/arabesque/spark-2.0.0-bin-hadoop2.6
export PATH=$PATH:/home/arabesque/spark-2.0.0-bin-hadoop2.6/bin

hadoop dfsadmin -safemode leave
hdfs dfs -put ./datasets/reddit.graph reddit.graph
cd /home/arabesque/Arabesque/
mvn package -DskipTests
cp ./target/arabesque-1.1.0-SPARK*.jar ./scripts/
cd ./scripts

start=`date +%s`
./run_arabesque.sh /app/scripts/cluster.yaml /app/scripts/3-cliques.yaml
end=`date +%s`
time_3_cliques=$((end-start))

start=`date +%s`
./run_arabesque.sh /app/scripts/cluster.yaml /app/scripts/4-cliques.yaml
end=`date +%s`
time_4_cliques=$((end-start))

start=`date +%s`
./run_arabesque.sh /app/scripts/cluster.yaml /app/scripts/5-cliques.yaml
end=`date +%s`
time_5_cliques=$((end-start))

start=`date +%s`
./run_arabesque.sh /app/scripts/cluster.yaml /app/scripts/3-motifs.yaml
end=`date +%s`
time_3_motifs=$((end-start))

start=`date +%s`
./run_arabesque.sh /app/scripts/cluster.yaml /app/scripts/4-motifs.yaml
end=`date +%s`
time_4_motifs=$((end-start))

echo "3-cliques: $time_3_cliques s"
echo "4-cliques: $time_4_cliques s"
echo "5-cliques: $time_5_cliques s"
echo "3-motifs: $time_3_motifs s"
echo "4-motifs: $time_4_motifs s"

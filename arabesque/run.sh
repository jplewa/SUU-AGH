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
./run_arabesque.sh /app/scripts/cluster.yaml /app/scripts/motifs.yaml

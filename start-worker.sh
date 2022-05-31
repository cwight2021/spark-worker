#!/bin/bash

export SPARK_MASTER_HOST=`hostname-i`
cd /opt/spark/bin && ./spark-class org.apache.spark.deploy.worker.Worker --ip $SPARK_MASTER_HOST --port 9091 -c 2 -m 2G spark://$SPARK_MASTER_HOST:7077

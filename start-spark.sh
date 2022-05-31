#!/bin/bash

. "/opt/spark/bin/load-spark-env.sh"

export SPARK_WORKER=`hostname -i`

cd /opt/spark/bin && ./spark-class org.apache.spark.deploy.worker.Worker --ip $SPARK_WORKER --port 9091 spark://spark-git-10-29c6q:7077

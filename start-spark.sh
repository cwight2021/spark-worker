#!/bin/bash

. "/opt/spark/bin/load-spark-env.sh"

export SPARK_WORKER=`hostname -i`

cd /opt/spark/bin && ./spark-class org.apache.spark.deploy.worker.Worker -c 3 -m 4G spark://spark-git-10-29c6q:7077

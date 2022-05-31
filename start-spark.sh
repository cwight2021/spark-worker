#!/bin/bash

. "/opt/spark/bin/load-spark-env.sh"

export SPARK_WORKER=`hostname -i`

if [ "$SPARK_WORKLOAD" == "master" ];
then

export SPARK__HOST=`hostname`

cd /opt/spark/bin && ./spark-class org.apache.spark.deploy.master.Master --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG

elif [ "$SPARK_WORKLOAD" == "worker" ];
then

cd /opt/spark/bin && ./spark-class org.apache.spark.deploy.worker.Worker --ip $SPARK_WORKER --port 9091  --webui-port 8080  spark://10.129.1.141:7077

elif [ "$SPARK_WORKLOAD" == "submit" ];
then
    echo "SPARK SUBMIT"
else
    echo "Undefined Workload Type $SPARK_WORKLOAD, must specify: master, worker, submit"
fi

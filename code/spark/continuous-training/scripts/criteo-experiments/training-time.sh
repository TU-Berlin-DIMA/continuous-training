/share/hadoop/behrouz/spark/stable/bin/spark-submit --class de.dfki.experiments.TrainingTimes --master "spark://cloud-11.dima.tu-berlin.de:7077" /share/hadoop/behrouz/jars/continuous-training-1.0-SNAPSHOT-jar-with-dependencies.jar "input=hdfs://cloud-11:44000/user/behrouz/criteo/experiments/initial-training/day_0" "stream=hdfs://cloud-11:44000/user/behrouz/criteo/experiments/stream/day_5" "result=/share/hadoop/behrouz/experiments/criteo-full/training-time" "delimiter=\t" "features=300000000" "evaluation=hdfs://cloud-11:44000/user/behrouz/criteo/experiments/evaluation/sample_6/" "slack=10"
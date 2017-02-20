
~/Documents/frameworks/spark-2.1.0-bin-hadoop2.7/bin/spark-submit --class de.dfki.classification.ContinuousClassifier --master "spark://berlin-189.b.dfki.de:7077" target/continuous-training-1.0-SNAPSHOT-jar-with-dependencies.jar "batch-duration=1" "slack=10" "result-path=results/cover-types/continuous" "initial-training-path=data/cover-types/initial-training" "streaming-path=data/cover-types/stream-training" "temp-path=data/cover-types/temp-data"

~/Documents/frameworks/spark-2.1.0-bin-hadoop2.7/bin/spark-submit --class de.dfki.preprocessing.CriteoFeatureEngineering --master "spark://berlin-189.b.dfki.de:7077" target/continuous-training-1.0-SNAPSHOT-jar-with-dependencies.jar "input-path=data/criteo-sample/raw/" "output-path=data/criteo-sample/"


https://s3-eu-west-1.amazonaws.com/criteo-labs/dac.tar.gz
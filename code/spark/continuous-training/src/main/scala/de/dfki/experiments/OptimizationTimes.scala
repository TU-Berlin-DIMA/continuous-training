package de.dfki.experiments

import de.dfki.core.sampling.TimeBasedSampler
import de.dfki.deployment.continuous.{ContinuousDeploymentNoOptimization, ContinuousDeploymentWithOptimizations}
import de.dfki.experiments.profiles.URLProfile
import org.apache.spark.SparkConf
import org.apache.spark.streaming.{Seconds, StreamingContext}

/**
  * code for effect of optimizations in the entire and individual pipeline comonents
  *
  * @author behrouz
  */
object OptimizationTimes extends Experiment {
  override val defaultProfile = new URLProfile()

  def main(args: Array[String]): Unit = {
    val params = getParams(args, defaultProfile)

    val conf = new SparkConf().setAppName("Optimization Time Experiment")
    val masterURL = conf.get("spark.master", "local[*]")
    conf.setMaster(masterURL)

    val ssc = new StreamingContext(conf, Seconds(1))
    // Continuous deployment without any optimizations
    val continuousPipeline = getPipeline(ssc.sparkContext, params)
    new ContinuousDeploymentNoOptimization(history = params.inputPath,
      streamBase = params.streamPath,
      evaluation = s"${params.evaluationPath}",
      resultPath = s"${params.resultPath}",
      daysToProcess = params.days,
      slack = params.slack,
      sampler = new TimeBasedSampler(size = params.sampleSize),
      otherParams = params).deploy(ssc, continuousPipeline)
  }
}

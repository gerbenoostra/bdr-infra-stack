#!/usr/bin/env bash
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home
export SPARK_HOME=$PWD/spark-2.3.0-bin-hadoop2.7
sparkling-water-2.3.0/bin/sparkling-shell
#-----
#  Spark master (MASTER)     : local[*]
#  Spark home   (SPARK_HOME) : /Users/gerben/Downloads/spark-2.3.0-bin-hadoop2.7
#  H2O build version         : 3.18.0.5 (wolpert)
#  Sparkling Water version   : 2.3.0
#  Spark build version       : 2.3.0
#  Scala version             : 2.11
#----

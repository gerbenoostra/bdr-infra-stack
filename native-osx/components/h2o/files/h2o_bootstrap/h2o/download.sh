#!/usr/bin/env bash
SPARK=spark-2.3.0-bin-hadoop2.7
wget -N http://mirror.novg.net/apache/spark/spark-2.3.0/$SPARK.tgz
rm -rf $SPARK || true
tar -xzf $SPARK.tgz

H2O=sparkling-water-2.3.0
wget -N https://h2o-release.s3.amazonaws.com/sparkling-water/rel-2.3/0/$H2O.zip
rm -rf $H2O || true
unzip $H2O.zip

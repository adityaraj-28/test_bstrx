#!/bin/bash

for i in {1..100}
do
  cp crawls/collections/${i}/${i}_0.warc.gz ./collected_warcs
done
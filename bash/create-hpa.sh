#!/bin/bash

kubectl autoscale deployment jwt-generator-deploy --cpu-percent=50 --min=1 --max=5 && \
  kubectl autoscale deployment restful-api-deploy --cpu-percent=50 --min=1 --max=5
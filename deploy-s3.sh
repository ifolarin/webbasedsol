#!/bin/bash

#Clone and build s3-backup
git clone https://github.com/ifolarin/docker-s3-cron-backup.git
cd docker-s3-cron-backup
docker build -t webbasedsol/s3-cron-backup:0.1.0 .
docker tag  webbasedsol/s3-cron-backup:0.1.0 webbasedsol/s3-cron-backup:latest
cd -


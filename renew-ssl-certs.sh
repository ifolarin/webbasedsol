#!/bin/bash

sudo docker run -it --rm \
	-v $(pwd)/config/letsencrypt/etc:/etc/letsencrypt \
	-v $(pwd)/config/letsencrypt/lib:/var/lib/letsencrypt \
	-v $(pwd)/config/letsencrypt/www:/var/www/.well-known \
	haocen/certbot renew


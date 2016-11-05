#!/bin/bash

/usr/sbin/apachectl &

exec "$@"


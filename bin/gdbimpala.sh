#!/bin/sh
gdb -p `ps -ef | grep impalad | grep 25000 | awk '{print $2}'`

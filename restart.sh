echo "* stop service"
./bin/start-impala-cluster.py --kill
echo "* start service"
./bin/start-impala-cluster.py

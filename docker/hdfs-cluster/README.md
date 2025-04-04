# HDFS Cluster

## Start

```bash
# https://bytemedirk.medium.com/setting-up-an-hdfs-cluster-with-docker-compose-a-step-by-step-guide-4541cd15b168

docker compose up -d
```
## Copy files

```bash
echo "Hello, HDFS" > test.txt
docker cp test.txt namenode:/tmp/
docker exec -it namenode hdfs dfs -put /tmp/test.txt /

docker exec -it namenode hdfs dfs -cat /test.txt


```
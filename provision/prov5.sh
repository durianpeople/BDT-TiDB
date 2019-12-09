cd tidb-v3.0-linux-amd64
./bin/tikv-server --pd="192.168.17.28:2379,192.168.17.29:2379,192.168.17.30:2379" \
                --addr="192.168.17.32:20160" \
                --data-dir=tikv \
                --log-file=tikv.log &

# Node exporter
./node_exporter --web.listen-address=":9100" \
    --log.level="info" &
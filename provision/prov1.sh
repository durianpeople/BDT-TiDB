cd tidb-v3.0-linux-amd64
./bin/pd-server --name=pd1 \
                --data-dir=pd \
                --client-urls="http://192.168.17.28:2379" \
                --peer-urls="http://192.168.17.28:2380" \
                --initial-cluster="pd1=http://192.168.17.28:2380,pd2=http://192.168.17.29:2380,pd3=http://192.168.17.30:2380" \
                --log-file=pd.log &


# SETELAH SEMUANYA
cd tidb-v3.0-linux-amd64
./bin/tidb-server --store=tikv \
                --path="192.168.17.28:2379" \
                --log-file=tidb.log &

# Prometheus
cd prometheus-2.2.1.linux-amd64
./prometheus \
    --config.file="./prometheus.yml" \
    --web.listen-address=":9090" \
    --web.external-url="http://192.168.17.28:9090/" \
    --web.enable-admin-api \
    --log.level="info" \
    --storage.tsdb.path="./data.metrics" \
    --storage.tsdb.retention="15d" &

# Node exporter
./node_exporter --web.listen-address=":9100" \
    --log.level="info" &

# Grafana
./bin/grafana-server \
    --config="./conf/grafana.ini" &
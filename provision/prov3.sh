cd tidb-v3.0-linux-amd64
./bin/pd-server --name=pd3 \
                --data-dir=pd \
                --client-urls="http://192.168.17.30:2379" \
                --peer-urls="http://192.168.17.30:2380" \
                --initial-cluster="pd1=http://192.168.17.28:2380,pd2=http://192.168.17.29:2380,pd3=http://192.168.17.30:2380" \
                --log-file=pd.log &

# Node exporter
./node_exporter --web.listen-address=":9100" \
    --log.level="info" &
FROM ubuntu:focal

RUN apt-get update && apt-get install -y \
iptables \
python3-iptables \
python3-prometheus-client \
&& rm -rf /var/lib/apt/lists/*

# Source
COPY iptables-exporter /usr/local/bin/iptables-exporter
COPY iptables_exporter /usr/local/lib/python3.8/dist-packages/iptables_exporter

RUN chmod 0755 /usr/local/bin/iptables-exporter \
&& python3 -m compileall /usr/local/lib/python3.8/dist-packages/iptables_exporter

EXPOSE 9119

ENTRYPOINT ["iptables-exporter"]
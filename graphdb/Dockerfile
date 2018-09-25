# Use open jdk 8 alpine as base image
FROM openjdk:8-alpine

# Build time arguments (GraphDB edition and version)
ARG edition=free
ARG version=8.6.1

# Add GraphDB and config to image
COPY graphdb-${edition}-${version}-dist.zip /tmp/
COPY config.ttl /tmp/ 

# Setup GraphDB
RUN apk add --no-cache bash && \
    mkdir -p /opt/graphdb/ && \
    unzip /tmp/graphdb-${edition}-${version}-dist.zip -d /opt/graphdb/ && \
    rm /tmp/graphdb-${edition}-${version}-dist.zip && \
    mv /opt/graphdb/graphdb-${edition}-${version} /opt/graphdb/dist && \
    # Tune loadrdf
    #sed -i 's/com.ontotext.graphdb.loadrdf.LoadRDF/-Dpool.buffer.size=400000 -Dinfer.pool.size=4 com.ontotext.graphdb.loadrdf.LoadRDF/' /opt/graphdb/dist/bin/loadrdf && \
    # Download latest graph
    wget -P /tmp/ -O backup.trig https://api.parliament.uk/download/latest && \
    # Restore repository
    /opt/graphdb/dist/bin/loadrdf -c /tmp/config.ttl -m parallel /tmp/backup.trig && \
    rm -rf /tmp/*

# Add GraphDB to path
ENV PATH=/opt/graphdb/dist/bin:$PATH

# Run graphdb
CMD ["graphdb"]

# Expose default GraphDB port
EXPOSE 7200
# docker-mininet-fabric hosted by Hyperkit light VM for MAC
A container for mininet-based DC topologies controlled by ONOS.

### ONOS docker container

Pulling image from official onos repo:

```
docker pull onosproject/onos
```

Run container exposing container GUI ONOS port and ONOS console to localhost:

```
docker run  -t -d -p 8085:8181 -p 8086:8101 --name onos1 onosproject/onos
```

GUI accessible in localhost:8085. Access ONOS console within container (localhost:8086 user:onos/passwd:rocks):

```
ssh -p 8086 karaf@localhost (passwd: karaf)
```

From: onos console>

```
onos> app activate org.onosproject.openflow
onos> app activate org.onosproject.fwd
```

### Data plane emulation Container

Edit docker-compose.yml to specify number of ONOS controllers when testing clustering and number of leaf, spines and hosts.

```
docker-compose build fabric
```

Most usual case, create a topology and provide interactive mininet console:

```
docker-compose run fabric
```

Create topology:

```
docker-compose up -d
```

Stop and remove container:

```
docker-compose down -d
```

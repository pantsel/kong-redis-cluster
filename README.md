# Kong Redis Cluster
A playground environment to showcase common use cases of Kong's rate limiting and caching plugins backed up by a redis cluster

## Prerequisites
- Kong Gateway Enterprise with a valid license
- Docker and Docker Compose
- Kong decK ([Documentation](https://docs.konghq.com/deck/latest/))

## Getting Started

### Clone the repository
```bash
$ git clone ...
$ cd ...
```

### Generate the required certificates
```bash
$ chmod +x ./gencerts.sh
$ ./gencerts.sh
```

### Export Kong licence data

```bash
$ export KONG_LICENSE_DATA=$(< /path/to/kong/license.json)  
```

### Configure environment (optional)

Copy .env-example to .env and adjust the environment variables if required

```bash
$ cp .env-example .env
```

### Start the Playground

```bash
$ docker compose up -d
```

## Playground components

The playground environment includes:

- Kong Gateway Enterprise Control Plane. Admin API available at http://localhost:8001 or https://localhost:8444.
- Kong Gateway Enterprise Data Plane. Proxy available at http://localhost:8000 or https://localhost:8443.
- Kong Manager accessible at http://localhost:8002 or https://localhost:8445.
- A simple echo server.
- A Redis cluster consisting of 6 nodes: 3 masters and 3 replicas.
- Redis insights GUI at http://localhost:5540
- Example state files in the `./examples` folder to get you started with common use cases.


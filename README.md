# Python 3.11 Base Docker Image

A pre-built Docker base image with Python 3.11 and commonly used dependencies for faster deployment.

## Features

- **Base**: Python 3.11 slim
- **System Dependencies**: PostgreSQL client, build tools
- **Pre-installed Packages**: Common Python libraries
- **Optimized**: No cache, minimal layers

## Usage

### Pull from Docker Hub

```bash
docker pull oceantaotie/py-base:3.11
```

### Use in Your Dockerfile

```dockerfile
FROM oceantaotie/py-base:3.11

WORKDIR /app
COPY . .

CMD ["python", "main.py"]
```

## Building

Build the base image:

```bash
docker build -t oceantaotie/py-base:3.11 .
```

Push to Docker Hub:

```bash
docker push oceantaotie/py-base:3.11
```

## Included Packages

See [requirements.txt](requirements.txt) for the full list of pre-installed Python packages.

## Why Use This?

- **Faster Builds**: Dependencies are pre-installed
- **Consistent Environment**: Same base across deployments
- **Smaller Final Images**: Reuse cached layers

## Maintenance

This image is maintained for personal projects and is updated periodically.

## License

MIT

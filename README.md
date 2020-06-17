docker build --tag my_jenkins:latest .

docker run -d -p 0.0.0.0:8080:8080 -p 0.0.0.0:50000:50000  -v /var/run/docker.sock:/var/run/docker.sock --name Jenkins <image name>

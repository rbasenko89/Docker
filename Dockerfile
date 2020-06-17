FROM jenkins AS build
USER root
WORKDIR /src
COPY . .
RUN cd /usr/local/bin && \
curl https://master.dockerproject.org/linux/amd64/docker > docker && \
chmod +x docker && \
groupadd -g 999 docker && \
usermod -a -G docker jenkins
USER jenkins

FROM scratch
USER jenkins
WORKDIR /src/jenkins 
COPY --from=build /src .

ENTRYPOINT ["/src/jenkins"]

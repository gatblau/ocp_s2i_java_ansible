# uses the java s2i image
# https://github.com/gatblau/ocp_s2i_java.git
FROM java:latest

# switch to the root user
USER root

# install ansible and git
# configure the git user
# create .ssh folder
RUN INSTALL_PKGS="git ansible" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all -y && \
    rm -rf /var/cache/yum && \
    mkdir -p /app/.ssh && \
    git config --system user.name ansible && \
    git config --system user.email ansible-controller@gmail.com

# copy license
COPY LICENSE /deployments/

# copy ssh configuration
COPY config /app/.ssh/

# define labels
LABEL io.k8s.display-name="Ansible" \
      io.k8s.description="A containerised Ansible control node for OpenShift." \
      io.openshift.tags="openshift,ansible" \
      maintainer="gatblau.org"

# switch to app user
USER app
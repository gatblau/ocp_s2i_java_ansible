# OpenShift s2i image for Ansible

## Using the Image

Create a build configuration for the Dockerfile and an image stream in OpenShift as follows:

```bash
oc new-build https://github.com/gatblau/ocp_s2i_java_ansible --to=java_ansible --strategy=docker -n myproject --token=$TOKEN

```
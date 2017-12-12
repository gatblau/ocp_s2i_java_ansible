# OpenShift s2i image for Ansible

An OpenShift s2i image with Java and Ansible.

## How to use the image

### Create a new build

Ensure you have the ['java' image stream](https://github.com/gatblau/ocp_s2i_java) created first.

Create a build configuration for the Dockerfile and an image stream in OpenShift as follows:

```bash
# clone the repository
git clone https://github.com/gatblau/ocp_s2i_java_ansible.git

# create a build configuration
oc new-build https://github.com/gatblau/ocp_s2i_java_ansible.git --name=java_ansible --to=java_ansible --strategy=docker -n myproject

# check the build progress
oc logs -f bc/java_ansible
```

### Build a Java application

```bash
# create a binary build from the 'java' image stream 
oc new-build  -i java_ansible --binary=true --to=my_app --strategy=source

# start the build using the application jar file
oc start-build my_app --from-file=./target/java_app-0.0.1-SNAPSHOT.jar --follow
```

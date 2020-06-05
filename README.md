# Abount project
This project is to setup LAB environment  ent using Vagrant and VirtualBox. 

## Prerequisite 
### Install Virtulbox softwaer
Download 5.2 version of software
https://www.virtualbox.org/wiki/Download_Old_Builds_5_2

### Install Vagaant software
Download from below
https://www.vagrantup.com/downloads

### configure kuberneties cli in your laptop
https://kubernetes.io/docs/tasks/tools/install-kubectl/


jig@JigWin:~/code/k8play$ ls -l /bin/linux/amd64/kubectl
ls: cannot access '/bin/linux/amd64/kubectl': No such file or directory
jig@JigWin:~/code/k8play$ ls -l
total 43008
-rw-r--r-- 1 jig jig       70 Jun  4 20:48 README.md
-rw-r--r-- 1 jig jig 44032000 Jun  5 09:50 kubectl
-rw-r--r-- 1 jig jig      241 Jun  5 09:34 test.yaml
drwxr-xr-x 1 jig jig     4096 Jun  5 09:38 test1
jig@JigWin:~/code/k8play$ chmod +x kubectl 
jig@JigWin:~/code/k8play$ sudo mv ./kubectl /usr/local/bin/
[sudo] password for jig: 
jig@JigWin:~/code/k8play$ kubectl version --client
Client Version: version.Info{Major:"1", Minor:"18", GitVersion:"v1.18.3", GitCommit:"2e7996e3e2712684bc73f0dec0200d64eec7fe40", GitTreeState:"clean", BuildDate:"2020-05-20T12:52:00Z", GoVersion:"go1.13.9", Compiler:"gc", Platform:"linux/amd64"}

e.g.

before:
jig@JigWin:~/code/k8play$ kubectl create -f test1/pod-definition.yml 
kubectl: command not found
jig@JigWin:~/code/k8play$ 

after:
jig@JigWin:~/code/k8play$  kubectl create -f test1/pod-definition.yml
The connection to the server localhost:8080 was refused - did you specify the right host or port?
jig@JigWin:~/code/k8play$ 


## Ansible - folder
This folder has a required files to setup environment as below.

lb1 - VM For Loadbalancer
vm1 - vm server 1
vm2 - vm server 2

### to start lab
1) clone this folder to your PC/MAC
2) go to that folder and run command
vagrant up
3) repeat this for all 3 folder 

## kubernetes
This folder has a required files to setup environment as below.

k8node1 - Kubernetes node 1
k8node2 - Kubernetes node 1
k8node3 - Kubernetes node 1

### to start lab
1) clone this folder to your PC/MAC
2) go to that folder and run command
vagrant up
3) repeat this for all 3 folder 
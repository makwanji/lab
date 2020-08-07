#!/bin/bash

echo "set location of your home folder"

export LAB_HOME_LOC=/home/jig/lab/
echo "$LAB_HOME_LOC"

echo "start node1"
cd $LAB_HOME_LOC/kubernetes/k8node1
vagrant up

echo "start node2"
cd $LAB_HOME_LOC/kubernetes/k8node2
vagrant up

echo "start node2"
cd $LAB_HOME_LOC/kubernetes/k8node3
vagrant up

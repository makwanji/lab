Rem set location of your home folder

set LAB_HOME_LOC=C:\mylab\lab
echo %LAB_HOME_LOC%

Rem start node1
cd %LAB_HOME_LOC%\kubernetes\k8node1
vagrant up

Rem start node2
cd %LAB_HOME_LOC%\kubernetes\k8node2
vagrant up

Rem start node3
cd %LAB_HOME_LOC%\kubernetes\k8node3
vagrant up


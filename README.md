# ansible-demo
Notes and files required for IOTA Ansible demo.

## App source code 
https://github.com/mmumshad/simple-webapp
(Somebody had very conveniently created it for Ansible testing!)

## GCP setup:
### 1. Launch two Ubuntu 18.06 virtual machines in GCP.
Go to Compute Engine (VM instances)

Instance 1:
- name: ansible-controller
- Operating system: Ubuntu 18.04 LTS (Under Boot Disk section)
- Check Allow HTTP traffic (Under Firewall section)
- Network: default

Instance 2: 
- name: ansible-host
Rest same as Instance 1 

### 2. Open port 5000 for both instances
1. Go to Compute Engine (VPC networks)
2. Click on "default"
3. Scroll and go to firewall rules section
4. Add firewall rule with the following config:
	- name: allow-5000
        - Target: All instances in the network
        - Source IP range: 0.0.0.0/0
        - Under Port and Protocols:
		- Check tcp and allow 5000
5. Click on create

This will open port 5000 for all the instances in the "default" network.


### 3. Install Ansible in both instances 
This step has to be done in **both** the instances.
First SSH into the desired instance (Look at HOW TO SSH section).
Follow the steps in this link (Only step 1): https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-18-04

Check: `ansible --version` should return the version number in the first line.

### 3. Install Git in both machines
https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-18-04-quickstart
No need to setup configs

### Make sure that ansible-host can be SSHed from anisble-controller
This is a little advanced ( I will be explaining this in the session if you don't follow ). For now just follow the instructions.
#### In ansible-controller machine:
SSH into ansible-controller
1. `sudo su - ubuntu` 
2. `ssh-keygen` (keep pressing enter till you see some weird patterns!)
3. `cat ~/.ssh/id_rsa.pub` (copy the contents somewhere)
#### In ansible-host machine:
1. Click on ansible-host
2. Go to SSH Keys section
3. Put the copied public key under this section (you should see "ubuntu" on the left side after a short delay)

Now, if you SSH into ansible-controller and do `ssh ansible-host` from there, you should be in the host machine.

## HOW TO SSH
Go to Compute Engine (VM instances)
1. Click on the instance you want to SSH into.
2. Click on the small downward arrow next to SSH
2. View gcloud command
3. Click on RUN IN CLOUD SHELL. This will launch a Cloud Shell and automatically put you inside the desired instance (ansible-controller or ansible-host, whichever is desired)

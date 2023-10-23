# Inception

## Setups

### Add user to sudo group

```
su -
usermode -aG sudo {user}
# Re-login the session
```

### VM port forwarding

```
sudo apt update
sudo apt upgrade
sudo apt install openssh-server
sudo nano /etc/ssh/sshd_config # Change Port and PasswordAuthentication
systemctl restart ssh

# Open {ssh_port} that you changed at VM Network interface tab
# Connect to the VM from the host by ssh
# !IMPORTANT! You have to run this command on HOST(i.e. in the cluster shell)
ssh {user}@localhost -p {ssh_port}
```

### VM shared folder

```
# Make the config with a folder named {vm_inception_folder} and enable options, `Auto Mount` and `Make Permanant`, at VM Shared Folder interface tab and then:
# !IMPORTANT! {vm_inception_folder} have to be different to `inception`(directory name used below) because the mount command cannot find `inception` folder if its name is same with {vm_inception_folder}, so you will set {vm_inception_folder} like `shared_inception`

mkdir ~/inception in the end.
id # Check uid and gid
umask # It is suspicious. umask mount option doensn't work in my evironment so skipped it.
sudo nano /etc/fstab # Add a line: {vm_inception_folder} /home/{user}/inception vboxsf gid={gid},uid={uid}
# Re-start the VM
```

### Resolve nameserver

```
sudo nano /etc/resolve.conf # Add a line: nameserver 8.8.8.8
```

### Change host

```
sudo nano /etc/hosts # Change the line to: {ip} {url_as_subject_requires}
```

### Install Docker 

> _Follow the setup instruction of the official in advance_

```
sudo usermod -aG docker {user}
# Re-login the session
```

## Run

```
make cert
make env
make volume
make
```
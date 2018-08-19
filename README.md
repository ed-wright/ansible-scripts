# ansible-scripts
This is all that is required to setup linux hosts with various configurations.

## One-Step Automated Install
Those who want to get started quickly and conveniently, may install Pi-hole using the following command:

#### `curl -sSL https://rawgit.com/ed-wright/ansible-scripts/master/scripts/minimal.sh | sudo bash`

## Alternative Install Methods
### Method 1: Clone repository
```bash
# Safe Install:
sudo yum install git -y
cd /opt
sudo git clone https://github.com/ed-wright/ansible-scripts.git
sudo sh /opt/ansible-scripts/menu.sh
```

### Method 2: Copy Install Script and run
```bash
# Automatic Install:
sudo touch ~/minimal.sh
Add the contents of scripts/minmimal.sh
sudo ~/minimal.sh
```

## The basic principle for the anisble host
1. A minimal bash script install git and pulls this repo
2. A menu system then asks what you want to install
3. The scripts then installs ansible
4. The script asks about hosts

## The basic principle for the anisble host
1. A minimal bash script install git and pulls this repo
2. A menu system then asks what you want to install
3. The scripts then installs ansible
4. The script asks about hosts

## Scripts
| Name | Description | Language | Done |
|---|---|---|---|
| minimal.sh | Minimal install script that installs git and pulls the repo | Bash | Yes |
| menu.sh | This is your starting point | Bash | Yes |
| update.sh | Updates the repo, DO NOT RUN THIS, use menu.sh | Bash | yes |
| Ansible Host Init | Install and setup of Ansible | Bash | In Progress |
| Docker Host Init | This is the minimal install script that installs git and pulls the repo | Bash | No |

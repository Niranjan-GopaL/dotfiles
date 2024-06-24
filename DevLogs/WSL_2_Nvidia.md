## WSL COMMANDS

```sh

wsl --list --online # all distributions that is available

wsl --install -d {distribution name}
wsl --install -d kali-linux

wsl --list --verbose # shows all the RUNNING DISTRIBUTIONS

# how to shutdown each distribution
wsl -t Ubuntu
wsl -t kali-linux

```

## NVIDIA DEPENDENCIES IN WSL2

```sh
gcc --version
sudo apt install gcc --fix-missing
```

## SUFFERING FROM SHITTY NVIDIA DOCUMENTATION 

https://developer.nvidia.com/cuda-11-8-0-download-archive?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_local 

```sh
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-wsl-ubuntu-11-8-local_11.8.0-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-11-8-local_11.8.0-1_amd64.deb

# if the 4th command does not work, run this command and THEN run 4th one again
sudo cp /var/cuda-repo-wsl-ubuntu-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/


sudo apt-get update
sudo apt-get -y install cuda
```

Then go to post installation guide from https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#mandatory-actions

```sh

# note that the VERSION OF CUDA WAS CHANGED ; put this in your .bashrc or .zshrc
export PATH=/usr/local/cuda-11.8/bin${PATH:+:${PATH}}

sudo apt install nvidia-cuda-toolkit
```


```sh
nvidia-smi ( system management interface)
nvcc -V # nvidia cuda compiler version
```


```sh
python3 --version
```


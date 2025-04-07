# ollama setup

https://chat.adnovumlabs.com


# Install CUDA - CUDA Toolkit Installer

```bash
## Ref - https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=24.04&target_type=deb_network

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-8

# opendriver
sudo apt-get install -y nvidia-open
nvidia-smi

```

# Install Ollama
curl -fsSL https://ollama.com/install.sh | sh
ollama -v


# Install NvTop

```bash
sudo apt install nvtop -y
```

# Test Model

curl http://3.81.248.56:11434/api/pull -d '{"model": "mistral-nemo", "keep_alive": -1}'



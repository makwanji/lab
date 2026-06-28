# HomeLab Setup
This project is to setup Home lab for PoC tools

## Laptop setup - Windows

```ps
powershell -ExecutionPolicy Bypass -File .\bootstrap-devsecops.ps1
```

# Install Tools in Win11 Laptop

```ps
# Base setup
winget install emoacht.Monitorian

# DevOps Tools
winget install Git.Git Microsoft.VisualStudioCode HashiCorp.Terraform Anthropic.ClaudeCode

# Local AI
winget install Ollama.Ollama 

ollama pull deepseek-r1:1.5b
ollama run deepseek-r1:1.5b
```

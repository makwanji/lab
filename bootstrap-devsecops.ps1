<#
.SYNOPSIS
DevSecOps workstation bootstrap using winget (silent, no prompts)

.NOTES
Run PowerShell as Administrator:
PS> Set-ExecutionPolicy Bypass -Scope Process -Force
PS> .\bootstrap-devsecops.ps1
#>

# --- Ensure Admin ---

if (-not ([Security.Principal.WindowsPrincipal] `     [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
[Security.Principal.WindowsBuiltinRole] "Administrator")) {
Write-Host "Please run this script as Administrator." -ForegroundColor Red
exit 1
}

# --- Logging ---

$logFile = "$env:TEMP\devsecops-bootstrap.log"
Start-Transcript -Path $logFile -Append

Write-Host "Starting DevSecOps bootstrap..." -ForegroundColor Green

# --- Common winget args ---

$commonArgs = @(
"--accept-package-agreements",
"--accept-source-agreements",
"--silent",
"--disable-interactivity"
)

# --- Package list ---

$packages = @(
"Docker.DockerCLI",
"Microsoft.VisualStudioCode",
"Notepad++.Notepad++",
"Postman.Postman",
"Kubernetes.kubectl",
"Helm.Helm",
"derailed.k9s",
"Microsoft.AzureCLI",
"Amazon.AWSCLI",
"AquaSecurity.Trivy",
"Bridgecrew.Checkov",
"Gitleaks.Gitleaks",
"HashiCorp.Terraform",
"Gruntwork.Terragrunt",
"Git.Git",
"GitHub.cli",
"Microsoft.WindowsTerminal",
"Microsoft.PowerShell",
"JGraph.Draw",
"WiresharkFoundation.Wireshark",
"Grafana.k6",
"jqlang.jq"
)

# --- Install loop ---

foreach ($pkg in $packages) {
Write-Host "Installing $pkg ..." -ForegroundColor Cyan
try {
winget install --id $pkg -e @commonArgs
}
catch {
Write-Host "Failed: $pkg (continuing)" -ForegroundColor Yellow
}
}

Write-Host "Installation phase completed." -ForegroundColor Green

# --- Basic validation ---

Write-Host "Verifying key tools..." -ForegroundColor Cyan

$commands = @(
"docker",
"kubectl",
"helm",
"az",
"aws",
"terraform",
"git",
"gh",
"jq"
)

foreach ($cmd in $commands) {
if (Get-Command $cmd -ErrorAction SilentlyContinue) {
Write-Host "$cmd is available" -ForegroundColor Green
} else {
Write-Host "$cmd NOT found in PATH" -ForegroundColor Red
}
}

# --- Finish ---

Stop-Transcript

Write-Host "Bootstrap complete!"
Write-Host "Log file: $logFile"

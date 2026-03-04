param(
    [Parameter(Mandatory = $true)]
    [string]$GitHubUser,

    [Parameter(Mandatory = $true)]
    [string]$RepoName,

    [string]$Branch = "gh-pages",

    [switch]$UseSsh
)

$ErrorActionPreference = "Stop"
Set-Location -Path $PSScriptRoot

$remoteUrl = if ($UseSsh) {
    "git@github.com:$GitHubUser/$RepoName.git"
} else {
    "https://github.com/$GitHubUser/$RepoName.git"
}

if (-not (Test-Path ".git")) {
    git init | Out-Null
}

$remoteNames = @(git remote)
if ($remoteNames -contains "origin") {
    git remote set-url origin $remoteUrl
} else {
    git remote add origin $remoteUrl
}

git add .
git diff --cached --quiet
$hasChanges = ($LASTEXITCODE -ne 0)
if ($hasChanges) {
    git commit -m "Deploy: update topology page" | Out-Null
}

git branch -M $Branch
git push -u origin $Branch

Write-Host ""
Write-Host "Push completed." -ForegroundColor Green
Write-Host "Now open GitHub -> Settings -> Pages and set: Deploy from a branch / $Branch / root" -ForegroundColor Cyan
if ($RepoName -eq "$GitHubUser.github.io") {
    Write-Host "Preview URL: https://$GitHubUser.github.io/" -ForegroundColor Yellow
} else {
    Write-Host "Preview URL: https://$GitHubUser.github.io/$RepoName/" -ForegroundColor Yellow
}

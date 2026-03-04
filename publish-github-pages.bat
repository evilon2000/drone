@echo off
set /p GITHUB_USER=GitHub username: 
set /p REPO_NAME=Repository name: 
powershell -ExecutionPolicy Bypass -File "%~dp0publish-github-pages.ps1" -GitHubUser %GITHUB_USER% -RepoName %REPO_NAME%
pause

# Topology Page 部署说明

这个目录已经是一个可发布的静态站点：

- `index.html`：拓扑页面
- `.nojekyll`：避免 GitHub Pages 的 Jekyll 处理
- `publish-github-pages.ps1`：自动初始化 + 提交 + 推送
- `publish-github-pages.bat`：双击交互式发布

## 需要你的 GitHub 地址吗？
需要，最少要这两个信息：

1. GitHub 用户名（例如 `yourname`）
2. 仓库名（例如 `topology-pages`）

远程地址就是：`https://github.com/<用户名>/<仓库名>`

## 一键发布（推荐）

### 1) 先在 GitHub 新建仓库
- 建议建 `Public` 仓库
- 仓库名可用：`topology-pages`

### 2) 本地执行发布脚本
在 PowerShell 中运行：

```powershell
cd G:\CODEX\topology-pages
.\publish-github-pages.ps1 -GitHubUser <你的用户名> -RepoName <你的仓库名>
```

或直接双击：`publish-github-pages.bat`

### 3) 开启 GitHub Pages
进入仓库页面：
- `Settings` -> `Pages`
- `Build and deployment`: 选择 `Deploy from a branch`
- `Branch`: 选择 `main`，目录选 `/ (root)`
- 保存

## 访问地址

- 普通仓库：`https://<用户名>.github.io/<仓库名>/`
- 若仓库名是 `<用户名>.github.io`：`https://<用户名>.github.io/`

## 常见问题

- 推送失败（权限）：先确认本机 `git` 已登录（Git Credential Manager / SSH key）
- 页面 404：通常是 Pages 未开启，或刚开启还在发布（等 1-2 分钟）

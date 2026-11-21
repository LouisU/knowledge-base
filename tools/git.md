[TOC]
# Git
## Git 核心原理
Git是**分布式版本控制系统**（DVCS），和 SVN 这类集中式最大区别：**每个人本地都有完整仓库快照，不依赖中央服务器**。

### 4 个核心区域-最重要(需要再理解，再表达)
1. **工作区 Working Directory**：可见看到、正在编辑的文件（本地磁盘文件）
2. **暂存区 Index / Stage**：临时存放改动了待提交到远程仓库的文件( 运行`git add` 之后保存文件的地方)
3. **本地仓库 Repository**：`.git` 目录，存放所有历史提交快照、分支、标签，`git commit` 把暂存区内容固化成一个版本
4. **远程仓库 Remote**：GitHub/Gitee 等服务器上的仓库，只是备份 / 多人协作的远端副本

> 将本地修改后的代码推送到远程仓库流程：
> `工作区 --(git add)--> 暂存区 --(git commit)--> 本地仓库 --(git push)--> 远程仓库`
> 
> 将远程仓库代码同步到本地工作区：
> `远程仓库 --(git fetch)--> 本地仓库 --(git merge)--> 工作区`


### 底层核心概念(需要再理解，再表达)

- **Snapshot（快照）**：Git 不是存 “文件差异”，每次 commit 保存一整套文件快照（文件没变就复用对象，节省空间）
- **对象库 .git/objects**：三种对象
  - blob：文件内容
  - tree：目录结构、文件名
  - commit：提交记录（作者、时间、上一个 commit 指针、tree 引用）
- **指针 HEAD**：指向当前所在分支最新提交，默认指向 `main/master`
- **分支 branch**：只是一个可变的轻量指针，指向某个 commit（新建分支几乎无开销）
- **Hash(SHA-1)**：每个对象唯一 40 位哈希，用来定位版本


### 常用命令
#### 初始化 和 配置
```bash
这里需要搞明白从初始化在本地怎么推远程，初始化在远程怎么同步到本地。

# 新建git仓库（在当前文件夹生成 .git）
git init

# 克隆远程仓库到本地
git clone <url>

# 配置用户名邮箱（当前仓库 / --global 全局）
git config --global user.name "xxx"
git config --global user.email "xxx@xxx.com"

# 查看配置
git config --list

```

#### 查看状态、改动、提交历史
```bash
# 查看文件状态：哪些改了、哪些在暂存
git status

# 看改动对比
git diff          # 工作区 vs 暂存区
git diff --staged # 暂存区 vs 本地仓库

# 查看提交历史
git log
git log --oneline --graph # 精简+图形化分支


```

#### 工作区->暂存区->远程仓库
```bash
# 添加指定文件到暂存区
git add <file>

# 当前仓库所有改动添加到暂存
git add .        

# 删除指定文件(git不再跟踪，但本地文件保留)
git rm --cached <file> 

# 指定文件暂停git跟踪（不推荐长期用）
git update-index --assume-unchanged <file>

# 指定文件恢复git跟踪
git update-index --no-assume-unchanged <file>

# 提交：暂存区生成一个commit快照
git commit -m "提交说明"

# 跳过add，直接提交已经跟踪过的文件（不推荐复杂场景）
git commit -am "msg"

# 将暂存区文件推送到远程仓库
git push
```
#### 远程协作
```bash
# 查看远程仓库别名（默认origin）
git remote -v

# 添加远程地址
git remote add origin <url>

# 拉取远端更新（下载远端commit，不合并）
git fetch origin

# 拉取+合并，等价 fetch + merge
git pull origin main

# 推送本地分支到远程
git push origin main


```

#### 分支操作
```bash
# 查看本地分支
git branch
# 查看所有（含远程）
git branch -a

# 创建分支
git branch dev

# 切换分支
git checkout dev

# 新版推荐 switch
git switch dev

# 创建并立刻切换
git switch -c dev

# 合并分支：在main分支合并dev
git merge dev

# 删除分支
git branch -d dev


```

#### 撤回、回滚(里面的操作待验证，验证完后给验证标签)
```bash
# 1. 暂存区撤销（文件还在工作区，取消add）
git reset HEAD <file>

# 2. 工作区丢弃改动（危险！本地修改直接丢失）
git checkout -- <file>
git restore <file>

# 3. 撤销最近一次commit，改动放回暂存区
git reset --soft HEAD~1

# 4. 撤销最近一次commit，改动放回工作区
git reset --mixed HEAD~1

# 5. 硬回滚：直接删掉这次提交，改动全部丢弃（谨慎！）
git reset --hard HEAD~1

# revert：新增一个反向提交，不修改历史（适合公共分支）
git revert <commit-hash>


```
#### 临时保存没提交的改动（切换分支很常用）
```bash
# 储藏当前工作改动
git stash

# 储藏并加备注
git stash save "临时改动"

# 列出储藏列表
git stash list

# 恢复最新储藏，并且删掉这条stash
git stash pop

# 恢复储藏，但保留stash记录
git stash apply


```

#### 标签tag
```bash
git tag v1.0.0
git tag
git push origin v1.0.0


```

#### dotfiles用git管理起来
```bash
mkdir -p ~/knowledge-base/dotfiles/sketchybar
mv ~/.config/sketchybar/sketchybarrc ~/knowledge-base/dotfiles/sketchybar/sketchybarrc
mv ~/.config/sketchybar/plugins ~/knowledge-base/dotfiles/sketchybar
ln -s ~/knowledge-base/dotfiles/sketchybar/sketchybarrc ~/.config/sketchybar/sketchybarrc
ln -s ~/knowledge-base/dotfiles/sketchybar/plugins ~/.config/sketchybar/plugins
<++>
```

<++>

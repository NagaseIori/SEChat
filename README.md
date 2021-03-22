一款用GMS2编写的P2P聊天工具。即时聊天、文件、图片、音乐播放与加密传输。


<!--more-->

# 简介
一款个人因学习GMS2用途兴趣使然编写的p2p聊天工具。

### 特性
* 无需经过服务器，端到端加密的即时聊天工具（局域网、公网访问或内网映射）
* 无损图片传输，可修改/自适应图片预览大小（支持jpeg、png等常见图片格式）
* 文件传输与音乐播放（支持mp3、flac等常见音乐格式）
* 聊天历史导出
* 聊天背景、主题色自定义，支持背景图高斯模糊
* 彩虹色的彩蛋
* 相对高效的文件处理、数据加密与网络传输
* 传输的文件、图片、音乐以无损形式立即保存在本地文件夹内
* 设置保留
* 可调整帧率

### 坏特性
* 只支持最基本的文字交互
* 不太稳定的文件传输逻辑
* 不太适应糟糕的网络环境
* 令人失望的文件传输速度上限（9Mb/s）
* 高fps下的高CPU占用
* 不太安全的数据加密算法（RC4 with RSA）
* 目前只支持Windows
* 无意义的部分设置
* 大量工地英语
* 暂不开源，代码太烂
* 还没有理清用了哪些项目，之后补上
* 低鲁棒性，出问题可能直接崩溃
* 没做完

# 使用方法
建议使用环境：Windows 7/8/10 x86/64

## 基本内容
右键粘贴/替换。右上角退出。

Export History 导出聊天历史。

Clear History 清屏与清理内存。操作不可逆。

FPS 调整全局帧率。

Wheel Speed 调整滚轮速度。

## 聊天
输入内容，然后回车。

## 建立连接
### 服务器端
进入Settings调整Local Port（本地服务器端口）后选择Create Server。

### 客户端
填写Server Address（服务器地址）与Server Port（服务器端口）后选择Connect。

## 传输文件/图片/音乐
将想要传输的**单个**文件拖入到聊天框中。

在Image Size一栏中填写预览图片大小（不改变已经生成的图片预览）。

## 自定义主题
Front Color 修改前景色。

Background Color 修改背景色。修改完成后背景将变成纯色类型。

Background Image 修改背景图片。修改完成后背景将变成图片类型。背景图左上角中心等比例拉伸。

Background Blur Amount 修改背景图片模糊量。值越高模糊半径越高。只在背景为图片类型下生效。

# 警告
你应只与你信任的人使用该工具。该工具未对聊天双方传输的文件作任何限制。音乐文件收到后会立即播放，而相关设置还没做好。

# Hackintosh AMD FX6300

这是一个给 AMD CPU 用的 Hackintosh, macOS 版本号：High Sierra 10.13.x

## 配置

| 硬件 | 型号 |
| :---: | :---: |
| CPU | AMD FX 6300 |
| 主板 | ASUS M5A97 LE R2.0 |
| 显卡 | NVIDIA GeForce GTX 650 |
| 内存 | Kingston 4 GB DDR3 1600MHz × 2 |
| 磁盘 | SanDisk 128 GB SSD |
| 声卡 | Realtek ALC887 |
| 网卡 | Realtek RTL8168/8111/8112 |
| 无线网卡 | Realtek RTL8188EU (TL-WN725N V2) |
| 显示器 | AOC 23" 2560 × 1440 |
| 光驱 | Pioneer DVD-RW DVR-221L |

## UEFI 设置

开启 EHCI Hand-off (EHCI 交接)

## 安装 HighSierraAMD V3

这里约定的分区名为 `macOS`

1. 以 UEFI 的方式启动，选择 `Boot macOS from HighSierraAMD`.
2. 进入安装界面，切换成中文。
3. 选择 `磁盘工具`，进行分区。
4. 返回，选择 `重新安装 macOS` 继续，一步一步安装。
5. 安装完重启，再次以 UEFI 的方式启动，选择 `Boot macOS from HighSierraAMD`.
6. `实用工具` -> `终端` 执行以下命令。

```bash
cd /Volumes/HighSierraAMD

preinstall

# 输入 macOS
```

7. 重启，再次以 UEFI 的方式启动，选择 `Boot macOS Install from macOS`, 将继续完成安装。
8. 重启，再次以 UEFI 的方式启动，选择 `Boot macOS from HighSierraAMD`.
9. `实用工具` -> `终端` 执行以下命令。

```bash
cd /Volumes/HighSierraAMD

amd

# 输入 macOS
```

10. 一分钟后将自动重启。
11. 重启，再次以 UEFI 的方式启动，选择 `Boot macOS Install from macOS`, 初次进入系统，完成设置。

## 安装 Clover

安装 Clover 时选择自定义安装，勾选以下选项：
- 仅安装 UEFI 开机版本
- 安装 Clover 到 EFI 系统区
- 开机主题
- UEFI Drivers (取消选择多余的 `OsxAptioFix*Drv-64`, 只能选择一个)
- 安装 RC scripts 到目标磁区
- 安装 Clover 系统偏好设置面板

```bash
# TODO
# Clone EFI 之后先还原以下空文件夹
mkdir -p kexts/10.13/DummyUSBEHCIPCI.kext/Contents/_CodeSignature
mkdir -p kexts/10.13/DummyUSBEHCIPCI.kext/Contents/MacOS
mkdir -p kexts/10.13/DummyUSBXHCIPCI.kext/Contents/_CodeSignature
mkdir -p kexts/10.13/DummyUSBXHCIPCI.kext/Contents/MacOS
```

## 升级到 10.13.6

// TODO: 更新内核什么的

## 安装驱动

// TODO: 升级 NVIDIA 驱动

## 参考

- 教程
  - https://forum.amd-osx.com/viewtopic.php?f=24&t=4127
  - https://yukino.top/8.html
  - http://bbs.pcbeta.com/viewthread-1679769-1-1.html
  - https://github.com/syscl/Enable-HiDPI-OSX
  - https://bbs.feng.com/read-htm-tid-11104214.html
- 下载
  - 镜像
    - https://drive.google.com/file/d/1PyM3Imk3diK3NXrtPoLwV78JLguTLEWj/view
    - https://drive.google.com/file/d/1_-j7YU1f8jz3937iCBoj470sASNS9_rC/view (Unofficial)
  - Kernel
    - https://download.amd-osx.com/kernels.html
    - https://github.com/Shaneee92/AMD-High-Sierra-XNU
    - https://github.com/AMD-OSX/High-Sierra-XNU
  - 驱动
    - https://download.amd-osx.com/extras.html
    - https://www.tonymacx86.com/nvidia-drivers

---

```bash
# TODO

Display Menu app



HiDPI
https://bbs.feng.com/read-htm-tid-11104214.html
http://bbs.pcbeta.com/viewthread-1679769-1-1.html
https://github.com/syscl/Enable-HiDPI-OSX
https://github.com/avibrazil/RDM



CPU未知
https://www.icharm.me/ryzenrx580%E5%AE%8C%E7%BE%8E%E5%AE%89%E8%A3%85macos-high-sierra-10-13-2.html



http://heimac.net/index.php/archives/679/



sudo find / -name ".DS_Store" -depth -exec rm {} \;
https://support.apple.com/zh-cn/HT208209
https://www.jianshu.com/p/d50a1d0e6315

显示隐藏文件
禁止生成和删除 __MACOSX

http://wiki.11ten.net/#Mac
http://wiki.11ten.net/Mac/mac-os-x-%E6%B8%85%E7%90%86%E7%A3%81%E7%9B%98%E6%8A%80%E5%B7%A7.html
http://wiki.11ten.net/Mac/%E4%BD%BF%E7%94%A8DEFAULTS%E8%AE%BE%E7%BD%AE%E7%B3%BB%E7%BB%9F.html



无线网卡
https://github.com/donalexvalluvassery/macOS-sierra/tree/master/EFI/CLOVER/kexts/Other/RtWlanU.kext
https://github.com/korzhyk/Clover_GA-H97-D3H/tree/master/misc/Realtek%20WLAN
https://github.com/dericmateus10/Arquivos_hackintosh_dell_gaming_i7_7567/blob/master/System/Library/Extensions/RtWlanU.kext/Contents/Info.plist



macOS APFS trim
https://amd-osx.com/forum/viewtopic.php?t=2923

macOS APFS
https://forum.amd-osx.com/viewtopic.php?f=24&t=3453

amd声卡
http://bbs.pcbeta.com/viewthread-1508611-1-1.html

安装黑苹果10.13.3 Nvidia显卡完美驱动后卡顿解决教程
https://osx.cx/install-10-13-3-nvidia-graphics-carlton.html

macOS 测试
https://www.it72.com/thread-12364.htm
```

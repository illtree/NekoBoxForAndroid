# NekoBoxForAndroid 路线A更新工程协作规范

## 1. 架构概览
- **宿主层**: Android (Kotlin/Java, AGP 8+, TargetSDK 35, Jetpack)
- **核心内核层 (`libcore`)**: Go 1.23+ 编译出的 `libcore.aar`，通过 Gomobile 封装 sing-box 与 libneko
- **主要协议栈**: VLESS (Reality), Hysteria 1/2, TUIC v5, Shadowsocks 2022, Trojan, WireGuard, SSH

## 2. 升级与构建工作流
1. `libcore` 内核更新 -> 编译生成 `app/libs/libcore.aar`
2. `app` 宿主层配置转换（Config Generator）与协议模型对齐
3. GitHub Actions 或本地 Gradle 构建生成 Release APK

## 3. 验证准则
- 每次修改配置生成器必须验证 JSON 输出符合目标 sing-box 版本的 Schema。
- 新增/调整协议参数必须保证旧配置向下兼容。

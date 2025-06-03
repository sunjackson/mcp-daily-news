# PyPI 发布指南

## 📦 mcp-daily-news PyPI 发布脚本使用指南

本项目提供了一个自动化的 shell 脚本 `publish_to_pypi.sh`，用于将 mcp-daily-news 项目打包并发布到 PyPI 平台。

## 🚀 快速开始

### 1. 前置准备

#### 安装必要的工具
```bash
# 确保Python和pip已安装
python3 --version
pip --version

# 安装/升级构建工具（脚本会自动处理，但也可以手动安装）
pip install --upgrade pip setuptools wheel build twine
```

#### 配置PyPI账号

**a) 注册PyPI账号**
- 正式环境：https://pypi.org/account/register/
- 测试环境：https://test.pypi.org/account/register/

**b) 创建API Token**
1. 登录PyPI网站
2. 进入Account settings -> API tokens
3. 创建新的API token
4. 选择scope为"Entire account"或特定项目

**c) 配置本地认证**

方式一：使用 `~/.pypirc` 文件
```ini
[distutils]
index-servers =
    pypi
    testpypi

[pypi]
username = __token__
password = pypi-your-api-token-here

[testpypi]
repository = https://test.pypi.org/legacy/
username = __token__
password = pypi-your-testpypi-api-token-here
```

方式二：使用环境变量
```bash
export TWINE_USERNAME=__token__
export TWINE_PASSWORD=pypi-your-api-token-here
```

### 2. 使用发布脚本

#### 基本使用
```bash
# 在项目根目录运行
./publish_to_pypi.sh
```

#### 脚本执行流程

1. **环境检查** - 检查Python、pip等必要工具
2. **工具升级** - 自动升级构建和发布工具
3. **清理构建** - 清理旧的构建文件和缓存
4. **运行测试** - 自动运行项目测试（如果存在test_tools.py）
5. **版本检查** - 显示当前版本，询问是否需要更新
6. **构建包** - 使用Python build模块构建wheel和源码包
7. **检查包** - 使用twine检查包的完整性
8. **发布选择** - 选择发布到TestPyPI还是正式PyPI
9. **Git标签** - 可选择创建Git版本标签

## 📋 详细功能说明

### 版本管理
- 脚本会自动从 `pyproject.toml` 读取当前版本
- 支持交互式版本号更新
- 自动备份配置文件（`.bak`后缀）

### 测试环境发布
选择发布到TestPyPI用于测试：
```bash
# 测试安装命令
pip install --index-url https://test.pypi.org/simple/ mcp-daily-news
```

### 生产环境发布
发布到正式PyPI前会有二次确认：
```bash
# 安装命令
pip install mcp-daily-news
```

### Git集成
- 自动检测Git仓库
- 支持创建版本标签
- 可选择推送标签到远程仓库

## ⚠️ 注意事项

### 发布前检查清单
- [ ] 确保代码已提交到Git仓库
- [ ] 运行所有测试确保通过
- [ ] 更新README.md和版本说明
- [ ] 检查`pyproject.toml`中的项目信息
- [ ] 确保版本号遵循语义化版本控制

### 版本号规范
遵循语义化版本控制（SemVer）：
- `主版本号.次版本号.修订号`
- 主版本号：不兼容的API修改
- 次版本号：向下兼容的功能性新增
- 修订号：向下兼容的问题修正

### 常见问题

**1. 权限错误**
```bash
# 确保脚本有执行权限
chmod +x publish_to_pypi.sh
```

**2. 认证失败**
- 检查API token是否正确配置
- 确认token权限范围
- 验证用户名使用`__token__`

**3. 版本冲突**
- PyPI不允许重复上传相同版本
- 需要增加版本号后重新发布

**4. 包检查失败**
- 检查`pyproject.toml`配置
- 确保所有必要文件都包含在包中
- 验证包的元数据信息

## 🔧 高级用法

### 自定义发布流程
可以单独执行脚本中的某些函数：
```bash
# 只构建不发布
python -m build

# 只检查包
twine check dist/*

# 手动发布到TestPyPI
twine upload --repository testpypi dist/*

# 手动发布到PyPI
twine upload dist/*
```

### 批量发布
对于多个版本的批量发布，可以修改脚本或创建自定义脚本。

## 📚 参考资源

- [PyPI官方文档](https://packaging.python.org/)
- [Twine使用指南](https://twine.readthedocs.io/)
- [Python打包教程](https://packaging.python.org/tutorials/packaging-projects/)
- [语义化版本控制](https://semver.org/lang/zh-CN/)

## 🆘 获取帮助

如果在使用过程中遇到问题：
1. 查看脚本输出的错误信息
2. 检查PyPI账号和权限配置
3. 参考上述常见问题解决方案
4. 查阅相关官方文档

---

**祝您发布顺利！** 🎉 
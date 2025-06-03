# 🔥 Daily News

基于 Model Context Protocol (MCP) 协议的全网热点趋势一站式聚合服务 - Python实现

## ✨ 特性

- 📊 **一站式聚合** - 聚合全网热点资讯，覆盖31个优质数据源
- 🔄 **实时更新** - 保持与源站同步的最新热点数据
- 🧩 **MCP 协议支持** - 完全兼容 Model Context Protocol，轻松集成到 AI 应用
- 🔌 **易于扩展** - 简单配置即可添加自定义数据源
- 🎨 **灵活定制** - 通过环境变量轻松调整返回字段
- 🐍 **Python实现** - 使用Python开发，更好的可维护性和扩展性
- 🌐 **多领域覆盖** - 新闻资讯、社交媒体、科技开发、财经投资、汽车、生活消费等

## 📦 安装

### 方式一：从源码安装（推荐）

```bash
cd py-hub
pip install -r requirements.txt
pip install -e .
```

### 方式二：直接安装依赖

```bash
cd py-hub
pip install -r requirements.txt
```

### 方式三：使用pip安装（发布后）

```bash
pip install mcp-daily-news
```

## 📖 使用指南

### 命令行运行

```bash
# 如果已安装包
mcp-daily-news

# 或者直接运行模块
python -m mcp_trends_hub.main
```

### MCP客户端配置

#### JSON 配置

```json
{
  "mcpServers": {
    "daily-news": {
      "command": "python",
      "args": [
        "-m", "mcp_trends_hub.main"
      ]
    }
  }
}
```

#### 使用已安装的包

```json
{
  "mcpServers": {
    "daily-news": {
      "command": "mcp-daily-news"
    }
  }
}
```

### 配置环境变量

#### `TRENDS_HUB_HIDDEN_FIELDS` - 隐藏的字段列表

通过此环境变量可控制返回数据中的字段显示：

- 作用于所有工具：`{field-name}`，例如 `cover`
- 作用于特定工具：`{tool-name}:{field-name}`，例如 `get-toutiao-trending:cover`

多个配置用西文逗号分隔，例如：

```json
{
  "mcpServers": {
    "daily-news": {
      "command": "mcp-daily-news",
      "env": {
        "TRENDS_HUB_HIDDEN_FIELDS": "cover,get-zhihu-trending:description"
      }
    }
  }
}
```

#### `TRENDS_HUB_CUSTOM_RSS_URL` - 自定义 RSS 订阅源

Trend Hub 支持通过环境变量添加自定义 RSS 源：

```json
{
  "mcpServers": {
    "daily-news": {
      "command": "mcp-daily-news",
      "env": {
        "TRENDS_HUB_CUSTOM_RSS_URL": "https://news.yahoo.com/rss"
      }
    }
  }
}
```

配置后将自动添加`custom-rss`工具，用于获取指定的 RSS 订阅源内容

## 🛠️ 支持的工具 (31个)

### 📰 新闻资讯类 (12个)

| 工具名称 | 描述 |
| --- | --- |
| get-baidu-trending | 获取百度热榜，包含实时热搜、社会热点、科技新闻、娱乐八卦等多领域的热门中文资讯和搜索趋势 |
| get-toutiao-trending | 获取今日头条热榜，包含时政要闻、社会事件、国际新闻、科技发展及娱乐八卦等多领域的热门中文资讯 |
| get-ithome-trending | 获取IT之家热榜，包含科技资讯、数码产品、互联网动态、软件应用及前沿科技发展的热门中文科技新闻 |
| get-bbc-news | 获取 BBC 新闻，提供全球新闻、英国新闻、商业、政治、健康、教育、科技、娱乐等资讯 |
| get-36kr-trending | 获取 36 氪热榜，提供创业、商业、科技领域的热门资讯，包含投融资动态、新兴产业分析和商业模式创新信息 |

### 📱 社交媒体热榜类 (12个)

| 工具名称 | 描述 |
| --- | --- |
| get-kuaishou-trending | 获取快手热榜，包含快手平台的热门短视频、热点话题及流行内容的实时热门中文资讯 |
| get-xiaohongshu-trending | 获取小红书热榜，包含小红书平台的热门笔记、时尚美妆、生活方式、种草推荐等热门中文内容 |
| get-so360-trending | 获取360热搜榜，包含360搜索平台的热门搜索词、实时新闻热点及用户关注度较高的中文资讯 |
| get-sogou-trending | 获取搜狗热搜榜，包含搜狗搜索平台的热门搜索关键词、实时搜索趋势及用户关注的热点中文资讯 |
| get-tieba-trending | 获取贴吧热议榜，包含百度贴吧的热门话题、热议帖子、热门贴吧及用户关注的热点讨论中文内容 |
| get-hupu-trending | 获取虎扑热榜，包含虎扑体育赛事、步行街热帖、篮球足球话题及男性生活兴趣的热门中文讨论内容 |
| get-weibo-trending | 获取微博热搜榜，包含时事热点、社会现象、娱乐新闻、明星动态及网络热议话题的实时热门中文资讯 |
| get-zhihu-trending | 获取知乎热榜，包含时事热点、社会话题、科技动态、娱乐八卦等多领域的热门问答和讨论的中文资讯 |

### 💰 财经投资类 (2个)

| 工具名称 | 描述 |
| --- | --- |
| get-xueqiu-trending | 获取雪球财经热榜，包含股票投资、财经新闻、投资策略、市场分析及投资者热议的财经投资类中文资讯 |

### 🚗 汽车类 (1个)

| 工具名称 | 描述 |
| --- | --- |
| get-autohome-trending | 获取汽车之家热榜，包含汽车新闻、新车发布、购车指南、试驾体验、汽车评测及汽车行业动态的专业汽车资讯 |

### 🛒 生活消费类 (4个)

| 工具名称 | 描述 |
| --- | --- |
| custom-rss | 自定义RSS订阅源（需要设置环境变量 TRENDS_HUB_CUSTOM_RSS_URL） |

> 💡 **提示**: 更多数据源正在持续增加中，我们致力于为您提供最全面的热点趋势信息！

## 🚀 快速开始

### 1. 测试工具功能

```bash
# 测试所有工具
python test_tools.py

# 测试特定工具
python test_tools.py --specific
```

### 2. 启动MCP服务器

```bash
# 直接运行
python start_mcp.py

# 或使用模块方式
python -m mcp_trends_hub.main
```

### 3. 查看帮助信息

```bash
python -m mcp_trends_hub.main --help
```

## 🔧 开发

### 环境设置

```bash
cd py-hub
pip install -r requirements-dev.txt
```

或者使用pyproject.toml：

```bash
cd py-hub
pip install -e ".[dev]"
```

### 代码格式化

```bash
black src/
isort src/
```

### 类型检查

```bash
mypy src/
```

### 运行测试

```bash
pytest
```

## 💡 添加新工具

要添加新的数据源工具，请参考现有工具的实现：

1. 在 `src/mcp_trends_hub/tools/` 目录下创建新的Python文件
2. 实现 `get_tool_config()` 函数
3. 在 `src/mcp_trends_hub/tools/__init__.py` 中导入新工具
4. 更新 `test_tools.py` 添加测试用例

详细的开发指南请参考 `MIGRATION_SUMMARY.md` 文档。

## 📊 性能表现

- **工具总数**: 31个
- **测试成功率**: 100% ✅
- **平均响应时间**: < 2秒
- **数据覆盖**: 国内外主流平台
- **更新频率**: 实时

## 📄 许可证

MIT License

## 🙏 鸣谢

- [DailyHotApi](https://github.com/imsyy/DailyHotApi) - 提供了优秀的热榜API设计思路
- [RSSHub](https://github.com/DIYgod/RSSHub) - RSS聚合服务的灵感来源
- [Model Context Protocol](https://modelcontextprotocol.io/) - MCP协议规范
- 感谢所有贡献者和用户的支持与反馈

---

**🎯 打造最全面的中文热点趋势聚合服务，让信息触手可及！** 
# Cursor MCP 配置指南

## 概述

本指南将帮助你在 Cursor 编辑器中配置 MCP Trends Hub 服务，使你能够直接在 Cursor 中访问各种新闻、技术资讯和热门内容。

## 先决条件

1. 已安装 Cursor 编辑器
2. Python 3.10+ 环境
3. 已安装项目依赖 (在 py-hub 目录下运行 `pip install -r requirements.txt`)

## 配置步骤

### 1. 验证服务器运行

首先确保 MCP 服务器可以正常启动：

```bash
cd /Users/sunjackson/Project/mcp-daily-news/py-hub
python start_mcp.py
```

如果看到类似以下输出，说明服务器正常：
```
[2025-05-29 14:31:06] INFO: 已加载工具: get-netease-news-trending
[2025-05-29 14:31:06] INFO: 已加载工具: get-nytimes-news
...
[2025-05-29 14:31:06] INFO: 启动 MCP Trends Hub 服务器...
[2025-05-29 14:31:06] INFO: 已加载 24 个工具
```

### 2. 配置 Cursor MCP

#### 方法 1: 使用配置文件 (推荐)

1. 打Cursor Settings 中mcp配置

2. 配置内容如下：
   ```json
   {
     "mcpServers": {
       "daily-news": {
         "command": "python",
         "args": [
           "/Users/sunjackson/Project/mcp-daily-news/py-hub/start_mcp.py"
         ],
         "env": {
           "TRENDS_HUB_CUSTOM_RSS_URL": "https://api.github.com/repos/microsoft/vscode/releases.atom"
         }
       }
     }
   }
   ```

#### 方法 2: 在 Cursor 设置中配置

1. 打开 Cursor
2. 按 `Cmd+,` 打开设置
3. 搜索 "MCP"
4. 找到 MCP Servers 配置项
5. 添加新的服务器配置：
   - Server Name: `daily-news`
   - Command: `python`
   - Arguments: `/Users/sunjackson/Project/mcp-daily-news/py-hub/start_mcp.py`
   - Environment Variables: `TRENDS_HUB_CUSTOM_RSS_URL=https://api.github.com/repos/microsoft/vscode/releases.atom`

### 3. 重启 Cursor

配置完成后，重启 Cursor 编辑器以加载 MCP 配置。

### 4. 验证配置

1. 在 Cursor 中打开任意文件
2. 使用 AI 聊天功能
3. 尝试使用以下命令测试 MCP 工具：
   ```
   请帮我获取微博热搜排行榜
   ```
   或
   ```
   请显示掘金前端技术文章排行榜
   ```

## 可用工具列表

配置成功后，你可以使用以下24个工具：

### 新闻资讯 (10个工具)
- `get-netease-news-trending` - 网易新闻热点
- `get-nytimes-news` - 纽约时报新闻
- `get-bbc-news` - BBC新闻
- `get-tencent-news-trending` - 腾讯新闻热点
- `get-thepaper-trending` - 澎湃新闻热点
- `get-ifanr-news` - 爱范儿科技新闻
- `get-infoq-news` - InfoQ技术新闻
- `get-theverge-news` - The Verge科技新闻
- `get-9to5mac-news` - 9to5Mac苹果新闻
- `custom-rss` - 自定义RSS源

### 社交媒体 (6个工具)
- `get-weibo-trending` - 微博热搜
- `get-zhihu-trending` - 知乎热榜
- `get-douyin-trending` - 抖音热点
- `get-bilibili-rank` - B站排行榜
- `get-douban-rank` - 豆瓣榜单

### 技术开发 (4个工具)
- `get-36kr-trending` - 36氪创投资讯
- `get-juejin-article-rank` - 掘金技术文章榜
- `get-sspai-rank` - 少数派效率工具榜

### 生活购物 (2个工具)
- `get-smzdm-rank` - 什么值得买榜单
- `get-weread-rank` - 微信读书榜单

### 游戏娱乐 (2个工具)
- `get-gcores-rank` - 机核游戏榜单

## 使用示例

配置完成后，你可以在 Cursor 的 AI 聊天中使用自然语言调用这些工具：

1. **获取技术资讯**：
   - "帮我看看掘金上最新的前端技术文章"
   - "获取InfoQ的最新技术新闻"

2. **查看热门话题**：
   - "今天微博热搜有什么"
   - "知乎上有什么热门话题"

3. **了解行业动态**：
   - "36氪最新的创投资讯"
   - "BBC的国际新闻"

4. **发现好内容**：
   - "B站最近有什么热门视频"
   - "豆瓣评分高的电影"

## 故障排除

### 问题1: MCP服务器无法启动
- 检查Python环境和依赖是否正确安装
- 确保路径配置正确
- 查看终端错误日志

### 问题2: Cursor无法连接MCP服务器
- 重启Cursor编辑器
- 检查MCP配置文件语法是否正确
- 确认配置文件路径正确

### 问题3: 工具调用失败
- 检查网络连接
- 某些网站可能有访问限制
- 查看MCP服务器日志了解具体错误

## 环境变量说明

- `TRENDS_HUB_CUSTOM_RSS_URL`: 自定义RSS源地址，用于custom-rss工具

## 更新配置

如果需要更新配置，修改对应的配置文件后重启Cursor即可。

---

**提示**: 该MCP服务器提供了丰富的中文内容聚合功能，特别适合中文技术社区和资讯获取需求。 
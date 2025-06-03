#!/usr/bin/env python3
"""MCP Trends Hub 启动脚本"""

import sys
import os
from pathlib import Path

# 添加源码路径到Python路径
src_path = Path(__file__).parent / "src"
sys.path.insert(0, str(src_path))

# 导入并运行主程序
from mcp_trends_hub.main import main_sync

if __name__ == "__main__":
    main_sync() 
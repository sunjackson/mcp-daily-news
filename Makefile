# MCP Trends Hub Makefile

.PHONY: help install install-dev clean test format lint run

help:  ## 显示帮助信息
	@echo "MCP Trends Hub - 可用命令:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install:  ## 安装基本依赖
	pip install -r requirements.txt
	pip install -e .

install-dev:  ## 安装开发依赖
	pip install -r requirements-dev.txt

clean:  ## 清理缓存和构建文件
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	rm -rf build/
	rm -rf dist/

test:  ## 运行测试
	python test_tools.py

test-pytest:  ## 运行pytest测试
	pytest

format:  ## 格式化代码
	black src/
	isort src/

lint:  ## 代码检查
	black --check src/
	isort --check-only src/
	mypy src/

run:  ## 运行MCP服务器
	mcp-trends-hub

build:  ## 构建包
	python -m build

upload:  ## 上传到PyPI（需要先配置token）
	python -m twine upload dist/*

dev-setup:  ## 完整开发环境设置
	make install-dev
	pre-commit install 
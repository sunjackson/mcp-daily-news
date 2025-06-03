# MCP Trends Hub Makefile

.PHONY: help install dev test clean build publish test-publish check format lint run

help:  ## 显示帮助信息
	@echo "可用命令:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install:  ## 安装项目依赖
	pip install -r requirements.txt
	pip install -e .

dev:  ## 安装开发依赖
	pip install -r requirements-dev.txt
	pip install -e .

test:  ## 运行测试
	python test_tools.py

clean:  ## 清理构建文件
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete 2>/dev/null || true

build:  ## 构建包
	python -m build

check:  ## 检查发布准备状态
	./check_publish_readiness.sh

publish:  ## 发布到PyPI
	./publish_to_pypi.sh

test-publish:  ## 发布到测试PyPI
	twine upload --repository testpypi dist/*

format:  ## 格式化代码
	black src/
	isort src/

lint:  ## 代码检查
	mypy src/
	flake8 src/

run:  ## 运行MCP服务器
	mcp_daily_news

test-pytest:  ## 运行pytest测试
	pytest

dev-setup:  ## 完整开发环境设置
	make dev
	pre-commit install 
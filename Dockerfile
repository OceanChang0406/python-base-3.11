# Base Docker Image for Python 3.11 Applications
# This image contains all system and Python dependencies
# Designed for faster deployment and testing

FROM python:3.11-slim

# 設置工作目錄
WORKDIR /app

# 設置環境變數
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# 安裝系統依賴
# - gcc: 編譯 Python 包所需
# - postgresql-client: PostgreSQL 命令行工具
# - libpq-dev: PostgreSQL 開發庫（psycopg2 需要）
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    postgresql-client \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# 複製 requirements.txt
COPY requirements.txt .

# 安裝 Python 依賴
RUN pip install --no-cache-dir -r requirements.txt

# 創建日誌目錄
RUN mkdir -p /app/logs

# 標籤信息
LABEL maintainer="Ocean (https://github.com/OceanChang0406)"
LABEL description="Base Python 3.11 image with common dependencies"
LABEL version="3.11"

# 健康檢查（確認 Python 環境正常）
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python -c "import sys; sys.exit(0)"

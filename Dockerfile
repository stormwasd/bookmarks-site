FROM python:3.9

# 设置工作目录
WORKDIR /app

# 复制项目文件到镜像中
COPY . /app

# 安装构建工具和 MariaDB 开发库（替代 MySQL 开发库）
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    libmariadb-dev \
    libmariadb-dev-compat && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 安装 Python 依赖
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# 暴露端口
EXPOSE 8030

# 启动命令
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8030"]

FROM python:3.9

# 设置工作目录
WORKDIR /app

# 复制项目文件到镜像中
COPY . /app

# 安装依赖（避免使用自动清理脚本）
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    libmysqlclient-dev \
    default-libmysqlclient-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 安装 Python 包
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# 暴露端口
EXPOSE 8030

# 启动命令
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8030"]

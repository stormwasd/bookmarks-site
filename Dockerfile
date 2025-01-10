FROM debian:bullseye-slim

# 安装 Python 和相关工具
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-dev build-essential libmariadb-dev libmariadb-dev-compat && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /app

# 复制项目文件到镜像中
COPY . /app

# 安装 Python 依赖
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

# 暴露端口
EXPOSE 8030

#CMD ["python3", "manage.py", "runserver", "0.0.0.0:8030"]

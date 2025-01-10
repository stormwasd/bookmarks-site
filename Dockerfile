## 使用 Debian 作为基础镜像
#FROM debian:bookworm
#
## 安装 Python 和必要工具
#RUN apt-get update && apt-get install -y \
#    python3 \
#    python3-pip \
#    python3-dev \
#    build-essential \
#    libmysqlclient-dev \
#    default-libmysqlclient-dev \
#    && apt-get clean && rm -rf /var/lib/apt/lists/*
#
## 设置 Python 默认版本
#RUN ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip

FROM python:3.10-bullseye


# 设置工作目录
WORKDIR /app

# 复制项目文件到镜像中
COPY . /app


# 禁用所有 APT 自动清理脚本并安装依赖
RUN echo 'APT::Update::Post-Invoke-Success "";' > /etc/apt/apt.conf.d/99fix && \
    echo 'APT::Update::Post-Invoke "";' >> /etc/apt/apt.conf.d/99fix && \
    apt-get update && apt-get install -y \
    build-essential \
    libmysqlclient-dev \
    default-libmysqlclient-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*




# 安装依赖
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# 暴露端口
EXPOSE 8030

# 启动命令
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

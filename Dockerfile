# 基础镜像
#FROM python:3.12-slim
FROM python@sha256:10f3aaab98db50cba827d3b33a91f39dc9ec2d02ca9b85cbc5008220d07b17f3

# 设置工作目录
WORKDIR /app

# 复制项目文件到镜像中
COPY . /app

# 安装依赖
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# 暴露端口
EXPOSE 8030

# 启动命令
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

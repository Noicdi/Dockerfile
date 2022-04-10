From ubuntu:20.04

ENV DEPLIB="libpcre3 libpcre3-dev zlib1g-dev openssl libssl-dev libavformat-dev libavcodec-dev libavutil-dev"
ENV BUILD="make gcc git"

RUN echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse" > /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse" >> /etc/apt/sources.list \
    && apt-get update \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apt-get install -y --no-install-recommends tzdata \
    && apt-get install -y --no-install-recommends ${DEPLIB} \
    && apt-get install -y --no-install-recommends ${BUILD} \
    && git config --global http.sslVerify false \
    && git clone https://gitee.com/xQmQ/PG-backend.git /nginx --depth=1 \
    && cd /nginx/nginx-1.20.2/ \
    && ./configure --prefix=/usr/local/nginx --add-module=../nginx-hls-module --add-module=../nginx-upload-module \
    && make -j$(cat /proc/cpuinfo| grep "processor"| wc -l) \
    && make install \
    && ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx \
    && mkdir /hls \
    && cd / \
    && rm -rf /nginx \
    && apt-get remove -y --purge ${BUILD} \
#&& apt-get remove -y --purge ${DEPLIB} \
    && apt-get autoremove -y --purge \
    && apt-get autoclean -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh

EXPOSE 80

CMD ["bash", "./run.sh"]

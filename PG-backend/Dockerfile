From ubuntu:20.04

ENV NGX_DEPLIB="libpcre3 libpcre3-dev openssl libssl-dev zlib1g zlib1g-dev"
ENV MOD_DEPLIB="libavformat-dev libavcodec-dev libavutil-dev"
ENV BUILD="make gcc git"

RUN echo "deb http://mirrors.bfsu.edu.cn/ubuntu/ focal main restricted universe multiverse" > /etc/apt/sources.list \
    && echo "deb http://mirrors.bfsu.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.bfsu.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.bfsu.edu.cn/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.bfsu.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse" >> /etc/apt/sources.list \
    && apt-get update \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apt-get install -y --no-install-recommends tzdata \
    #####
    && apt-get install -y --no-install-recommends ${NGX_DEPLIB} ${MOD_DEPLIB} ${BUILD} \
    && git config --global http.sslVerify false \
    && git clone https://gitee.com/Noicdi/PG-backend.git /nginx --depth=1 \
    && cd /nginx/nginx-1.20.2/ \
    && ./configure --prefix=/usr/local/nginx --with-http_ssl_module --add-module=../nginx-hls-module --add-module=../nginx-upload-module \
    && make -j \
    && make install \
    && ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx \
    && cd / \
    && mkdir /hls \
    && rm -rf /nginx \
    && apt-get remove -y --purge ${BUILD} \
    #####
    && apt-get autoremove -y --purge \
    && apt-get autoclean -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh

EXPOSE 80

CMD ["bash", "./run.sh"]

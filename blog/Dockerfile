From ubuntu

ENV INSTALL="nginx openssh-server rsync"

RUN echo "deb http://mirrors.bfsu.edu.cn/ubuntu/ focal main restricted universe multiverse" > /etc/apt/sources.list \
		&& echo "deb http://mirrors.bfsu.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list \
		&& echo "deb http://mirrors.bfsu.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list \
		&& echo "deb http://mirrors.bfsu.edu.cn/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list \
		&& apt-get update \
		&& ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
		&& echo "Asia/Shanghai" > /etc/timezone \
		&& apt-get install -y --no-install-recommends tzdata \
		&& apt-get install -y --no-install-recommends ${INSTALL} \
		&& sed -i "s/#Port 22/Port 22/" /etc/ssh/sshd_config \
		&& mkdir -p /home/www/hexo \
		&& mkdir /root/.ssh \
		&& apt-get autoremove -y --purge \
		&& apt-get autoclean -y \
		&& apt-get clean -y \
		&& rm -rf /var/lib/apt/lists/*


COPY rsyncd.conf /etc/rsyncd.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY authorized_keys /root/.ssh/authorized_keys
COPY run.sh /run.sh

EXPOSE 80 22

CMD ["bash", "./run.sh"]

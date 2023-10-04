From  alpine:latest
label author="nginx Docker"
ENV PKG_RELEASE 1
# 更新系统和安装 NGINX work ok
RUN apk update && \
    apk upgrade && \
    apk add nginx

EXPOSE 81
STOPSIGNAL SIGTERM
CMD ["nginx","-g","daemon off;"]


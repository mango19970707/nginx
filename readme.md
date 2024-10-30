### 功能

实现负载均衡，使用轮询策略。

### 参数说明

| 参数名称        | 功能描述      |
|-------------|-----------|
| LISTEN_PORT | 监听的端口     |
| NODES       | 目标服务器列表   |


### 使用示例
实现一个解密集群，解密节点分别部署在192.168.0.1，192.168.0.2，192.168.0.3，端口都是8081。nginx部署在网关上，监听80端口。用户请求网关的80端口，会发送给解密节点。
```yaml
version: '2.4'

services:
  nginx:
    image: docker.servicewall.cn/servicewall/nginx:latest
    container_name: sw_nginx
    entrypoint: ["/bin/sh", "-c", "/entrypoint.sh"]
    environment:
      - LISTEN_PORT=80
      - NODES=server 192.168.0.1:8081;server 192.168.0.2:8081;server 192.168.0.3:8081;
    network_mode: "host"
```
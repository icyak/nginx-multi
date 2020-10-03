#
# TASK: Fix Dockerfile if anything is missing.
FROM nginx AS builder

COPY index.html /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d
ENV APP="http://127.0.0.1:8080"
#RUN ["ls -la /etc/nginx/conf.d"]
#RUN ["cat /etc/nginx/conf.d/default.conf"]


FROM alpine AS tester
RUN ["nginx", "-t"]
COPY start.sh start.sh
CMD ["./start.sh"]
EXPOSE 80

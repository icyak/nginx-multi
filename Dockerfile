#
# TASK: Fix Dockerfile if anything is missing.
FROM nginx 

COPY index.html /usr/share/nginx/html
ENV APP="http://127.0.0.1:8080"
COPY default.conf /etc/nginx/conf.d
RUN ["ls -la /etc/nginx/conf.d"]
RUN ["cat /etc/nginx/conf.d/default.conf"]
RUN ["nginx", "-t"]


COPY start.sh start.sh
CMD ["./start.sh"]
EXPOSE 80

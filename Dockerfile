#
# TASK: Fix Dockerfile if anything is missing.
FROM nginx


COPY default.conf /etc/nginx/conf.d
ARG APP="http://127.0.0.1:8080"
COPY start.sh start.sh
CMD ["./start.sh"]
#RUN ["ls -la /etc/nginx/conf.d"]
RUN ["cat", "/etc/nginx/conf.d/default.conf"]

COPY index.html /usr/share/nginx/html
RUN ["nginx", "-t"]

EXPOSE 80

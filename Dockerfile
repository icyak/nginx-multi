#
# TASK: Fix Dockerfile if anything is missing.
FROM nginx 

COPY index.html /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d
ENV APP="http://127.0.0.1:8080"

COPY start.sh start.sh
RUN /bin/sed -i "s|__APP__|${APP}|" /etc/nginx/conf.d/default.conf
RUN nginx -t
#RUN sh ./start.sh
CMD ["./start.sh"]




EXPOSE 80

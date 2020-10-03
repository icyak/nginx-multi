FROM nginx 

COPY index.html /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d

ENV APP="http://127.0.0.1:8080"

COPY start.sh start.sh
CMD ["./start.sh"]
RUN ["cat /etc/nginx/conf.d/default.conf"]
RUN ["nginx", "-t"]


EXPOSE 80

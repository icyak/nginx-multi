FROM nginx AS builder
COPY default.conf /etc/nginx/conf.d
ENV APP="http://127.0.0.1:8080"
RUN /bin/sed -i "s|__APP__|${APP}|" /etc/nginx/conf.d/default.conf
RUN nginx -t


FROM nginx as runner
COPY --from=builder /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html
COPY start.sh start.sh
CMD ["./start.sh"]
EXPOSE 80

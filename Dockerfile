#
# TASK: Fix Dockerfile if anything is missing.
FROM nginx AS builder


COPY default.conf /etc/nginx/conf.d
ENV APP="http://127.0.0.1:8080"
#RUN ["ls -la /etc/nginx/conf.d"]
#RUN ["cat /etc/nginx/conf.d/default.conf"]


FROM nginx AS tester
COPY --from=builder /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html
RUN ["nginx", "-t"]
COPY start.sh start.sh
CMD ["./start.sh"]
EXPOSE 80

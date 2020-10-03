.PHONY: docker clean

docker: Dockerfile default.conf
	docker build -t icyak/nginx-test .

clean:
	docker rmi -f icyak/nginx-test |  true

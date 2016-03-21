FROM alpine:3.3
RUN apk --update add python py-pip git &&\
	rm -rf /var/cache/apk*

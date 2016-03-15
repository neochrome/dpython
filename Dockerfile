FROM alpine:3.3
RUN apk --update add bash python py-pip git &&\
	rm -rf /var/cache/apk*
ENV PYTHONPATH=/src/.pip
ENTRYPOINT ["/entrypoint.sh"]
CMD ["python"]
ADD entrypoint.sh /

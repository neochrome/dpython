FROM python:2.7
ENV PYTHONPATH=/src/.pip
ENTRYPOINT ["/entrypoint.sh"]
CMD ["python"]
ADD entrypoint.sh /

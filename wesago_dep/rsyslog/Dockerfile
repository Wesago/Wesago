FROM	alpine:3.7

COPY	rsyslog@lists.adiscon.com-5a55e598.rsa.pub /etc/apk/keys/rsyslog@lists.adiscon.com-5a55e598.rsa.pub
RUN	echo "http://alpine.rsyslog.com/3.7/stable" >> /etc/apk/repositories \
	&& apk --no-cache update  \
	&& apk add --no-cache \
	   rsyslog \
	   rsyslog-elasticsearch \
	   rsyslog-imptcp \
	   rsyslog-imrelp \
	   rsyslog-mmjsonparse \
	   rsyslog-mmutf8fix \
	   rsyslog-omrelp \
	   rsyslog-omstdout

EXPOSE 514/tcp
EXPOSE 514/udp

CMD ["rsyslogd", "-n"]

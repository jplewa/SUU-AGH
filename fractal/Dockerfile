FROM p7hb/docker-spark:2.2.0

WORKDIR /app

RUN \
	git clone https://github.com/dccspeed/fractal.git && \
	cd fractal && \
	export FRACTAL_HOME=`pwd` && \
	./gradlew assemble

ENV FRACTAL_HOME=/app/fractal

ENTRYPOINT app=motifs inputgraph=./datasets/reddit.graph steps=3 $FRACTAL_HOME/bin/fractal.sh

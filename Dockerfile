FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-venv \
        git \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*.deb

WORKDIR /opt/StaticJinjaPlus

ARG ARCHIVE_URL
ARG CHECKSUM

ADD --checksum=sha256:${CHECKSUM} ${ARCHIVE_URL} /tmp/app.tar.gz

RUN tar xzf /tmp/app.tar.gz --strip-components=1 -C /opt/StaticJinjaPlus \
    && rm /tmp/app.tar.gz

RUN python3 -m venv venv

RUN . venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt

ENV PATH="/opt/StaticJinjaPlus/venv/bin:$PATH"

ENTRYPOINT ["python", "main.py"]
CMD ["--help"]

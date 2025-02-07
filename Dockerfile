FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    xvfb \
    libpulse0 \
    libxrender1 \
    libxcb-shm0 \
    libxcb-xfixes0 \
    libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /tmp/Slicer.tar.gz https://download.slicer.org/bitstream/679325961357655fd585ffb5 && \
    tar -xvzf /tmp/Slicer.tar.gz -C /opt && \
    mv /opt/Slicer-* /opt/Slicer

RUN /opt/Slicer/Slicer --launch ExtensionManager --install SlicerSwissSkullStripper

ENV PATH="/opt/Slicer:$PATH"

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

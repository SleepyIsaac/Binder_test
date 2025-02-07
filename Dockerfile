FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    xvfb \
    libpulse0 \
    && rm -rf /var/lib/apt/lists/*

# 下载 3D Slicer
RUN wget -qO- http://download.slicer.org/bitstream/640743 | tar xvj -C /opt \
    && mv /opt/Slicer-* /opt/Slicer

RUN /opt/Slicer/Slicer --launch ExtensionManager --install SlicerSwissSkullStripper

ENV PATH="/opt/Slicer:$PATH"

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

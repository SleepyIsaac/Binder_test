FROM slicer/slicer-preview:latest

RUN /usr/src/Slicer/Slicer --launch ExtensionManager --install SlicerSwissSkullStripper

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

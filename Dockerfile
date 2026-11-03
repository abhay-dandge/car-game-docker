FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive \
    DISPLAY=:1 \
    SCREEN=640x480x24 \
    LIBGL_ALWAYS_SOFTWARE=1
RUN apt-get update && apt-get install -y --no-install-recommends \
      supertuxkart xvfb x11vnc novnc websockify openbox \
      mesa-utils libgl1-mesa-dri ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && ln -sf /usr/share/novnc/vnc.html /usr/share/novnc/index.html
COPY start.sh /start.sh
COPY config.xml /root/.config/supertuxkart/config-0.10/config.xml
RUN chmod +x /start.sh
EXPOSE 6080
CMD ["/start.sh"]

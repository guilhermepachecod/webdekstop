FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive
ENV APPS=""

RUN apt update && apt install -y \
    xfce4 \
    xfce4-goodies \
    novnc \
    websockify \
    x11vnc \
    xvfb \
    supervisor \
    dbus-x11 \
    && apt clean

COPY install-apps.sh /install-apps.sh
RUN chmod +x /install-apps.sh

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8080

CMD ["/install-apps.sh"]
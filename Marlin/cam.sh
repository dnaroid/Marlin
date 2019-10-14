#!/bin/sh
# /etc/init.d/mjpg_streamer

start()
{
    echo "Starting mjpg-streamer…"
    /usr/local/bin/mjpg_streamer -i "/usr/local/lib/input_uvc.so -d /dev/video0 -r VGA -f 15 -y" -o "/usr/local/lib/output_http.so -n -w /usr/local/www -p 8080" >/dev/null 2>&1 &
}

stop()
{
    echo "Stopping mjpg-streamer…"
    kill -9 $(pidof mjpg_streamer) >/dev/null 2>&1
}

case "$1" in
    start)
        start
    ;;
    stop)
        stop
    ;;
    restart)
        stop
        start
    ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
    ;;
esac

exit 0

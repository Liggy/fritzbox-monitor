# fritzbox-monitor
Monitor your fritz.box with mrtg using docker

Build:
````
docker build -t fritzbox-monitor .
````

Run with "docker":
```
docker run -d --name fritzbox-monitor -p 80:80 [-v /srv/mrtg:/var/www] fritzbox-monitor 
````

Or using docker-compose:
```
  fritzbox-monitor:
    image: fritzbox-monitor
    container_name: fritzbox-monitor
    volumes:
       - /srv/mrtg:/var/www
    ports:
      - 80:80
    restart: unless-stopped
```

Point your Browser to http://localhost/ to view your traffic stats. MRTG runs daemonized and updates the html data within the container every five minutes.

![Example image](images/example.png)

This project is based on https://github.com/mottobug/fritzbox-bandwidth-monitor

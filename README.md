# wifi_restarter
A script to restart wifi if the internet is unreachable

### copy the script to /usr/local/bin
```bash
sudo cp wifi_restarter.sh /usr/local/bin
```

### add the following line to the end of /ect/crontab to run the script every 5 minutes
```bash
sudo vi /ect/crontab
```
> */5 *   * * *   root    /usr/local/bin/wifi_restarter.sh

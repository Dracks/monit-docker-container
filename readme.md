# Monit docker containers
This are helpers scripts to create some monit configurations to control docker containers, since monit
doesn't support containers, I use the pid of the main process of the container to handle it, is not perfect but allows
you to get an easy an beatiful view of the containers and his status

## Usage
### 1. Create pid files
1. Create the folder /var/run/docker-compose to put the pids of the dockers containers main process.
2. [Optional but recommended] Run manually the `update-pid.sh` script and ensure the pid files are created
3. Add the update-pid.sh into the crontab to keep the files updated

Edit crontab, using `crontab -e` of the user that has access to docker, and add the following line:
```
* * * * * /root/Monitoring/update-pid.sh 2> /tmp/update-docker-pid.out
```

### 2. Generate the monit files

1. With the docker containers runing, execute the file `generate-monit.sh`, this will generate a list of monit files inside the monit folder
2. copy this files to conf-enabled (or if you wish, into conf-available, and then add the soft-links), sample:
```
cp ./monit/* /etc/monit/conf-enabled
``` 
3. Check the monit syntax is ok, with `monit -t`

4. Reload monit


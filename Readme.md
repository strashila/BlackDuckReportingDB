A few helpful queries for BlackDuck reporting DB

Ways to connect to reporting DB:  

1. **Docker exec**   
$ docker exec -it $(docker ps -qf name=postgres) psql -U blackduck -d bds_hub  
bds_hub=# set search_path=reporting;  
  
2. **Another location terminal**  
a. Change password for user blackduck_reporter: /home/user/hub-2022.x.x/docker-swarm/bin/hub_reportdb_changepassword.sh {password}   
b. $ psql -U blackduck_reporter -p 55436 -h {bd-server-url} -d bds_hub


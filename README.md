# About this Repo

This is the Git repo branch ('cserver' originally) was modified for getting cServer development Postrges instance. 

After installation of Docker (http://docker.com) clone this repo, switch to cserver branch and build the docekr image:

    ⇒  git clone https://github.com/vokhmin/postgres.git
    ...
    ⇒  cd postgres
    ⇒  git checkout cserver
    ...
    ⇒  cd 9.5
    ⇒  docker build -t ctrader/postgres .

When Docker image is ready, start it using the next command:

    ⇒  docker run --name cserver_pdb -p 5432:5432 -e POSTGRES_USER=${sa-user} -e POSTGRES_PASSWORD=${sa-password} -e REF_DEMO_USER=${ref-demo-user} -e REF_DEMO_PASSWORD=${ref-demo-password} -d ctrader/postgres
    
Next you can use PostgreSql service as usually:

    ⇒  docker ps
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
    f80e17d4808d        ctrader/postgres    "/docker-entrypoint.s"   2 minutes ago       Up 2 minutes         0.0.0.0:5432->5432/tcp   cserver_pdb
    
    ⇒  docker logs cserver_pdb
    ...
    

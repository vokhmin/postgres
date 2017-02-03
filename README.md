# About this Repo

This is the Git repo branch ('cserver' originally) was modified for getting cServer development Postrges instance. 

After installation of Docker (http://docker.com) clone this repo, switch to cserver branch and build the docekr image:

    ⇒  git clone https://github.com/vokhmin/postgres.git
    ...
    ⇒  cd postgres
    ⇒  git checkout cserver
    ...
    ⇒  cd 9.5
    ⇒  docker build -t spotware/cserver-pdb .

When Docker image is ready, start it using the next command:

    ⇒  docker run --name cserver-pdb -p 5432:5432 -e POSTGRES_USER=${sa-user} -e POSTGRES_PASSWORD=${sa-password} -e REF_DEMO_USER=${ref-demo-user} -e REF_DEMO_PASSWORD=${ref-demo-password} --add-host pdb-demo.reference.cs.spotwa.re:127.0.0.1-d spotware/cserver-pdb
    
Next you can use PostgreSql service as usually:

    ⇒  docker ps
    CONTAINER ID        IMAGE                  COMMAND                  CREATED             STATUS              PORTS                    NAMES
    1ed489b3ae7c        spotware/cserver-pdb   "/docker-entrypoint.s"   4 seconds ago       Up 4 seconds        0.0.0.0:5432->5432/tcp   cserver-pdb
    
    ⇒  docker logs cserver-pdb
    ...
    

call docker\stop.bat
docker-compose rm -f
docker-compose up -d --build --remove-orphans
docker-compose ps

## Docker environment for Symfony2/OroCRM/OroBAP/Vue.js development on Windows platform

Docker containers configuration for Symfony2/OroCRM/OroBAP development on Windows platform.

Also it can be used for separated backend and frontend applications (see Vue.js example in [Step by step manual](#step-by-step-manual))

This repo is under MIT license. Feel free to do with it whatever you want.

### Contents

Containers:
- nginx (latest nginx, configured to run app in dev mode)
- app (inside: php7.0-fpm/php5.6-fpm, nodejs 6, composer, symfony installer, bower, git, webpack, vue-cli all modules, libs and config that required by Symfony2/OroCRM/OroBAP)
- mysql (5.6, hostname: "mysqldb", root password: "qazwsxedc", database: "app", user: "app", user password: "qazwsxedc")
- rabbitmq (latest, hostname:"rabbitmq", access management UI via http://localhost:15672, user: "app", passowrd: "qazwsxedc")
- elk (ELK stack container, Kibana available at http://localhost:82)
- data (syncs application between containers)

Also there are several batch scripts ([see full list](#scripts-to-control-docker)) to simplify docker manipulations with these containers

## Installation and usage

Symfony (backend) application should be stored in "backend" folder. This is shared folder that mounts to `/var/www/backend` directory in "data" container.
This directory (and `/var/www/frontend` frontend directory) also shared with "app" and "nginx" containers.

### Step by step manual:

#### Backend app
1. Install [Docker for Windows](https://www.docker.com/products/docker#/windows) and share the local disk where your project will be located in Docker setings
2. Clone this repo
3. Place your application in `backend` folder (via `git clone` for example)
4. Run `docker\start` to build and run containers
5. Run bash in "php" container by executing `docker\bash` command
6. `cd` to `/var/www/backend` directory
7. Install all the dependencies via Composer
8. Provide database and other parameters using your favourite IDE on host machine
9. Open your browser and go to `http://localhost` to access backend app

#### Frontend Vue.js app
1. Place your application in `frontend` folder
2. Run `docker\start` to build and run containers
3. Run bash in "php" container by executing `docker\bash` command
4. `cd` to `/var/www/frontend` directory
5. Install all the dependencies (`npm install` for example)
6. If you use Vue.js webpack project modify following lines to enable hot reloading:
```js
// frontend/build/dev-server.js

var devMiddleware = require('webpack-dev-middleware')(compiler, {
    publicPath: webpackConfig.output.publicPath,
    quiet: false,
    watchOptions: {
        aggregateTimeout: 300,
        poll: 1000,
        ignored: /node_modules/
    }
})
```
See this [article](http://andrewhfarmer.com/webpack-watch-in-vagrant-docker/) for explanation
8. Run `npm run dev`
7. Open your browser and go to `http://localhost:81` to access frontend app

### Important

Following directories excluded from sync to speed up Symfony application in container and prevent permission issues:
- app/cache
- app/logs
- vendor
- bin
- node_modules

So feel free to empty these dirs on your host machine.

They are excluded via new shared volume for each of them (see docker-compose.yml), so these dirs cannot be move/removed/overwritten inside the containers.

If you need the "vendor" dir on your host machine (for development) - you can compress it to "shared" folder via `tar -zcf /shared/vendor.tar.gz -C /var/www/app/ vendor` and then extract synced "vendor.tar.gz" dir to "app/vendor" directory

### Scripts to control docker

You can use these scripts instead of standard docker commands, just for simplicity:
- docker\start - run (and build if not built yet) containers
- docker\bash - run bash in php container
- docker\stop - stop all containers
- docker\restart - restart all containers
- docker\update - update and run containers
- docker\build - build/rebuild and run containers (even already running)

## Tips and useful PhpStorm plugins

Here are some tips from me to bring more fun to development process

### PhpStorm plugins

- [Symfony Plugin](https://plugins.jetbrains.com/plugin/7219)
- [Oro PHPStorm Plugin](https://plugins.jetbrains.com/plugin/8449)
- [String Manipulation](https://plugins.jetbrains.com/plugin/2162)
- [PHP Annotations](https://plugins.jetbrains.com/plugin/7320)
- [PHP Toolbox](https://plugins.jetbrains.com/idea/plugin/8133)

### ConEmu shortcut

`"C:\Program Files\ConEmu\ConEmu64.exe" -Max -Monitor 2 -runlist {Shells::cmd} & docker stats ||| {Shells::cmd} -new_console:d:"c:\projects\app":s75V`

This shortcut will run ConEmu on second monitor with two vertically splitted consoles.
Upper console will display docker stats for running containers, lower one will run cmd in specified folder as usual.
Just provide the correct path to ConEmu and workdir

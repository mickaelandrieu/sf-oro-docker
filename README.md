##Docker environment for Symfony2/OroCRM/OroBAP development on Windows platform 

Docker containers configuration for Symfony2/OroCRM/OroBAP development on Windows platform

This repo is under MIT license. Feel free to do with it whatever you want.

###Contents

Containers:
- nginx (latest nginx, configured to run app in dev mode)
- php (inside: php5.6-fpm, composer, git, all modules, libs and config that required by Symfony2/OroCRM/OroBAP)
- mysql (5.6, hostname: "db", root password: "rootpassword", database: "app", user: "app", user password: "apppassword")
- data (syncs "app" directory between containers)

Also there are several batch scripts ([see full list](#scripts-to-control-docker)) to simplify docker manipulations with these containers

##Installation and usage

Application should be stored in "app" folder. This is shared folder that mounts to "/var/www/app" directory in "data" container.
This directory also shared with "php" and "nginx" containers.

###Step by step manual:
1. Install [Docker for Windows](https://www.docker.com/products/docker#/windows) and share the local disk where your project will be located in Docker setings
2. Clone this repo
3. Place your application in "app" folder (via `git clone` for example)
4. Tweak your Symfony app using [directions below](#speed-up-symfony-app-working-in-container)
5. Run `docker\start` to build and run containers
6. Run bash in "php" container by executing `docker\bash` command
7. `cd` to "/var/www/app" directory
8. Install all the dependencies via Composer
9. Provide database and other parameters using your favourite IDE on host machine
10. Open your browser and go to http://localhost

###Important
Following directories excluded from sync to speed up Symfony application in container and prevent permission issues:
- app/cache
- app/logs
- vendor
- bin

So feel free to empty these dirs on your host machine

###Scripts to control docker
You can use these scripts instead of standard docker commands, just for simplicity:
- docker\start - run (and build if not built yet) containers
- docker\bash - run bash in php container
- docker\stop - stop all containers
- docker\restart - restart all containers
- docker\update - update and run containers
- docker\build - build/rebuild and run containers (even already running)

###Speed up Symfony app working in container

To speed up your app you'll need to change cache and logs dirs locations. Add following methods to app/AppKernel.php:
```php
public function getCacheDir()
{
    return '/var/app/cache/'.$this->getEnvironment();
}

public function getLogDir()
{
    return '/var/app/logs';
}
```

##Tips and useful PhpStorm plugins

Here are some tips from me to bring more fun to development process

### PhpStorm plugins

- [Symfony Plugin](https://plugins.jetbrains.com/plugin/7219)
- [Oro PHPStorm Plugin](https://plugins.jetbrains.com/plugin/8449?pr=idea)
- [String Manipulation](https://plugins.jetbrains.com/plugin/2162?pr=idea)

### ConEmu shortcut
`"C:\Program Files\ConEmu\ConEmu64.exe" -Max -Monitor 2 -runlist {Shells::cmd} & docker stats ||| {Shells::cmd} -new_console:s75V`

This shortcut will run ConEmu on second monitor with two vertically splitted consoles.
Upper console will display docker stats for running container, lower one will run cmd as usual.
Just provide the correct path to ConEmu

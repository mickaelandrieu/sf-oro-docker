##Docker environment for Symfony2/OroCRM/OroBAP Windows development

Scripts to control docker:
- docker\start - run (and build if not built yet) containers
- docker\bash - run bash in php container
- docker\stop - stop all containers
- docker\restart - restart all containers
- docker\update - update and run containers
- docker\build - build/rebuild and run containers (even running)

##Speed up Symfony app working in container

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

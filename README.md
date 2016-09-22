##Docker environment for OroCRM/OroBAP Windows development

Scripts to control docker:
- tools\start - run (and build if not built yet) containers
- tools\bash - run bash in php container
- tools\stop - stop all containers
- tools\restart - restart all containers
- tools\update - update and run containers
- tools\build - build/rebuild and run containers (even running)

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

##Docker environment for OroCRM/OroBAP Windows development

To run (and build if not built yet) containers execute following command:
```bash
tools\start
```

To run bash in php container:
```bash
tools\bash
```

To stop all containers:
```bash
tools\stop
```

To restart all containers:
```bash
tools\restart
```

To update an run containers:
```bash
tools\update
```

To rebuild an run containers:
```bash
tools\build
```
##Speed up Symfony app working in container

To speed up your app you'll need to change cache and logs dirs locations:

app/AppKernel.php:
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

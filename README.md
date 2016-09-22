##Docker environment for OroCRM/OroBAP Windows development

To run containers execute following command:
```bash
tools\start
```

To SSH to php container:
```bash
tools\ssh
```

To stop all containers:
```bash
tools\stop
```

To restart all containers:
```bash
tools\restart
```

To rebuild an run containers:
```bash
tools\build
```
##Speed up Symfony app working in container

To speed up your app you'll need to change cache, logs and vendor dirs locations:

app/autoload.php:
```php
$loader = require '/var/app/vendor/autoload.php'; 
```

composer.json:
```yaml
"config": {
        "vendor-dir": "/var/app/vendor"
    },
```

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

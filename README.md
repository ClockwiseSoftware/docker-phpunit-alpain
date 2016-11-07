![](https://images.microbadger.com/badges/image/clockwise/docker-phpunit-alpain.svg)

Container for using with Bitbucket Pipeline for testing Laravel project with PHPUnit

Using 

`php:alpine`
( php7 )

Include composer
and extending PHP with modules:

`iconv mcrypt pdo_mysql pcntl pdo_sqlite zip curl bcmath mbstring gd`

Example of `bitbucket-pipelines.yml`:
```yml
image: clockwise/docker-phpunit-alpain:master

pipelines:
  default:
    - step:
        script: # Modify the commands below to build your repository.
          - composer --version
          # install composer vendor scripts
          - composer install
          - vendor/bin/phpunit --version
          - touch database/database.sqlite
          # migrate
          - php artisan migrate --seed
          # run tests
          - vendor/bin/phpunit
```

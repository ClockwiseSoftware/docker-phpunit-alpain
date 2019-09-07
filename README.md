[![](https://images.microbadger.com/badges/image/clockwise/docker-phpunit-alpain.svg)](https://microbadger.com/images/clockwise/docker-phpunit-alpain "Get your own image badge on microbadger.com")

# Available tags

Debian:
[5.6-fpm](https://github.com/ClockwiseSoftware/docker-phpunit-alpain/tree/5.6-fpm),
[7.0-fpm-deb](https://github.com/ClockwiseSoftware/docker-phpunit-alpain/tree/7.0-fpm-deb),
[7.1-fpm-deb](https://github.com/ClockwiseSoftware/docker-phpunit-alpain/tree/7.1-fpm-deb)
[7.2-fpm-deb](https://github.com/ClockwiseSoftware/docker-phpunit-alpain/tree/7.2-fpm-deb)

Alpine Linux:
[7.0-fpm-alpine](https://github.com/ClockwiseSoftware/docker-phpunit-alpain/tree/7.0-fpm-alpine),
[7.1-fpm-alpine](https://github.com/ClockwiseSoftware/docker-phpunit-alpain/tree/7.1-fpm-alpine)
[7.2-fpm-alpine](https://github.com/ClockwiseSoftware/docker-phpunit-alpain/tree/7.2-fpm-alpine)

# Desсription

PHP container with extensions 
- iconv 
- mcrypt 
- gd
- pdo_mysql
- pcntl 
- pdo_sqlite 
- zip 
- curl 
- bcmath 
- mbstring 
- imagick 
- soap 
- mysqli
- mongodb

Can use master branch in 
Bitbucket Pipeline for testing Laravel project with PHPUnit

Using oficcial php containers

Include composer, git, unzip and imagemagick

# Example 
Container for using php-fpm with nginx

```yml
FROM clockwise/docker-phpunit-alpain:fpm

WORKDIR /var/www
```

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

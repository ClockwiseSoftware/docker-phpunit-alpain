[![](https://images.microbadger.com/badges/image/clockwise/docker-phpunit-alpain.svg)](https://microbadger.com/images/clockwise/docker-phpunit-alpain "Get your own image badge on microbadger.com")

PHP7 container with extensions 
`iconv mcrypt gd pdo_mysql pcntl pdo_sqlite zip curl bcmath mbstring imagick soap mysqli mongodb`


Can use master brunch in 
Bitbucket Pipeline for testing Laravel project with PHPUnit
Using oficcial php-alpine containers

Available tags:
```
master
fpm
5.6-fpm
```

Include composer, git, unzip and imagemagick

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
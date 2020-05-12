# moodle-docker-production: Docker Containers for Moodle

This repository contains Docker configuration aimed to provide a good starting point to install moodle in production using docker.

In Catedu we need to deploy several hundreds of Moodle. This repo aims to give us a solution to test locally our developments and to generate our docker images. Our final solution is being implemented in [moodle-docker-deploy repo](https://github.com/catedu/moodle-docker-deploy).


## Features
* Database servers: MySQL 
* Last supported PHP version
* Zero-configuration approach
* All php-extensions (thanks to [moodlehq](https://github.com/moodlehq/moodle-php-apache))


## Missing Features

These features are out of the scope of this repo (you may have a look at [moodle-docker-deploy repo](https://github.com/catedu/moodle-docker-deploy)):

* Crontab configuration
* Auto backup 


## Prerequisites
* [Docker](https://docs.docker.com) and [Docker Compose](https://docs.docker.com/compose/) installed

## Quick start


```
cp env-sample .env
docker-compose up -d
```

Open browser webpage: http://localhost (be patient)


## Configuration

* Configure your moodle installation using an .env file


## Activate https

- Using [letsEncrypt](https://letsencrypt.org/)

  ```
  cp docker-compose.override_prod.yml docker-compose.override.yml
  docker-compose up -d
  ```
- Modify .env file

```
MOODLE_URL=https://localhost
SSL_PROXY=true
```

## Contributions

Are extremely welcome!

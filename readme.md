# Native Headless Firefox&Chrome Robotframework with Docker

## Results for single test

|                         | Round 1      | Round 2      | Round 3      | Round 4      | Average      |
|-------------------------|--------------|--------------|--------------|--------------|--------------|
| Chrome                  | 0:00:12.529  | 00:00:11.523 | 00:00:11.996 | 00:00:10.203 | 00:00:11.562 |
| Headless Chrome         | 00:00:09.805 | 00:00:08.691 | 00:00:09.628 | 00:00:09.765 | 00:00:09.472 |
| Firefox                 | 00:00:16.558 | 00:00:15.812 | 00:00:13.343 | 00:00:14.041 | 00:00:14.938 |
| Headless Firefox        | 00:00:12.026 | 00:00:13.835 | 00:00:14.509 | 00:00:12.839 | 00:00:13.302 |
| Docker Headless Chrome  | 00:00:09.761 | 00:00:09.175 | 00:00:11.417 | 00:00:11.037 | 00:00:10.347 |
| Docker Headless Firefox | 00:00:10.691 | 00:00:11.691 | 00:00:11.703 | 00:00:11.743 | 00:00:11.457 |

## From fastest to slowest

This suite contains only one test, so it is not very accurate.

Docker uses FF 56, in my local environment its 57. That can be one answer to why local headless FF is so slow.

| Browser                 | Time         |
|-------------------------|--------------|
| Headless Chrome         | 00:00:09.472 |
| Docker Headless Chrome  | 00:00:10.347 |
| Docker Headless Firefox | 00:00:11.457 |
| Chrome                  | 00:00:11.562 |
| Headless Firefox        | 00:00:13.302 |
| Firefox                 | 00:00:14.938 |

## steps:

1. docker build -t your_image_name .
2. docker run --name container_name -td --cap-add=SYS_ADMIN image_name

## Run tests:

### With scripts:

1. docker exec -it container_name bash -c './run_all_tests.sh HeadlessChrome'
2. docker exec -it container_name bash -c './run_all_tests.sh HeadlessFirefox'

### With native robot command:

1. docker exec -t container_name robot -v BROWSER:HeadlessChrome -d ./results .
2. docker exec -t container_name robot -v BROWSER:HeadlessFirefox -d ./results .

## Get results

Copy test results from container

1. docker cp container_name:./app/results ~/your_local_location

# Local / native setup

## Setup firefox:

1. Download latest firefox version 57 or at least 56 which is in this docker image
2. Download latest geckodriver https://github.com/mozilla/geckodriver/releases and place it /usr/local/bin/geckodriver
3. Install latest selenium driver

To see what version of selenium you have: python -c "import selenium; print(selenium.__version__)"
At least in OSX update happens with: sudo easy_install -U selenium

Try that you have all in your path:
1. firefox
2. geckodriver --version
3. python -c "import selenium; print(selenium.__version__)"

## Setup Chrome:

1. Download latest chrome
2. Download chromedriver (current working version should be 2.34) https://chromedriver.storage.googleapis.com/index.html
3. Place chromedriver in /usr/local/bin/chromedriver

Try that its working by running:

1. chromedriver --version

## Run tests

./run_all_tests.sh will run all tests, it accepts parameters:

1. Firefox
2. HeadlessChrome
3. HeadlessFirefox
4. Default is Chrome if no parameter is passed.

You can use the pybot commands directly from executerobot.sh as well instead of shell scripts.

# Good to know commands:

docker images // Show all images

docker container ls // List containers

docker ps -a // Show all containers

docker rmi -f // Force delete image: name or ID

docker rm container_id // Delete container with ID or name

docker stop $(docker ps -a -q) // Stop all containers

docker rm $(docker ps -a -q) // Delete all containers

docker exec -it container_name /bin/bash // SSH to container

docker stop container_name // Stop container with name or ID

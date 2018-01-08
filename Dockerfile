FROM ubuntu:latest

RUN apt-get update && apt-get install --quiet --assume-yes python-pip unzip firefox wget
RUN pip install -U pip

RUN wget --no-verbose https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg --install google-chrome-stable_current_amd64.deb; apt-get --fix-broken --assume-yes install

RUN pip install --no-cache-dir --pre \
  robotframework \
  robotframework-seleniumlibrary \
  selenium

RUN CHROMEDRIVER_VERSION=`wget --no-verbose --output-document - https://chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget --no-verbose --output-document /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
    unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver && \
    chmod +x /opt/chromedriver/chromedriver && \
    ln -fs /opt/chromedriver/chromedriver /usr/local/bin/chromedriver

RUN GECKODRIVER_VERSION=`wget --no-verbose --output-document - https://api.github.com/repos/mozilla/geckodriver/releases/latest | grep tag_name | cut -d '"' -f 4` && \
    wget --no-verbose --output-document /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/$GECKODRIVER_VERSION/geckodriver-$GECKODRIVER_VERSION-linux64.tar.gz && \
    tar --directory /opt -zxf /tmp/geckodriver.tar.gz && \
    chmod +x /opt/geckodriver && \
    ln -fs /opt/geckodriver /usr/local/bin/geckodriver

WORKDIR /app

COPY . /app

RUN chmod +x ./tests/run_all_tests.sh
RUN chmod +x ./tests/run_single_test.sh
RUN chmod +x ./tests/executerobot.sh

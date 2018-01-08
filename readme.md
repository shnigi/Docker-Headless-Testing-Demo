# Setup firefox:

1. Download latest firefox version 57
2. Download latest geckodriver https://github.com/mozilla/geckodriver/releases and place it /usr/local/bin/geckodriver
3. Install latest selenium driver

To see what version of selenium you have: python -c "import selenium; print(selenium.__version__)"
At least in OSX update happens with: sudo easy_install -U selenium

Try that you have all in your path:
1. firefox
2. geckodriver --version
3. python -c "import selenium; print(selenium.__version__)"

# Setup Chrome:

1. Download latest chrome
2. Download chromedriver (current working version should be 2.34) https://chromedriver.storage.googleapis.com/index.html
3. Place chromedriver in /usr/local/bin/chromedriver

Try that its working by running:

1. chromedriver --version

# Run tests

./run_all_tests.sh will run all tests, it accepts parameters:

1. Firefox
2. HeadlessChrome
3. HeadlessFirefox
4. Default is Chrome if no parameter is passed.

You can use the pybot commands directly from executerobot.sh as well instead of shell scripts.

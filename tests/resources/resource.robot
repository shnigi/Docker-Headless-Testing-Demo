*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
Library           SeleniumLibrary

*** Variables ***
${SERVER}         www.amazon.com
${BROWSER}        Chrome
${DELAY}          0s
${PAGE URL}       https://${SERVER}/

*** Keywords ***
Open Browser To main page
    Run Keyword If      '${BROWSER}' == 'HeadlessChrome'      Open Headless Chrome Browser to Page
    ...     ELSE IF     '${BROWSER}' == 'HeadlessFirefox'     Firefox true headless
    ...     ELSE     Open Browser to Page
    Set Selenium Speed    ${DELAY}

Open Headless Chrome Browser to Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${PAGE URL}
    Page Should Be Open

Firefox true headless
    ${firefox options}=     Evaluate    sys.modules['selenium.webdriver'].firefox.webdriver.Options()    sys, selenium.webdriver
    Call Method    ${firefox options}   add_argument    -headless
    Create Webdriver    Firefox    firefox_options=${firefox options}
    Set Window Size    1920    1080
    Go To    ${PAGE URL}
    Page Should Be Open

Open Browser to Page
  Open Browser    ${PAGE URL}    ${BROWSER}
  Maximize Browser Window
  Page Should Be Open

Page Should Be Open
    Location Should Contain    ${PAGE URL}

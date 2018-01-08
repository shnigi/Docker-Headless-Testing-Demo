*** Settings ***
Resource  ../resources/resource.robot
Suite Setup  Open page
Suite Teardown  Close All Browsers

*** Variables ***


*** Test Cases ***
User is able to navigate to amazon.com
  [Tags]  Smoke
  user can navigate to amazon.com

*** Keywords ***
user can navigate to amazon.com
  Page Should Be Open

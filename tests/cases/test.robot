*** Settings ***
Resource  ../resources/resource.robot
Suite Setup  Open Browser To main page
Suite Teardown  Close All Browsers

*** Variables ***


*** Test Cases ***
User is able to navigate to amazon.com
  [Tags]  Smoke
  user can navigate to amazon.com

User must be able to search laptop
  [Tags]  Smoke
  Given Page Should Be Open
  Then user types in laptop to searchbar
  And press search
  When laptops appear and user can see them

*** Keywords ***
user can navigate to amazon.com
  Page Should Be Open

user types in laptop to searchbar
  Input Text    twotabsearchtextbox    laptop

press search
  Submit Form

laptops appear and user can see them
  Wait Until Page Contains    Showing results in Electronics.

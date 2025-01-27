*** Settings ***

Resource        resource.robot

*** Test Cases ***

Open Form
    Open Browser To Form Page

Complete Form
    Open Browser To Form Page
    Input FirstName         ${VALID FIRSTNAME}
    Input LastName          ${VALID LASTNAME}
    Input Destination       ${VALID DESTINATION}
    Input ContactPerson     ${VALID CONTACTPERSON}
    Input Relationship      ${VALID RELATIONSHIP}
    Input Email             ${VALID EMAIL}
    Input PhoneNo           ${VALID PHONE}
    Submit Form
    Complete Page Should Be Open
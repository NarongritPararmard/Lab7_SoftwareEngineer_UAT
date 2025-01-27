*** Settings ***

Resource        resource.robot

*** Test Cases ***

Open Form
    Open Browser To Form Page

Empty Destination
    Open Browser To Form Page
    Input FirstName         ${VALID FIRSTNAME}
    Input LastName          ${VALID LASTNAME}
    Input ContactPerson     ${VALID CONTACTPERSON}
    Input Relationship      ${VALID RELATIONSHIP}
    Input Email             ${VALID EMAIL}
    Input PhoneNo           ${VALID PHONE}
    Submit Form
    Page Should Contain     Please enter your destination.

Open Form
    Open Browser To Form Page

Empty Email
    Open Browser To Form Page
    Input FirstName         ${VALID FIRSTNAME}
    Input LastName          ${VALID LASTNAME}
    Input Destination       ${VALID DESTINATION}
    Input ContactPerson     ${VALID CONTACTPERSON}
    Input Relationship      ${VALID RELATIONSHIP}
    Input PhoneNo           ${VALID PHONE}
    Submit Form
    Page Should Contain     Please enter a valid email address.

Open Form
    Open Browser To Form Page

Invalid Email
    Open Browser To Form Page
    Input FirstName         ${VALID FIRSTNAME}
    Input LastName          ${VALID LASTNAME}
    Input Destination       ${VALID DESTINATION}
    Input ContactPerson     ${VALID CONTACTPERSON}
    Input Relationship      ${VALID RELATIONSHIP}
    Input Email             somsong@
    Input PhoneNo           ${VALID PHONE}
    Submit Form
    Page Should Contain     Please enter a valid email address.

Open Form
    Open Browser To Form Page

Emply PhoneNo
    Open Browser To Form Page
    Input FirstName         ${VALID FIRSTNAME}
    Input LastName          ${VALID LASTNAME}
    Input Destination       ${VALID DESTINATION}
    Input ContactPerson     ${VALID CONTACTPERSON}
    Input Relationship      ${VALID RELATIONSHIP}
    Input Email             ${VALID EMAIL}
    Submit Form
    Page Should Contain     Please enter a phone number.

Open Form
    Open Browser To Form Page
    
Invalid PhoneNo
    Open Browser To Form Page
    Input FirstName         ${VALID FIRSTNAME}
    Input LastName          ${VALID LASTNAME}
    Input Destination       ${VALID DESTINATION}
    Input ContactPerson     ${VALID CONTACTPERSON}
    Input Relationship      ${VALID RELATIONSHIP}
    Input Email             ${VALID EMAIL}
    Input PhoneNo           191
    Submit Form
    Page Should Contain     Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678
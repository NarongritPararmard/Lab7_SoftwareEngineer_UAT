*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${CHROME_BROWSER_PATH}    /Users/fan/Desktop/ChromeForTesting/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing
${CHROME_DRIVER_PATH}     /Users/fan/Desktop/ChromeForTesting/chromedriver-mac-arm64/chromedriver
${BROWSER}        Chrome
${DELAY}          0
${VALID FIRSTNAME}    Somsong
${VALID LASTNAME}     Sandee
${VALID DESTINATION}    Europe
${VALID CONTACTPERSON}     Sodsai Sandee
${VALID RELATIONSHIP}    Mother
${VALID EMAIL}     somsong@kkumail.com
${VALID PHONE}     081-111-1234
${FORM URL}       http://${SERVER}/form.html
${COMPLETE URL}   http://${SERVER}/complete.html
${ERROR URL}      http://${SERVER}/error.html

*** Keywords ***
Open Browser To Form Page

    # สร้าง options สำหรับ Chrome
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()

    # ตั้งค่า binary_location ให้กับ chrome_options
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}

    # สร้าง service สำหรับ chromedriver
    ${service}    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path="${CHROME_DRIVER_PATH}")

    # สร้าง WebDriver โดยใช้ options และ service
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}

    # ไปที่ URL ที่ต้องการ
    Go To    ${FORM URL}

    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Input FirstName
    [Arguments]    ${firstname}
    Input Text    firstname    ${firstname}

Input LastName
    [Arguments]    ${lastname}
    Input Text    lastname    ${lastname}

Input Destination
    [Arguments]    ${destination}
    Input Text    destination    ${destination}

Input ContactPerson
    [Arguments]    ${contactperson}
    Input Text    contactperson    ${contactperson}

Input Relationship
    [Arguments]    ${relationship}
    Input Text    relationship    ${relationship}

Input Email
    [Arguments]    ${email}
    Input Text    email    ${email}

Input PhoneNo
    [Arguments]    ${phone}
    Input Text    phone    ${phone}

Submit Form
    Click Button    submitButton

Complete Page Should Be Open
    Title Should Be         Completed
    Page Should Contain     Our agent will contact you shortly.
    Page Should Contain     Thank you for your patient.

*** Settings ***
Library    DatabaseLibrary
Library    SeleniumLibrary

Suite Setup     Connect to Database     pymssql     ${DBName}   ${Username}   ${Password}   ${Hostname}     ${Port}
Suite Teardown      Disconnect from Database

*** Variables ***
${DBName}   Store
${Username}     aahmad
${Password}     test
${Hostname}     DESKTOP-DC9H67P
${Port}     1433

${Name}     Test Patient
${Email}    Test_Patient@testemail.com
${Phone}    9900112233
${Address}  Test Street, Test Town, Test State -111

${url}      http://localhost:5072/
${browser}     chrome

*** Test Cases ***
Add client to database
    ${output}=  Execute Sql String      EXEC [dbo].[Add_patient] @name = N'${Name}', @email = N'${Email}', @phone = N'${Phone}',@address = N'${Address}'
    should be equal as strings    ${output}     None

Open browser and maximize browser window
    open browser    ${url}      ${browser}
    maximize browser window

Navigate to Clients
    click element   xpath://a[normalize-space()='Clients']

Verify Added Data
    element should be visible   xpath://td[contains(text(),'${Name}')]
    element should be visible   xpath://td[contains(text(),'${Email}')]
    element should be visible   xpath://td[contains(text(),'${Phone}')]
    element should be visible   xpath://td[contains(text(),'${Address}')]

Close Browser
    sleep    3s
    close browser
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

${Name}     Test Patient Updated
${Email}    Test_Patient_Updated@testemail.com
${Phone}    9900112200
${Address}  Test Street, Test Town, Test State(Updated) -111

${url}      http://localhost:5072/
${browser}     chrome

${id}

*** Test Cases ***
Open browser and maximize browser window
    open browser    ${url}      ${browser}
    maximize browser window

Navigate to Clients
    click element   xpath://a[normalize-space()='Clients']

Identify Client ID
    ${temp_id}=  get text    xpath://td[contains(text(),'${Name}')]/../td[1]
    set suite variable    ${id}     ${temp_id}

Close Browser
    close browser

Update client in database
    ${output}=  Execute Sql String      EXEC [dbo].[Delete_patient] @id=${id}
    should be equal as strings    ${output}     None

Open browser and maximize browser window
    open browser    ${url}      ${browser}
    maximize browser window

Navigate to Clients
    click element   xpath://a[normalize-space()='Clients']

Verify Added Data
    element should not be visible   xpath://td[contains(text(),'${Name}')]
    element should not be visible   xpath://td[contains(text(),'${Email}')]
    element should not be visible   xpath://td[contains(text(),'${Phone}')]
    element should not be visible   xpath://td[contains(text(),'${Address}')]

Close Browser
    close browser
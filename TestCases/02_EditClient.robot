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

${Updated_Name}     Test Patient Updated
${Updated_Email}    Test_Patient_Updated@testemail.com
${Updated_Phone}    9900112200
${Updated_Address}  Test Street, Test Town, Test State(Updated) -111

${url}      http://localhost:5072/
${browser}     chrome

${id}

*** Test Cases ***
Open Browser and Navigate to Clients
    Open browser and maximize browser window
    click element   xpath://a[normalize-space()='Clients']

Identify Client ID
    ${temp_id}=  get text    xpath://td[contains(text(),'${Name}')]/../td[1]
    set suite variable    ${id}     ${temp_id}

Close Browser
    close browser

Update client in database
    ${output}=  Execute Sql String      EXEC [dbo].[Edit_patient] @id=${id}, @name = N'${Updated_Name}', @email = N'${Updated_Email}', @phone = N'${Updated_Phone}',@address = N'${Updated_Address}'
    should be equal as strings    ${output}     None

Open Browser Again and Navigate to Clients
    Open browser and maximize browser window
    click element   xpath://a[normalize-space()='Clients']

Verify Edited Data
    element should be visible   xpath://td[contains(text(),'${Updated_Name}')]
    element should be visible   xpath://td[contains(text(),'${Updated_Email}')]
    element should be visible   xpath://td[contains(text(),'${Updated_Phone}')]
    element should be visible   xpath://td[contains(text(),'${Updated_Address}')]

Close Browser
    sleep    3s
    close browser

*** Keywords ***
Open browser and maximize browser window
    open browser    ${url}      ${browser}
    maximize browser window
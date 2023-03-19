*** Settings ***
Library    DatabaseLibrary
Library    SeleniumLibrary
Library    String
Library    ExcelLibrary

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

${storage_file_path}   ${CURDIR}${/}..\\ExcelFiles\\DBdata.xlsx

*** Test Cases ***
Read Client Database and Store to Excel
    @{output}=  query      EXEC [dbo].[Select_client]
    open excel document     ${storage_file_path}    1
    ${row}=     set variable    2
    FOR    ${temp_output}   IN      @{output}
        FOR    ${i}     IN RANGE    5
            ${temp}    Evaluate    ${i} + 1
            Write Excel Cell    ${row}  ${temp}    ${temp_output}[${i}]
        END
        ${temp}    Evaluate    ${row} + 1
        ${row}=     Set Variable    ${temp}
    END
    Save Excel Document     ${storage_file_path}


Open browser and maximize browser window
    open browser    ${url}      ${browser}
    maximize browser window

Navigate to Clients
    click element   xpath://a[normalize-space()='Clients']

Validate Data from UI
    ${row}=     set variable    2
    ${next_temp_variable}=  set variable    "test"
    sleep    3s
    WHILE   ${next_temp_variable} != ${None}
        FOR    ${i}     IN RANGE    5
            ${temp}    Evaluate    ${i} + 1
            ${temp_variable}    Read Excel Cell     ${row}      ${temp}
            element should be visible   xpath://td[normalize-space(text())='${temp_variable}']
        END
    ${temp}    Evaluate    ${row} + 1
    ${row}=     Set Variable    ${temp}
    ${next_temp_variable}   Read Excel Cell     ${row}      1
    END

Close Browser and Excel File
    close browser
    Close Current Excel Document






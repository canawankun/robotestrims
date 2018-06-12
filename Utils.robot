*** Settings ***
Library           DatabaseLibrary
Library           SeleniumLibrary

*** Variables ***
&{users}          user_test_rims=test_rims    pass_test_rims=Tuananh@123
${DB_CONNECTION}    'RIMS_TRAINING/132@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=10.1.4.173)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=RIMS)))'
${URL_TEST}       https://oss.vnpt.vn/test

*** Keywords ***
Connect DB
    Connect To Database Using Custom Params    cx_Oracle    ${DB_CONNECTION}

Login VNPT ID to RIMS (test_rims)
    Open Browser    https:\\oss.vnpt.vn    chrome
    Input Text    id=username    &{users}[user_test_rims]
    Input Password    id=password    &{users}[pass_test_rims]
    Click Button    xpath=//*[@id="fm1"]/section/button
    Go To    ${URL_TEST}

Wait ajax complete
    : FOR    ${INDEX}    IN RANGE    1    5000
    \    ${IsAjaxComplete}    Execute JavaScript    return window.jQuery!=undefined && jQuery.active==0
    \    Log    ${INDEX}
    \    Log    ${IsAjaxComplete}
    \    Sleep    200ms
    \    Run Keyword If    ${IsAjaxComplete}==True    Exit For Loop

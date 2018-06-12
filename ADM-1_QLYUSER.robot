*** Settings ***
Library           SeleniumLibrary
Resource          Utils.robot

*** Keywords ***
QLYUSER_Clear test data user
    Connect DB
    Execute Sql String    begin PKG_TEST_CASE.reset_user('robot_test'); end;
    Disconnect From Database

QLYUSER_Delete user
    QLYUSER_Truy cap menu quan ly nguoi dung
    QLYUSER_Search user robot_test_updated
    Click Element    xpath=//*[@id="example2"]/tbody/tr[1]/td[9]/a[3]
    Handle Alert

QLYUSER_Edit user
    QLYUSER_Truy cap menu quan ly nguoi dung
    QLYUSER_Search user robot_test
    Click Element    xpath=//*[@id="example2"]/tbody/tr[1]/td[9]/a[2]    #click nut edit
    Input Text    xpath=//*[@id="fullname"]    robot_test_updated
    Click Button    xpath=//*[@id="user"]/div[2]/button
    ${result}=    Get Text    xpath=//*[@id="alert_id_common"]/div
    Should Contain    ${result}    thành công
    QLYUSER_Search user robot_test_updated

QLYUSER_Search user robot_test
    QLYUSER_Truy cap menu quan ly nguoi dung
    Input Text    xpath=//*[@id="exampleInputEmail1"]    robot_test
    Click Button    xpath=//*[@id="command"]/div[2]/button
    ${username}=    Get Text    xpath=//*[@id="example2"]/tbody/tr/td[3]
    Should Be Equal    ${username}    robot_test
    ${fullname}=    Get Text    xpath=//*[@id="example2"]/tbody/tr[1]/td[4]
    Should Be Equal    ${fullname}    robot_test
    ${email}=    Get Text    xpath=//*[@id="example2"]/tbody/tr[1]/td[5]
    Should Be Equal    ${email}    robot_test@vnpt.vn
    ${msisdn}=    Get Text    xpath=//*[@id="example2"]/tbody/tr[1]/td[6]
    Should Be Equal    ${msisdn}    0123456789

QLYUSER_Search user robot_test_updated
    QLYUSER_Truy cap menu quan ly nguoi dung
    Input Text    xpath=//*[@id="exampleInputEmail1"]    robot_test
    Click Button    xpath=//*[@id="command"]/div[2]/button
    ${username}=    Get Text    xpath=//*[@id="example2"]/tbody/tr/td[3]
    Should Be Equal    ${username}    robot_test
    ${fullname}=    Get Text    xpath=//*[@id="example2"]/tbody/tr[1]/td[4]
    Should Be Equal    ${fullname}    robot_test_updated
    ${email}=    Get Text    xpath=//*[@id="example2"]/tbody/tr[1]/td[5]
    Should Be Equal    ${email}    robot_test@vnpt.vn
    ${msisdn}=    Get Text    xpath=//*[@id="example2"]/tbody/tr[1]/td[6]
    Should Be Equal    ${msisdn}    0123456789

QLYUSER_Them user
    QLYUSER_Truy cap menu quan ly nguoi dung
    Click Button    xpath=//*[@id="content"]/section[1]/ol/button
    Input Text    xpath=//*[@name="username"]    robot_test
    Input Text    xpath=//*[@id="fullname"]    robot_test
    Input Text    xpath=//*[@name="msisdn"]    0123456789
    Select From List By Value    xpath=//*[@id="donViId"]    1021
    Click Button    xpath=//*[@id="user"]/div[2]/button
    ${result}=    Get Text    xpath=//*[@id="alert_id_common"]/div
    Should Contain    ${result}    thành công
    QLYUSER_Search user robot_test

QLYUSER_Truy cap menu quan ly nguoi dung
    ${URL}    Catenate    SEPARATOR=    ${URL_TEST}    /user/init
    Go To    ${URL}

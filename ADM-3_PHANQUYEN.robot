*** Settings ***
Library           SeleniumLibrary
Resource          Utils.robot

*** Keywords ***
PHANQUYEN_Cap nhat nhom quyen
    PHANQUYEN_Truy cap menu qly nhom quyen
    #Update quyen cua nhom vua tao
    Click Element    xpath=//*[@id="example2"]/tbody/tr[1]/td[3]/a[3]
    Click Element    xpath=//*[@id="25_anchor"]/i[1]
    Click Button    xpath=//*[@id="btnUpdateMenu"]
    ${result}=    Get Text    xpath=//*[@id="alert_id_common"]/div
    Should Contain    ${result}    thành công

PHANQUYEN_Clear test data phan quyen
    Connect DB
    Execute Sql String    begin PKG_TEST_CASE.reset_nhom_quyen_robot('NHOMQUYEN_ROBOT'); end;
    Disconnect From Database

PHANQUYEN_Them nhom quyen
    PHANQUYEN_Truy cap menu qly nhom quyen
    #Them 1 nhom quyen de test
    Click Button    xpath=//*[@id="content"]/section[1]/ol/button
    Input Text    xpath=//*[@id="exampleInputEmail1"]    NHOMQUYEN_ROBOT
    Click Button    xpath=//*[@id="gbo"]/div[2]/button
    ${result}=    Get Text    xpath=//*[@id="alert_id_common"]/div
    Should Contain    ${result}    thành công

PHANQUYEN_Truy cap menu qly nhom quyen
    ${URL}    Catenate    SEPARATOR=    ${URL_TEST}    /group/init
    Go To    ${URL}

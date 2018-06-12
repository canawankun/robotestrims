*** Settings ***
Library           SeleniumLibrary
Resource          Utils.robot

*** Keywords ***
ONAIR_TRAM_KHAIBAO
    ONAIR_Truy cap menu khai bao Tram
    Select From List By Value    xpath=//*[@id="neTypeId"]    2    #BTS
    Click Button    id=btn_node    #An nut tim BSC_RNC trong form
    Select Frame    xpath=//*[@id="myModalBTSCode"]/div/div/div[2]/div[1]/iframe    #Chon iframe va focus vao
    Wait ajax complete
    Wait Until Page Contains    NE
    Double Click Element    xpath=//*[@id="example1"]/tbody/tr[1]/td[2]
    Select Window
    Select From List By Value    xpath=//*[@id="donViId"]    1104    #Chon don vi HA Noi
    Wait Until Element Is Visible    xpath=//*[@id="datecreate"]
    Input Text    xpath=//*[@id="datecreate"]    09/04/2018    # ngay hoat dong
    Input Text    xpath=//*[@id="mydiv"]/div[5]/div[2]/div[2]/div/input    TEST_ROBOT    # hoan canh ra doi
    Input Text    xpath=//*[@id="mydiv"]/div[5]/div[2]/div[3]/div/input    TEST_ROBOT    #ten nguoi quan ly
    Input Text    xpath=//*[@id="mydiv"]/div[5]/div[2]/div[4]/div/input    TEST_ROBOT    #ten cho quan ly
    Input Text    xpath=//*[@id="mydiv"]/div[6]/div[2]/div[1]/div/input    TEST_ROBOT    #ten tren he thong
    Select From List By Value    xpath=//*[@id="thietBiId"]    1023    #HUAWEI
    Select From List By Value    xpath=//*[@id="loaiTramId"]    1    #Loai tram IBS
    Select From List By Value    xpath=//*[@id="cauHinhPortId"]    1    #Cau hinh 1/1/1
    Click Button    xpath=//*[@id="model"]/div[2]/button    #Submit
    ${result}=    Get Text    xpath=//*[@id="alert_id_common"]/div
    Should Contain    ${result}    Thành công    #Check ket qua

ONAIR_Truy cap menu duyet Tram
    ${URL}    Catenate    SEPARATOR=    ${URL_TEST}    /nodes/approveOn
    Go To    ${URL}

ONAIR_Truy cap menu khai bao Tram
    ${URL}    Catenate    SEPARATOR=    ${URL_TEST}    /nodes/addtram
    Go To    ${URL}

ONAIR_Clear test data tram
    Connect DB
    Execute Sql String    begin PKG_TEST_CASE.reset_onair_tram('TEST_ROBOT'); end;
    Disconnect From Database

ONAIR_TRAM_DUYET_CAP_MA
    ONAIR_Truy cap menu duyet Tram
    Wait ajax complete
    Click Element    xpath=//*[@id="example1"]/tbody/tr/td[1]/div    #Chon doi tuong dau tien
    Click Button    xpath=//*[@id="btnDuyetAll"]    #an nut duyet
    Wait Until Element Is Visible    xpath=//*[@id="commentAll"]
    Wait ajax complete
    Input Text    xpath=//*[@id="commentAll"]    TEST_ROBOT    # coment
    Click Button    xpath=//*[@id="btnUpdateAllComment"]    #Submit
    Wait ajax complete
    Input Text    xpath=//*[@id="example1_filter"]/label/input    TEST_ROBOT
    ${result}=    Get Text    xpath=//*[@id="example1"]/tbody/tr/td
    Should Contain    ${result}    Không    #Check ket qua

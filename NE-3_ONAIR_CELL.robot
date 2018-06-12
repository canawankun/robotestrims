*** Settings ***
Library           SeleniumLibrary
Resource          Utils.robot

*** Keywords ***
ONAIR_Clear test data cell
    Connect DB
    Execute Sql String    begin PKG_TEST_CASE.reset_onair_cell('TEST_ROBOT'); end;
    Disconnect From Database

ONAIR_CELL_KHAIBAO
    ONAIR_Truy cap menu khai bao Cell
    Click Button    xpath=//*[@id="btn_bts"]    #An nut tim BTS trong form
    Select Frame    xpath=//*[@id="myModalBTSCode"]/div/div/div[2]/div[1]/iframe    #Chon iframe va focus vao
    Wait ajax complete
    Wait Until Page Contains    NE
    Double Click Element    xpath=//*[@id="example1"]/tbody/tr[1]
    Select Window
    Input Text    xpath=//*[@id="tenCell"]    TEST_ROBOT    #ten nguoi quan ly
    Input Text    xpath=//*[@id="hoanCanhRaDoi"]    TEST_ROBOT    # hoan canh ra doi
    Input Text    xpath=//*[@id="ngayHoatDong"]    04/17/2018    #ngay hoat dong
    Input Text    xpath=//*[@id="tenTrenHeThong"]    TEST_ROBOT    #ten tren he thong
    Input Text    xpath=//*[@id="lac"]    50    #lac
    Input Text    xpath=//*[@id="ci"]    100    #ci
    Select From List By Value    xpath=//*[@id="bangTanId"]    59    #bang tan GSM900/1800
    Select From List By Value    xpath=//*[@id="thietBiId"]    1021    #thiet bi NOKIA_SIEMENS
    Select From List By Value    xpath=//*[@id="loaiTramId"]    10    #loai tram micro
    Click Button    xpath=//*[@id="cell2gRegForm"]/div[5]/button    #Submit
    ${result}=    Get Text    xpath=//*[@id="alert_id_common"]/div
    Should Contain    ${result}    Thành công    #Check ket qua

ONAIR_CELL_DUYET_CAP_MA
    ONAIR_Truy cap menu duyet Cell
    Wait ajax complete
    Click Element    xpath=//*[@id="example1"]/tbody/tr/td[1]/div    #chon doi tuong dau tien
    Click Button    xpath=//*[@id="btnDuyetAll"]    #an nut duyet tat ca
    Wait ajax complete
    Wait Until Element Is Visible    xpath=//*[@id="commentAll"]
    Input Text    xpath=//*[@id="commentAll"]    TEST_ROBOT    # coment
    Click Button    xpath=//*[@id="btnUpdateComment"]    #Submit

ONAIR_Truy cap menu khai bao Cell
    ${URL}    Catenate    SEPARATOR=    ${URL_TEST}    /cells/init
    Go To    ${URL}

ONAIR_Truy cap menu duyet Cell
    ${URL}    Catenate    SEPARATOR=    ${URL_TEST}    /cells/approveOn/init
    Go To    ${URL}

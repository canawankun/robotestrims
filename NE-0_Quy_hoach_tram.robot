*** Settings ***
Library           SeleniumLibrary
Resource          Utils.robot

*** Variables ***
${SEARCH_QH_TINH}    QHT_HNI
${MA_QH}    QH_ROBOT
${TEN_QH}   Quy hoạch robot

*** Keywords ***
Menu quy hoach tram
    ${URL}    Catenate    SEPARATOR=    ${URL_TEST}    /project/init
    Go To    ${URL}

Them quy hoach neu chua co
    Menu quy hoach tram
    Input Text    xpath=//*[@id="table1_filter"]/label/input    ${MA_QH}
    Wait ajax complete
    ${result}=    Get Matching Xpath Count    xpath=//*[@id="table1"]/tbody/tr/td[2]
    Run Keyword If    '${result}'=='0'    Them quy hoach    #neu chua ton tai quy hoach nao thi them moi

Them quy hoach
    Menu quy hoach tram
    Clear test data QH
    Click Button    xpath=//*[@id="home"]/ol/button
    Input Text    xpath=//*[@id="projectCode"]    ${MA_QH}    #nhap ma quy hoach
    Input Text    xpath=//*[@id="projectName"]    ${TEN_QH}   #nhap ten quy hoach
    Click Button    xpath=//*[@id="btnAdd"]   #an nut them moi
    ${result}=    Get Text    xpath=//*[@id="alert_id_common"]/div    #ket qua
    Should Contain    ${result}    Thêm mới thành công

Them quy hoach tinh
    Them quy hoach neu chua co
    Menu quy hoach tram
    Click Element    xpath=//*[@id="tabs"]/li[2]/a    #an tab quy hoach tinh
    Wait ajax complete
    Wait Until Element Is Visible    xpath=//*[@id="menu1"]/ol/button
    Click Button    xpath=//*[@id="menu1"]/ol/button    #an nut them quy hoach tinh
    Select From List By Label    xpath=//*[@id="qhId"]    ${TEN_QH}    #Chon theo ten quy hoach
    Select From List By Value    xpath=//*[@id="tinhTpId"]    1050    #ha noi HNI
    Input Text    xpath=//*[@name="soLuongChi2G"]    20    #chi so luong 2g
    Input Text    xpath=//*[@name="soLuong2G3G"]    10    #chi so luong 2g va 3g
    Input Text    xpath=//*[@name="chstActive"]    5    #3g lap tren csht co san
    Input Text    xpath=//*[@name="cshtNew"]    2    #3g lap tren csht moi
    Input Text    xpath=//*[@name="tongCshtXaymoi"]    4    #tong csht moi 2g 3g
    Input Text    xpath=//*[@name="tongThietBi3G"]    6    #tong tbi 3g 900MHz
    Input Text    xpath=//*[@name="lte"]    3    #tong tbi 3g 900MHz
    Click Button    xpath=//*[@id="addProjectInforBtn"]
    ${result}=    Get Text    xpath=//*[@id="alert_id_common"]/div
    Should Contain    ${result}    thành công

Update quy hoach tinh
    Menu quy hoach tram
    Click Element    xpath=//*[@id="tabs"]/li[2]/a    #an tab quy hoach tinh
    Wait Until Element Is Visible    xpath=//*[@id="menu1"]/ol/button
    Input Text    xpath=//*[@id="table2_filter"]/label/input    ${SEARCH_QH_TINH}
    Click Element    xpath=//*[@id="table2"]/tbody/tr/td[15]/a[1]    #an nut sua quy hoach tinh
    Input Text    xpath=//*[@name="soLuongChi2G"]    9    #chi so luong 2g
    Input Text    xpath=//*[@name="soLuong2G3G"]    9    #chi so luong 2g va 3g
    Input Text    xpath=//*[@name="chstActive"]    9    #3g lap tren csht co san
    Input Text    xpath=//*[@name="cshtNew"]    9    #3g lap tren csht moi
    Input Text    xpath=//*[@name="tongCshtXaymoi"]    9    #tong csht moi 2g 3g
    Input Text    xpath=//*[@name="tongThietBi3G"]    9    #tong tbi 3g 900MHz
    Input Text    xpath=//*[@name="lte"]    9    #tong tbi 3g 900MHz
    Click Button    id=addProjectInforBtn
    ${result}=    Get Text    xpath=//*[@id="alert_id_common"]/div
    Should Contain    ${result}    thành công

Clear test data QH
    Connect DB
    ${SQL}    Catenate    SEPARATOR=    begin PKG_TEST_CASE.reset_quy_hoach('    ${MA_QH}    '); end;
    Execute Sql String    ${SQL}
    Disconnect From Database

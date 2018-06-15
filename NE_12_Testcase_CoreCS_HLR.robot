*** Settings ***
Library           SeleniumLibrary
Resource          Utils.robot

*** Variables ***
${HLR_CODE}       HLR_ROBOT    # ma_node khi duoc them moi
${HLR_NAME}       HLR_ROBOT    # ten hlr khi duoc them moi vao database
${HLR_NEW_NAME}    HLR_ROBOT_NEW    # ten moi khi update

*** Keywords ***
Menu hlr
    ${URL}    Catenate    SEPARATOR=    ${URL_TEST}    /hlr/init
    Go To    ${URL}

Them moi hlr
    Menu hlr
    Click Button    //*[@id="content"]/section[1]/ol/button
    Wait ajax complete
    Input Text    //*[@id="code"]    ${HLR_CODE}
    Select From List By Value    //*[@id="donViId"]    1070
    Select From List By Value    //*[@id="thietBiId"]    1025
    Input Text    //*[@id="item"]/div[1]/div[7]/div/input    robot_test
    Input Text    //*[@id="item"]/div[1]/div[8]/div/input    0888422866
    Input Text    //*[@id="item"]/div[1]/div[9]/div/input[2]    ${HLR_NAME}
    Input Text    //*[@id="ngayHoatDong"]    2018-06-15
    Input Text    //*[@id="item"]/div[1]/div[11]/div/input    robot_test
    Input Text    //*[@id="item"]/div[1]/div[12]/div/input    HLR
    Wait Until Element Is Visible    //*[@id="item"]/div[2]/button
    Click Button    xpath=//*[@id="item"]/div[2]/button
    ${result}=    Get Text    //*[@id="alert_id_common"]/div/b
    Should Contain    ${result}=    Thành công
    Search hlr    ${HLR_NAME}

Search hlr
    [Arguments]    ${name_search}    # search theo ten hlr
    Menu hlr
    Input Text    //*[@id="name"]    ${name_search}
    Click Button    //*[@id="frm_search"]/div/div/div[2]/button
    Wait ajax complete
    ${reuslt}    Get Text    //*[@id="example1"]/tbody/tr/td[2]
    Should Be Equal    ${reuslt}    ${name_search}

update_hlr
    Menu hlr
    Search hlr    ${HLR_NAME}
    Click Element    //*[@id="example1"]/tbody/tr/td[12]/a[1]
    Wait ajax complete
    Input Text    //*[@id="item"]/div[1]/div[9]/div/input[2]    ${HLR_NEW_NAME}
    Click Button    //*[@id="item"]/div[2]/button
    Wait ajax complete
    ${result}=    Get Text    //*[@id="alert_id_common"]/div/b
    Should Contain    ${result}=    Thành công
    Search hlr    ${HLR_NEW_NAME}

delete_hlr
    [Arguments]    ${code}
    Menu hlr
    Search hlr    ${code}
    Click Element    //*[@id="example1"]/tbody/tr/td[12]/a[2]
    Handle Alert
    Wait ajax complete
    ${result}=    Get Text    //*[@id="alert_id_common"]/div/b
    Should Contain    ${result}=    Thành công

*** Settings ***
Suite Setup       Login VNPT ID to RIMS (test_rims)
Suite Teardown    Close Browser
Library           SeleniumLibrary
Resource          ADM-3_PHANQUYEN.robot
Resource          NE-1_TRAM_QH.robot
Resource          ADM-1_QLYUSER.robot
Resource          NE-3_ONAIR_TRAM.robot
Resource          NE-0_Quy_hoach_tram.robot
Resource          NE-3_ONAIR_CELL.robot
Resource          NE_12_Testcase_CoreCS_HLR.robot

*** Variables ***

*** Test Cases ***
ADM-1_Testcase_Quan_ly_nguoi_dung
    [Tags]    user
    #xoa du lieu cu
    QLYUSER_Clear test data user
    #them moi
    QLYUSER_Them user
    #cap nhat
    QLYUSER_Edit user
    #xoa
    QLYUSER_Delete user
    #xoa du lieu vua test
    QLYUSER_Clear test data user

ADM-3_Testcase_Phan quyen
    [Tags]    quyen
    # xoa du lieu cu neu co
    PHANQUYEN_Clear test data phan quyen
    # them moi 1 nhom quyen
    PHANQUYEN_Them nhom quyen
    # gan quyen cho nhom
    PHANQUYEN_Cap nhat nhom quyen
    # xoa du lieu cu
    PHANQUYEN_Clear test data phan quyen

NE-0_Testcase_Quy_hoach_tinh
    [Tags]    qhtinh
    Them quy hoach tinh
    Update quy hoach tinh

NE-1_Testcase_Quan_ly_tram_QH
    [Tags]    tramqh    ne_1_tramqh_form
    #xoa du lieu cu
    TRAMQH_Clear test data tram QH
    #bat dau testcase
    TRAMQH_Truy cap menu quan ly tram QH
    TRAMQH_Nhap form them tram QH
    #xoa du lieu cu
    TRAMQH_Clear test data tram QH

NE-3_Testcase_Quy_Trinh_OnAir
    [Tags]    onair
    #Xoa du lieu neu co
    ONAIR_Clear test data cell
    ONAIR_Clear test data tram
    #Khai Bao TRam
    ONAIR_TRAM_KHAIBAO
    #Duyet Tram
    ONAIR_TRAM_DUYET_CAP_MA
    #Khai bao CELL
    ONAIR_CELL_KHAIBAO
    #Duyet Cell
    ONAIR_CELL_DUYET_CAP_MA

NE-11_Testcase_Them_tram_QH_excel
    [Tags]    tramqh    ne_11_add
    TRAMQH_Clear test data tram QH
    TRAMQH_Truy cap menu quan ly tram QH
    TRAMQH_Them moi tram QH excel

NE-11_Testcase_Update_tram_QH_excel_PTM
    [Tags]    tramqh    ne_11_ptm
    TRAMQH_Update tram QH excel (PTM)

NE-11_Testcase_Update_tram_QH_excel_VTT
    [Tags]    tramqh    ne_11_vtt
    TRAMQH_Update tram QH excel (VTT)

NE-11_Testcase_Update_tram_QH_excel_QLDA
    [Tags]    tramqh    ne11_qlda
    TRAMQH_Update tram QH excel (QLDA)

NE-11_Testcase_Update_tram_QH_excel_NETx
    [Tags]    tramqh    ne_11_netx
    TRAMQH_Update tram QH excel (NETx)

NE-11_Testcase_Clear_tram_QH_data_test
    [Tags]    tramqh    ne_11_clear
    TRAMQH_Clear test data tram QH

NE_12_Testcase_CoreCS_HLR
    [Tags]    ne_12_hlr
    Them moi hlr
    update_hlr
    delete_hlr    ${HLR_NEW_NAME}

*** Keywords ***

*** Settings ***
Library           SeleniumLibrary
Resource          Utils.robot

*** Variables ***
${TEN_TRAM_QH}    TEST_ROBOT    # tên này phải giống tên trong các file template excel thì testcase mới thành công

*** Keywords ***
TRAMQH_Check thong tin Antena (NETx)
    Wait ajax complete
    ${tenQh}    Get Value    id=tenQh
    Should Be Equal    ${tenQh}    ${TEN_TRAM_QH}
    ${DVI_TRACH_NHIEM_NGUON_DC_ID}    Get Selected List Label    id=DVI_TRACH_NHIEM_NGUON_DC_ID
    Should Contain    ${DVI_TRACH_NHIEM_NGUON_DC_ID}    VNPT-NET
    ${NGAY_DAP_UNG_ANTENA_DU_KIEN}    Get Value    id=NGAY_DAP_UNG_ANTENA_DU_KIEN
    Should Contain    ${NGAY_DAP_UNG_ANTENA_DU_KIEN}    18/01/2018
    ${NGAY_DAP_UNG_ANTENA_THUC_TE}    Get Value    id=NGAY_DAP_UNG_ANTENA_THUC_TE
    Should Contain    ${NGAY_DAP_UNG_ANTENA_THUC_TE}    24/01/2018

TRAMQH_Check thong tin CSHT (VTT)
    Wait ajax complete
    ${TEN_TRAM}    Get Value    id=TEN_TRAM
    Should Be Equal    ${TEN_TRAM}    2GTEST_ROBOT
    ${maQh}    Get Value    id=maQh
    Should Be Equal    ${maQh}    ${TEN_TRAM_QH}    # Mã trạm QH ban đầu tự sinh, trong file template của VTT sẽ update lại mã trạm QH này
    ${tenQh}    Get Value    id=tenQh
    Should Be Equal    ${tenQh}    ${TEN_TRAM_QH}
    ${DVI_TRACH_NHIEM_CSHT_ID}    Get Selected List Label    id=DVI_TRACH_NHIEM_CSHT_ID
    Should Be Equal    ${DVI_TRACH_NHIEM_CSHT_ID}    VTT
    ${tinhTpId}    Get Selected List Label    id=tinhTpId
    Should Be Equal    ${tinhTpId}    Hồ Chí Minh
    ${quanHuyenId}    Get Selected List Label    id=quanHuyenId
    Should Be Equal    ${quanHuyenId}    Bình Chánh
    ${phuongXaId}    Get Selected List Label    id=phuongXaId
    Should Be Equal    ${phuongXaId}    Bình Hưng
    ${DIA_CHI}    Get Value    id=DIA_CHI
    Should Be Equal    ${DIA_CHI}    địa chỉ xây dựng
    ${CACH_XAY_CSHT_ID}    Get Selected List Label    id=CACH_XAY_CSHT_ID
    Should Be Equal    ${CACH_XAY_CSHT_ID}    Xây mới
    ${LOAI_DAT_ID}    Get Selected List Label    id=LOAI_DAT_ID
    Should Be Equal    ${LOAI_DAT_ID}    Thuê
    ${NGAY_CAP_DAT}    Get Value    id=NGAY_CAP_DAT
    Should Be Equal    ${NGAY_CAP_DAT}    13/04/2018
    ${NGAY_XIN_PHEP_XD_NHA_TRAM}    Get Value    id=NGAY_XIN_PHEP_XD_NHA_TRAM
    Should Be Equal    ${NGAY_XIN_PHEP_XD_NHA_TRAM}    14/04/2018
    ${NGAY_HOAN_THANH_THU_TUC}    Get Value    id=NGAY_HOAN_THANH_THU_TUC
    Should Be Equal    ${NGAY_HOAN_THANH_THU_TUC}    15/04/2018
    ${NGAY_KHOI_CONG_XD_NHA_TRAM}    Get Value    id=NGAY_KHOI_CONG_XD_NHA_TRAM
    Should Be Equal    ${NGAY_KHOI_CONG_XD_NHA_TRAM}    16/04/2018
    ${NGAY_HOAN_THANH_XD_NHA_TRAM}    Get Value    id=NGAY_HOAN_THANH_XD_NHA_TRAM
    Should Be Equal    ${NGAY_HOAN_THANH_XD_NHA_TRAM}    17/04/2018
    ${LOAI_NHA_TRAM_ID}    Get Selected List Label    id=LOAI_NHA_TRAM_ID
    Should Be Equal    ${LOAI_NHA_TRAM_ID}    Nhà xây
    ${DO_CAO_COT}    Get Value    id=DO_CAO_COT
    Should Be Equal    ${DO_CAO_COT}    10
    ${DO_CAO_VI_TRI_XAY_COT_ANTTEN}    Get Value    id=DO_CAO_VI_TRI_XAY_COT_ANTTEN
    Should Be Equal    ${DO_CAO_VI_TRI_XAY_COT_ANTTEN}    12

TRAMQH_Check thong tin Nguon DC (QLDA)
    Wait ajax complete
    ${tenQh}    Get Value    id=tenQh
    Should Be Equal    ${tenQh}    ${TEN_TRAM_QH}
    ${DVI_TRACH_NHIEM_NGUON_DC_ID}    Get Selected List Label    id=DVI_TRACH_NHIEM_NGUON_DC_ID
    Should Contain    ${DVI_TRACH_NHIEM_NGUON_DC_ID}    VNPT-NET
    ${NGUON_THIET_BI_TU_NGUON_ID}    Get Selected List Label    id=NGUON_THIET_BI_TU_NGUON_ID
    Should Contain    ${NGUON_THIET_BI_TU_NGUON_ID}    Dự án mới
    ${LOAI_TU_NGUON_ID}    Get Selected List Label    id=LOAI_TU_NGUON_ID
    Should Contain    ${LOAI_TU_NGUON_ID}    Emerson
    ${DUNG_LUONG_TU_NGUON}    Get Value    id=DUNG_LUONG_TU_NGUON
    Should Be Equal    ${DUNG_LUONG_TU_NGUON}    1
    ${SO_RACTIFIER}    Get Value    id=SO_RACTIFIER
    Should Be Equal    ${SO_RACTIFIER}    1
    ${DUNG_LUONG_ACCU}    Get Value    id=DUNG_LUONG_ACCU
    Should Be Equal    ${DUNG_LUONG_ACCU}    2
    ${SO_LUONG_ACCU}    Get Value    id=SO_LUONG_ACCU
    Should Be Equal    ${SO_LUONG_ACCU}    3
    ${DIEN_AP_ACCU}    Get Value    id=DIEN_AP_ACCU
    Should Be Equal    ${DIEN_AP_ACCU}    12
    ${NGAY_DAP_UNG_NGUON_DC_DU_KIEN}    Get Value    id=NGAY_DAP_UNG_NGUON_DC_DU_KIEN
    Should Be Equal    ${NGAY_DAP_UNG_NGUON_DC_DU_KIEN}    16/04/2018
    ${NGAY_DAP_UNG_NGUON_DC_TT}    Get Value    id=NGAY_DAP_UNG_NGUON_DC_TT
    Should Be Equal    ${NGAY_DAP_UNG_NGUON_DC_TT}    17/04/2018

TRAMQH_Check thong tin chung (PTM)
    Wait ajax complete
    ${ma_building}    Get Value    xpath=//*[@id="buildingCode"]
    Should Be Equal    ${ma_building}    CSHT_HCM_02553
    ${nam_khoi_tao}    Get Value    xpath=//*[@id="namKhoiTao"]
    Should Be Equal    ${nam_khoi_tao}    18/01/2018
    ${longitude}    Get Value    xpath=//*[@id="longitude"]
    Should Be Equal    ${longitude}    106.652565
    ${latitude}    Get Value    xpath=//*[@id="latitude"]
    Should Be Equal    ${latitude}    10.820149
    Wait Until Element Is Visible    xpath=//*[@id="bangTanId"]
    ${bangtan}    Get Selected List Label    xpath=//*[@id="bangTanId"]
    Should Be Equal    ${bangtan}    GSM900
    ${loaicongnghe}    Get Selected List Label    xpath=//*[@id="loaiCongNgheId"]
    Should Be Equal    ${loaicongnghe}    2G
    ${chuong_trinh}    Get Selected List Label    xpath=//*[@id="loaiPtCshtId"]
    Should Be Equal    ${chuong_trinh}    Quy hoạch
    ${csht}    Get Selected List Label    xpath=//*[@id="trangThaiCshtId"]
    Should Be Equal    ${csht}    Mới
    ${donViPheDuyet}    Get Selected List Label    xpath=//*[@id="donViPheDuyet"]
    Should Be Equal    ${donViPheDuyet}    VNPT-NET
    ${soHieuVanBan}    Get Value    xpath=//*[@id="soHieuVanBan"]
    Should Be Equal    ${soHieuVanBan}    BTC0001
    ${ngayPheDuyet}    Get Value    xpath=//*[@id="ngayPheDuyet"]
    Should Be Equal    ${ngayPheDuyet}    18/01/2018
    ${ngayDieuChinhGanNhat}    Get Value    xpath=//*[@id="ngayDieuChinhGanNhat"]
    Should Be Equal    ${ngayDieuChinhGanNhat}    18/01/2018

TRAMQH_Clear test data tram QH
    Connect DB
    ${SQL}    Catenate    SEPARATOR=    begin PKG_TEST_CASE.reset_tram_qh('    ${TEN_TRAM_QH}    '); end;
    Execute Sql String    ${SQL}
    Disconnect From Database

TRAMQH_Nhap form them tram QH
    Click Button    xpath=//*[@id="content"]/div[1]/ol/button[1]    #An nut them tram QH
    Click Button    id=btn_building    #An nut tim building trong form
    Select Frame    xpath=//*[@id="myBuilding"]/div/div/div[2]/div[1]/iframe    #Chon iframe va focus vao
    Wait Until Page Contains    Building
    Input Text    id=exampleInputEmail1    CSHT_HNI_03068
    Click Button    xpath=//*[@id="frm_search"]/div[2]/button    #An nut tim kiem building
    Wait Until Keyword Succeeds    3x    2s    Wait Until Element Is Visible    xpath=//*[@id="example1"]/tbody/tr/td[2]    #Doi ket qua tim kiem
    Wait ajax complete
    ${building_code}=    Get Text    xpath=//*[@id="example1"]/tbody/tr/td[2]
    Log    ${building_code}
    Double Click Element    xpath=//*[@id="example1"]/tbody/tr/td[2]
    Select Window
    Select From List By Index    id=qhTinhId    1
    Input Text    id=maQh    ${TEN_TRAM_QH}
    Input Text    id=namKhoiTao    12/04/2018
    Input Text    id=tenQh    ${TEN_TRAM_QH}    #input vao element trc do de close popup datepicker
    Select From List By Value    id=loaiCongNgheId    2    #3G
    Wait Until Element Is Visible    xpath=//*[@id="bangTanId"]/option[1]    #doi den khi listbox dc fill gia tri xong vi khi chon loai cong nghe se co js load list bang tan
    Wait ajax complete
    Select From List By Value    id=bangTanId    58    #U2100
    Select From List By Value    id=loaiPtCshtId    41    #Xử lý điểm nóng
    Select From List By Value    id=trangThaiCshtId    1    #Mới
    Select From List By Value    id=donViPheDuyet    3    #VNPT-NET
    Input Text    id=soHieuVanBan    001
    Input Text    id=ngayPheDuyet    12/04/2018
    Click Button    xpath=//*[@id="content"]/section/div/div/div/div[2]/form/div[2]/button    #Submit
    ${result}=    Get Text    xpath=//*[@id="alert_id_common"]/div
    Should Contain    ${result}    Thành công    #Check ket qua

TRAMQH_Search tram QH
    [Arguments]    ${tenqh}
    #tìm trạm QH theo tên
    Input Text    id=TEN_QUY_HOACH    ${tenqh}
    Click Button    id=btnSearch
    Wait ajax complete

TRAMQH_Them moi tram QH excel
    #ấn nút thêm mới bằng excel
    Click Button    xpath=//*[@id="content"]/div[1]/ol/button[2]
    #ấn nút upload excel và tự động chọn file
    Choose File    id=file    ${CURDIR}/Template_xlsx/MaudangkymamQH.xlsx
    Click Button    id=upload
    ${result}    Get Text    id=mes_
    Should Contain    ${result}    thành công
    #check lại kết quả ở trang list trạm quy hoạch
    TRAMQH_Truy cap menu quan ly tram QH
    Input Text    id=TEN_QUY_HOACH    ${TEN_TRAM_QH}
    Click Button    id=btnSearch
    Wait ajax complete
    ${tenqh}    Get Text    xpath=//*[@id="table0"]/tbody/tr/td[3]
    Should Be Equal    ${tenqh}    ${TEN_TRAM_QH}

TRAMQH_Truy cap menu quan ly tram QH
    ${URL}    Catenate    SEPARATOR=    ${URL_TEST}    /project_station/init
    Go To    ${URL}

TRAMQH_Update tram QH excel (NETx)
    # --- UPDATE EXCEL NETx ---
    TRAMQH_Truy cap menu quan ly tram QH
    #ấn nút sửa trạm QH với excel
    Click Button    xpath=//*[@id="content"]/div[1]/ol/button[3]
    #sửa trạm QH của QLDA
    Choose File    id=file2    ${CURDIR}/Template_xlsx/update_qh_netx.xlsx
    Click Button    id=upload2
    #check lại kết quả
    TRAMQH_Truy cap menu quan ly tram QH
    TRAMQH_Search tram QH    ${TEN_TRAM_QH}
    Click Element    xpath=//*[@id="td-14-0"]/a/img    #ấn nút sửa thông tin Antena

TRAMQH_Update tram QH excel (PTM)
    # --- UPDATE EXCEL PTM ---
    TRAMQH_Truy cap menu quan ly tram QH
    #ấn nút sửa trạm QH với excel
    Click Button    xpath=//*[@id="content"]/div[1]/ol/button[3]
    #sửa trạm QH của PTM
    Choose File    id=file3    ${CURDIR}/Template_xlsx/update_qh_ptm.xlsx
    Click Button    id=upload3
    #check lại kết quả
    TRAMQH_Truy cap menu quan ly tram QH
    TRAMQH_Search tram QH    ${TEN_TRAM_QH}
    Click Element    xpath=//*[@id="td-10-0"]/a/img    #ấn nút sửa thông tin chung
    TRAMQH_Check thong tin chung (PTM)

TRAMQH_Update tram QH excel (QLDA)
    # --- UPDATE EXCEL QLDA ---
    TRAMQH_Truy cap menu quan ly tram QH
    #ấn nút sửa trạm QH với excel
    Click Button    xpath=//*[@id="content"]/div[1]/ol/button[3]
    #sửa trạm QH của QLDA
    Choose File    id=file1    ${CURDIR}/Template_xlsx/update_qh_qlda.xlsx
    Click Button    id=upload1
    #check lại kết quả
    TRAMQH_Truy cap menu quan ly tram QH
    TRAMQH_Search tram QH    ${TEN_TRAM_QH}
    Click Element    xpath=//*[@id="td-13-0"]/a/img    #ấn nút sửa thông tin nguồn DC
    TRAMQH_Check thong tin Nguon DC (QLDA)

TRAMQH_Update tram QH excel (VTT)
    # --- UPDATE EXCEL VTT ---
    TRAMQH_Truy cap menu quan ly tram QH
    #ấn nút sửa trạm QH với excel
    Click Button    xpath=//*[@id="content"]/div[1]/ol/button[3]
    #sửa trạm QH của VTT
    Choose File    id=file    ${CURDIR}/Template_xlsx/update_qh_tinh.xlsx
    Click Button    id=upload
    #check lại kết quả
    TRAMQH_Truy cap menu quan ly tram QH
    TRAMQH_Search tram QH    ${TEN_TRAM_QH}
    Click Element    xpath=//*[@id="td-12-0"]/a/img    #ấn nút sửa thông tin csht
    TRAMQH_Check thong tin CSHT (VTT)

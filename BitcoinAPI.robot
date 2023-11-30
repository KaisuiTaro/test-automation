# RequestsLibraryのインストール
# pip install robotframework-requests

# RequestsLibraryのドキュメント
# https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html

# REST API関連のライブラリは↑以外にもRESTinstanceというのもある
# https://github.com/asyrjasalo/RESTinstance

# Coincheck取引所APIドキュメント
# https://coincheck.com/ja/documents/exchange/api

*** Settings ***
Library  RequestsLibrary

*** Variables ***
${BASE_URL}   https://coincheck.com/api

*** Keywords ***
ティッカー情報(ビットコイン)
    ${endpoint}=    Catenate    SEPARATOR=    ${BASE_URL}    /ticker
    ${response}=    Get    ${endpoint}    expected_status=200
    Log To Console    \n${response.json()}

ティッカー情報(イーサリアム)
    ${endpoint}=    Catenate    SEPARATOR=    ${BASE_URL}    /ticker
    ${response}=    Get    ${endpoint}    params=pair=etc_jpy    expected_status=200
    Log To Console    \n${response.json()}

ティッカー情報(モナコイン最新価格)
    ${endpoint}=    Catenate    SEPARATOR=    ${BASE_URL}    /ticker
    ${response}=    Get    ${endpoint}    params=pair=mona_jpy    expected_status=200
    Log To Console    \n${response.json()}[last]

*** Test Cases ***
ビットコインのティッカー情報を取得する
    ティッカー情報(ビットコイン)
イーサリアムのティッカー情報を取得する
    ティッカー情報(イーサリアム)
モナコインの最新取引価格情報を取得する
    ティッカー情報(モナコイン最新価格)
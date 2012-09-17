include(../cutecommon/cutecommon.pri)

TARGET = CuteLight
VERSION = 1.0.1
DEFINES += CC_VERSION=$$VERSION CC_TARGET=$$TARGET

folder_01.source = qml
folder_01.target = .

folder_02.source = ../cutecommon/qml
folder_02.target = .

DEPLOYMENTFOLDERS += folder_01 folder_02

qtcAddDeployment()

symbian{
    TARGET.UID3 = 0xE0B22094
    #TARGET.UID3 = 0x2006a740
    #DEPLOYMENT.installer_header = 0x2002CCCF
    TARGET.CAPABILITY += NetworkServices
    ICON = cutelight.svg

    my_deployment.pkg_prerules += vendorinfo

    DEPLOYMENT += my_deployment

    vendorinfo += "%{\"CuteCube\"}" ":\"CuteCube\""
}

SOURCES += \
    main.cpp


QT       += core gui

QT += network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

TARGET=tsapp

SOURCES += \
    about.cpp \
    main.cpp \
    mainwindow.cpp \
    randnum.cpp \
    sm2.cpp \
    sm2cert.cpp \
    sm2encrypt.cpp \
    sm2key.cpp \
    sm2signverify.cpp \
    sm3hash.cpp \
    sm4encrypt.cpp \
    tlcpclient.cpp \
    tserror.cpp

HEADERS += \
    about.h \
    mainwindow.h \
    randnum.h \
    sm2.h \
    sm2cert.h \
    sm2encrypt.h \
    sm2key.h \
    sm2signverify.h \
    sm3hash.h \
    sm4encrypt.h \
    tlcpclient.h \
    tserror.h \
    version.h

# Default rules for deployment.
target.path = $$(PREFIX)
!isEmpty(target.path): INSTALLS += target

win32: LIBS += -ladvapi32 -lcrypt32 -lgdi32 -luser32 -lws2_32 -L$$(TONGSUO_HOME)/lib -llibssl -llibcrypto
else:unix: LIBS += -L$$(TONGSUO_HOME)/lib -lssl -lcrypto

INCLUDEPATH += $$(TONGSUO_HOME)/include
DEPENDPATH +=  $$(TONGSUO_HOME)/include

win32-g++: PRE_TARGETDEPS += $$(TONGSUO_HOME)/lib/libcrypto.lib.a $$(TONGSUO_HOME)/lib/libssl.lib.a
else:win32:!win32-g++: PRE_TARGETDEPS += $$(TONGSUO_HOME)/lib/libcrypto.lib $$(TONGSUO_HOME)/lib/libssl.lib
else:unix: PRE_TARGETDEPS += $$(TONGSUO_HOME)/lib/libssl.a $$(TONGSUO_HOME)/lib/libcrypto.a

FORMS += \
    about.ui \
    mainwindow.ui \
    randnum.ui \
    sm2cert.ui \
    sm2encrypt.ui \
    sm2key.ui \
    sm2signverify.ui \
    sm3hash.ui \
    sm4encrypt.ui \
    tlcpclient.ui

RESOURCES += \
    certs.qrc

DISTFILES +=

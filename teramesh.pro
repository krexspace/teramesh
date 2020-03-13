QT += widgets concurrent
requires(qtConfig(listwidget))
qtHaveModule(printsupport): QT += printsupport

INCLUDEPATH += "/Users/kre/APPS/GFX/vulkansdk-macos-1.1.126.0/MoltenVK/include"

HEADERS += \
    mainwindow.h \
    vulkanwindow.h \
    renderer.h \
    mesh.h \
    shader.h \
    camera.h

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    vulkanwindow.cpp \
    renderer.cpp \
    mesh.cpp \
    shader.cpp \
    camera.cpp

RESOURCES += teramesh.qrc
RESOURCES += qdarkstyle/style.qrc

# install
#target.path = $$[QT_INSTALL_EXAMPLES]/vulkan/hellovulkancubes
#INSTALLS += target

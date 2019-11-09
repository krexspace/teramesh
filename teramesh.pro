QT += widgets concurrent
requires(qtConfig(listwidget))
qtHaveModule(printsupport): QT += printsupport

HEADERS += \
    amainwindow.h \
    mainwindow.h \
    vulkanwindow.h \
    renderer.h \
    mesh.h \
    shader.h \
    camera.h

SOURCES += \
    amainwindow.cpp \
    main.cpp \
    main_1.cpp \
    mainwindow.cpp \
    vulkanwindow.cpp \
    renderer.cpp \
    mesh.cpp \
    shader.cpp \
    camera.cpp

RESOURCES += teramesh.qrc

# install
#target.path = $$[QT_INSTALL_EXAMPLES]/vulkan/hellovulkancubes
#INSTALLS += target

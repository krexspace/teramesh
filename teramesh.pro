QT += widgets concurrent

CONFIG += c++17
QMAKE_LFLAGS +=  -std=c++17

requires(qtConfig(listwidget))
qtHaveModule(printsupport): QT += printsupport

INCLUDEPATH += "/Users/kre/APPS/GFX/vulkansdk-macos-1.1.126.0/MoltenVK/include"

HEADERS += \
    mainwindow.h \
    vulkanwindow.h \
    renderer.h \
    mesh.h \
    shader.h \
    camera.h \
    AppWindowV2.h \
    RendererAppV3.h
SOURCES += \
    main.cpp \
    mainwindow.cpp \
    vulkanwindow.cpp \
    renderer.cpp \
    mesh.cpp \
    shader.cpp \
    camera.cpp \
    AppWindowV2.cpp \
    RendererAppV3.cpp

INCLUDEPATH += ./external/glm/ \
               ./external/tinyobjloader/ \
               ./external/stb/
win32 {
    DEFINES += VK_USE_PLATFORM_WIN32_KHR
    # VULKAN_SDK_PATH = D:/APPS/3D_GFX/VulkanSDK/1.1.126.0
    VULKAN_SDK_PATH = $$(VULKAN_SDK)
    INCLUDEPATH += $${VULKAN_SDK_PATH}/Include
    LIBS += $${VULKAN_SDK_PATH}/Lib/vulkan-1.lib
}


RESOURCES += teramesh.qrc
RESOURCES += qdarkstyle/style.qrc

# install
#target.path = $$[QT_INSTALL_EXAMPLES]/vulkan/hellovulkancubes
#INSTALLS += target

#include "AppWindowV2.h"

#include <vector>

#include <QDebug>

#ifdef VK_USE_PLATFORM_MACOS_MVK
extern "C" {
void makeViewMetalCompatible(void* handle);
}
#endif

namespace qgenxv2 {


VkWindow::VkWindow() : QWindow() {
#ifdef VK_USE_PLATFORM_MACOS_MVK
    makeViewMetalCompatible(reinterpret_cast<void*>(winId()));
    const void* viewId = reinterpret_cast<void*>(winId());
    render = new qgenxv3::VkRender(viewId);
#elif VK_USE_PLATFORM_WIN32_KHR
    render = new qgenxv3::VkRender(reinterpret_cast<HWND>(winId()));

#endif
    renderTimer.setInterval(1);
    QObject::connect(&renderTimer, &QTimer::timeout, this, &VkWindow::drawFrame);
    renderTimer.start();
}

void VkWindow::drawFrame() {
    Q_ASSERT(render != nullptr);
    render->drawFrame();
}

VkWindow::~VkWindow() {
    qDebug() << "Destroying VkWindow";
    delete render;
}

void VkWindow::resizeEvent(QResizeEvent* event) {
    QWindow::resizeEvent(event);
    if(closeWindowInitiated) return;
    qDebug() << "Resize Event Detected" << event->size().width() << ',' << event->size().height();
    auto w = static_cast<uint32_t>(event->size().width());
    auto h = static_cast<uint32_t>(event->size().height());
    if (windowWidth != w || windowHeigh != h) {
        windowWidth = w;
        windowHeigh = h;
       // Q_ASSERT(render != nullptr);
       qDebug() << "Invoking render->resize()" << (render == nullptr);
       if(render != nullptr) render->resize(windowWidth, windowHeigh);
    }
}

void VkWindow::closeEvent (QCloseEvent *event) {
    qDebug() << "CloseWindow Event Detected";
    closeWindowInitiated = true;
    event->accept();
}

}

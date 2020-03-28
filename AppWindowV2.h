#ifndef VKWINDOW_H
#define VKWINDOW_H
#include <qtimer.h>
#include <RendererAppV3.h>
#include <QResizeEvent>
#include <QWindow>

namespace qgenxv2 {
class VkWindow : public QWindow {
   public:
    VkWindow();
    virtual ~VkWindow();

    void resize(uint32_t w, uint32_t h);
    void drawFrame();

   private:
    void resizeEvent(QResizeEvent* event);
    void closeEvent (QCloseEvent *event);

    qgenxv3::VkRender* render = nullptr;
    QTimer renderTimer;

    uint32_t windowWidth = 800;
    uint32_t windowHeigh = 600;
    bool closeWindowInitiated = false;

    //QSize sizeHint() const override { return QSize(400,400); }
};

}
#endif  // VKWINDOW_H

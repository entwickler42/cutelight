#include <ccqmlapplication.h>
#include <ccdisplaylight.h>


Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<CCQmlApplication> app(new CCQmlApplication(argc, argv));
    CCDisplayLight displayLight;
    displayLight.setDisplayBrightness(displayLight.maximumDisplayBrightness());

    app->viewer()->rootContext()->setContextProperty("DisplayLight", &displayLight);
    app->viewer()->setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
    app->viewer()->setMainQmlFile(QLatin1String("qml/CuteLight/CuteLight.qml"));
    app->viewer()->showExpanded();

    return app->exec();
}

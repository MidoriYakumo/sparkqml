#include <QtQml>
#include "qmlengine.h"
#include "filewatcher.h"
#include "clipboard.h"
#include "url.h"
#include "fileinfo.h"
#include "qmlfilelistmodel.h"

template <typename T>
static QObject* provider(QQmlEngine *engine, QJSEngine *scriptEngine) {
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    T* object = new T();
    return object;
}

static QObject* engineProvider(QQmlEngine *engine, QJSEngine *scriptEngine) {
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    QmlEngine* object = new QmlEngine();
    object->setEngine(engine);
    return object;
}

Q_DECLARE_METATYPE(QQmlError)

static void registerTypes() {
    qRegisterMetaType<QQmlError>();
    qRegisterMetaType<QList<QQmlError> >();

    qmlRegisterType<FileWatcher>("Spark.sys", 1, 0, "FileWatcher");
    qmlRegisterType<QmlFileListModel>("Spark.sys", 1, 0, "QmlFileListModel");

    qmlRegisterSingletonType<QmlEngine>("Spark.sys", 1, 0, "Engine", engineProvider);
    qmlRegisterSingletonType<Clipboard>("Spark.sys", 1, 0, "Clipboard", provider<Clipboard>);
    qmlRegisterSingletonType<Url>("Spark.sys", 1, 0, "Url", provider<Url>);
    qmlRegisterSingletonType<FileInfo>("Spark.sys", 1, 0, "FileInfo", provider<FileInfo>);

}

Q_COREAPP_STARTUP_FUNCTION(registerTypes)

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "CSVReader.h"
#include <QObject>
#include <QString>

#include "TableViewModel.h"
//#include "/media/oleg/c2593705-a894-489d-b565-859702b4a4b4/oleg/KirichekOI/GitHubRepository/KvantProgTest/KvantProgTest/TableModel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<TableModel>("TableModel", 0, 1, "TableModel");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QList<QObject*> objList = engine.rootObjects();

    CSVReader *csvReader = new CSVReader();
    QObject::connect(engine.rootObjects().first(),SIGNAL(setFileName(QString)),
                     csvReader, SLOT(parseFileName(QString)));

    QObject::connect(csvReader, SIGNAL(renameButton()),
                     engine.rootObjects().first(), SLOT(test()));

    return app.exec();
}

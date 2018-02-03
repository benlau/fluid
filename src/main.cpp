#include <QDir>
#include <QCoreApplication>
#include <QtCore>
#include <QtShell>

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    Q_UNUSED(app);


    QString dist = QtShell::realpath_strip(SRC_PATH, "../dist");

    QtShell::mkdir("-p", dist);

    QString fluidSourcePath =  QtShell::realpath_strip(BUILD_PATH, "../orig/fluid/qml/Fluid");

    QString fluidDestPath = QtShell::realpath_strip(dist, "Fluid");

    QtShell::cp("-av", fluidSourcePath + "/*", fluidDestPath);

    return 0;
}

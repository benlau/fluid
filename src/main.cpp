#include <QDir>
#include <QCoreApplication>
#include <QtCore>
#include <QtShell>
#include "resourcegenerator.h"

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    Q_UNUSED(app);

    // Create Fluid package

    QString dist = QtShell::realpath_strip(SRC_PATH, "../dist");

    QtShell::mkdir("-p", dist);

    QString fluidSourcePath =  QtShell::realpath_strip(BUILD_PATH, "../orig/fluid/qml/Fluid");

    QString fluidDestPath = QtShell::realpath_strip(dist, "Fluid");

    QtShell::cp("-av", fluidSourcePath + "/*", fluidDestPath);

    // Remove unwanted files

    QStringList files = QtShell::find(fluidDestPath);

    QStringList acceptedSuffix;
    QStringList acceptedFileName;

    acceptedFileName << "qmldir";
    acceptedSuffix << "svg" << "qml";
    foreach (auto file, files) {
        QString name = QtShell::basename(file);

        QFileInfo info(file);

        if (info.isDir()) {
            continue;
        }

        if (acceptedFileName.indexOf(name) >= 0) {
            continue;
        }

        if (acceptedSuffix.indexOf(info.suffix()) >= 0) {
            continue;
        }

        QtShell::rm("-v", file);
    }

    // Generate fluid.qrc

    ResourceGenerator generator;
    generator.setRoot(dist);

    generator.scan("/", fluidDestPath);
    generator.save(QtShell::realpath_strip(dist, "fluid.qrc"));

    // Generate fluid.pri
    {
        QString content = QtShell::cat(QtShell::realpath_strip(SRC_PATH, "fluid.pri.tmpl"));

        QFile file(QtShell::realpath_strip(dist, "fluid.pri"));
        file.open(QIODevice::WriteOnly);

        file.write(content.toUtf8());

    }


    return 0;
}

Unofficial Fluid QPM Package
===========================

Installation
------------

```
	qpm install com.github.benlau.fluid
```


Usage
-----

```

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include "iconthemeimageprovider.h"
#include "iconsimageprovider.h"

int main(int argc, char *argv[])
{
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QQuickStyle::setStyle(QLatin1String("Material"));

    QGuiApplication app(argc, argv);
    app.setQuitOnLastWindowClosed(true);

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:///");
    engine.addImageProvider(QLatin1String("fluidicontheme"), new IconThemeImageProvider());
    engine.addImageProvider(QLatin1String("fluidicons"), new IconsImageProvider());

    engine.load(QUrl(QLatin1String("qrc:/qml/main.qml")));

    return app.exec();
}
```

Remarks: Install image provider is needed only for QPM package.


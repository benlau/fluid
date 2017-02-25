import qbs 1.0

DynamicLibrary {
    name: "Fluid.Controls"
    targetName: "fluidcontrols"

    Depends { name: "cpp" }
    Depends { name: "Qt"; submodules: ["gui", "quick"] }

    Group {
        name: "Sources"
        files: [
            "*.cpp",
            "*.h"
        ]
        fileTags: "source"
        overrideTags: false
    }

    Group {
        name: "QML Files"
        files: [
            "*.qml",
            "+material/*.qml",
            "qmldir",
            "plugins.qmltypes"
        ]
        fileTags: "source"
        overrideTags: false
    }
}

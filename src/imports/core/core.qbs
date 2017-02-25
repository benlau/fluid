import qbs 1.0

DynamicLibrary {
    name: "Fluid.Core"
    targetName: "fluidcore"

    Depends { name: "cpp" }
    Depends { name: "Qt"; submodules: ["svg", "gui", "quick"] }
    Depends { name: "libFluid" }

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
            "qmldir",
            "plugins.qmltypes"
        ]
        fileTags: "source"
        overrideTags: false
    }
}

import qbs 1.0

QtApplication {
    name: "tst_core"
    type: ["application", "autotest"]

    Depends { name: "Qt.testlib" }

    Group {
        name: "Sources"
        files: [ "core.cpp" ]
    }
}

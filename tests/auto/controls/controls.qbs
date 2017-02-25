import qbs 1.0

QtApplication {
    name: "tst_controls"
    type: ["application", "autotest"]

    Depends { name: "Qt.testlib" }

    Group {
        name: "Sources"
        files: [ "controls.cpp" ]
    }
}

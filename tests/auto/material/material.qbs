import qbs 1.0

QtApplication {
    name: "tst_material"
    type: ["application", "autotest"]

    Depends { name: "Qt.testlib" }

    Group {
        name: "Sources"
        files: [ "material.cpp" ]
    }
}

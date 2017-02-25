import qbs 1.0

Project {
    name: "Fluid"
    references: [
        "src/fluid/fluid.qbs",
        //"src/imports/core/core.qbs",
        //"src/imports/controls/controls.qbs",
        //"tests/auto/auto.qbs"
    ]

    minimumQbsVersion: "1.7"

    Product {
        name: "qmake project files for fluid"
        files: ["**/*.pr[io]"]
    }
}

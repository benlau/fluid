import qbs 1.0
import qbs.File
import qbs.FileInfo

DynamicLibrary {
    name: "libFluid"
    targetName: "Fluid"

    property string generatedHeadersDir: FileInfo.joinPaths(product.buildDirectory, "include")

    Depends { name: "cpp" }
    Depends { name: "Qt.core" }

    cpp.includePaths: [
        product.sourceDirectory,
        product.generatedHeadersDir
    ]

    Export {
        Depends { name: "cpp" }
        cpp.includePaths: product.sourceDirectory
    }

    Rule {
        inputs: ["public_headers"]

        Artifact {
            filePath: FileInfo.joinPaths(product.generatedHeadersDir, "Fluid", input.fileName)
            fileTags: ["hpp", "exported_headers"]
        }

        prepare: {
            var cmd = new JavaScriptCommand();
            cmd.description = "Copying " + output.fileName + " to build directory";
            cmd.extendedDescription = "Copying " + output.fileName + " to " + output.filePath;
            cmd.highlight = "filegen";
            cmd.sourceCode = function() {
                File.makePath(FileInfo.path(output.filePath));
                File.copy(input.filePath, output.filePath);
            };
            return [cmd];
        }
    }

    Rule {
        name: "ClassHeaders"
        inputs: ["class_headers"]
        outputFileTags: ["hpp", "unmocable"]
        outputArtifacts: {
            var convert = function(txt) {
                return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
            }
            var pascalCase = input.completeBaseName.replace(/\w\S*/g, convert);
            /*
            var pascalCase = input.completeBaseName.replace(/(\w)(\w*)/g,
                    function(g0,g1,g2){return g1.toUpperCase() + g2.toLowerCase();});
                    */
            var artifact = {
                filePath: FileInfo.joinPaths(product.generatedHeadersDir, "Fluid", pascalCase),
                fileTags: ["exported_headers"]
            };
            return [artifact];
        }
        prepare: {
            var cmd = new JavaScriptCommand();
            cmd.description = "Copying " + output.fileName + " to build directory";
            cmd.sourceCode = function() {
                File.makePath(FileInfo.path(output.filePath));
                File.copy(input.filePath, output.filePath);
            };
            return [cmd];
        }
    }

    Group {
        name: "Sources"
        files: ["*.cpp"]
        fileTags: "sources"
        overrideTags: false
    }

    Group {
        name: "Headers"
        files: ["fluidglobal.h"]
        fileTags: "public_headers"
        overrideTags: false
    }

    Group {
        name: "Class Headers"
        files: ["dateutils.h"]
        fileTags: "class_headers"
        overrideTags: false
    }

    Group {
        fileTagsFilter: [
            "dynamiclibrary",
            "dynamiclibrary_symlink",
            "dynamiclibrary_import"
        ]
        qbs.install: true
        qbs.installDir: bundle.isBundle ? "Library/Frameworks" : (qbs.targetOS.contains("windows") ? "" : "lib")
        qbs.installSourceBase: product.buildDirectory
    }
}

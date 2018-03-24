({
    provides: {},
    requires: [
        // { "import-type": "dependency",
        // protocol: "file",
        //     args: ["./repl-lib.arr"]}
        ],
    nativeRequires: ["repl"],
    theModule: function(runtime, _, uri, repl) {

        var gf = runtime.getField;
        // gf(replLib, "restart").app("", false);

        const makeRepl = function(pyretEval, pyretWriter) {
            // console.log(pyretEval)
            // console.log(pyretWriter)

            function myEval(cmd, context, filename, callback) {
                var pyretin = runtime.makeString(cmd);
                var result = pyretEval.app(pyretin);
                // console.log(result)
                // console.log(result)
                // var printable = pyretWriter.app(result);
                // console.log("printable: ", printable);
                // console.log("tojsrepr:", runtime.toReprJS(result))
                callback(null, result);
            }

            function myWriter(output) {
                // console.log(output)
                // console.log(typeof(output))
                return runtime.torepr(output) //pyretWriter.app(output);
            }
            repl.start({eval: myEval, writer: myWriter})
            return runtime.pauseStack(function(restarter) {

            });
        }

        return runtime.makeModuleReturn({
            "make-repl": runtime.makeFunction(makeRepl, "make-repl")
        },
        {});
    }
})

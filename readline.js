({
    requires: [],
    provides: {},
    nativeRequires: ["readline"],
    theModule: function(runtime, _, uri, readline) {

        var lines = [];

        var rl = readline.createInterface(  {
            input: process.stdin,
            output: process.stdout,
            terminal: false
          });

        rl.on('line', (input) => {
            // console.log(`Received: ${input}`);
            lines.push(input);
        });

        function readLine(){
            lines.pop();
        }
        return runtime.makeModuleReturn({
            "read-line": runtime.makeFunction(function() {
            }, "read-line"),
        },
        {});
    }
  })

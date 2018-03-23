var readline = require("readline");
var rl = readline.createInterface(  {
    input: process.stdin,
    output: process.stdout,
    terminal: false
  });

rl.on('line', (input) => {
    console.log(`Received: ${input}`);

});
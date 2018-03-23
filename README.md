# pyret-cli-repl
A basic command line REPL for the [Pyret](https://www.pyret.org/) programming language.

Currently only very basic functionality is working (typing a single line of code into the REPL at a time, then getting the result).

To get it running:
1. clone `pyret-cli-repl`
2. in your `pyret-lang` repository, checkout `SethPoulsen/readline-sync` and build `phaseA`
3. create a symlink to `pyret-lang` inside of `pyret-cli-repl`
4. Use `phaseA` to compile or run `pyret-cli-repl/repl.arr`

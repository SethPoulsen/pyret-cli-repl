import load-lib as L
import runtime-lib as RT
import string-dict as SD
# import either as E
# import pathlib as P
# import file("./pyret-lang/src/arr/compiler/locators/builtin.arr") as B
import file("./pyret-lang/src/arr/compiler/repl.arr") as R
import file("./pyret-lang/src/arr/compiler/compile-structs.arr") as CS
import file("./pyret-lang/src/arr/compiler/cli-module-loader.arr") as CLI
import js-file("./readline") as RL

# print("Running repl-tests: " + tostring(time-now()) + "\n")

# type Either = E.Either

# fun get-run-answer(res):
#   cases(Either) res block:
#     | right(ans) => ans
#     | left(err) =>
#       print-error("Expected an answer, but got compilation errors:")
#       for lists.each(e from err):
#         print-error(tostring(e))
#       end
#   end
# end
# val = lam(str): L.get-result-answer(get-run-answer(str)) end
# msg = lam(str): L.render-error-message(get-run-answer(str)) end

# fun startswith(hay, needle):
#   needle-len = string-length(needle)
#   hay-len = string-length(hay)
#   (needle-len <= hay-len) and
#   string-equal(string-substring(hay, 0, needle-len), needle)
# end

r = RT.make-runtime()

fun println(str): print(str + "\n") end

repl = R.make-repl(r, [SD.mutable-string-dict:], L.empty-realm(), CLI.default-test-context, lam(): CLI.module-finder end)
fun restart(src, type-check):
  i = repl.make-definitions-locator(lam(): src end, CS.standard-globals)
  repl.restart-interactions(i, CS.default-compile-options.{type-check: type-check})
end
fun next-interaction(src):
  i = repl.make-interaction-locator(lam(): src end)
  repl.run-interaction(i)
end

fun run-repl() block:
  print(">")
  input = "wow" #RL.read-line()
  print("\n")
  println(input)
  run-repl()
end

run-repl()
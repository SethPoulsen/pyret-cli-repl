import load-lib as L
import runtime-lib as RT
import string-dict as SD
import either as E
import file("./pyret-lang/src/arr/compiler/repl.arr") as R
import file("./pyret-lang/src/arr/compiler/compile-structs.arr") as CS
import file("./pyret-lang/src/arr/compiler/cli-module-loader.arr") as CLI
# import readline-sync as RL
import js-file("./repl") as RL

type Either = E.Either

fun get-run-answer(res):
  cases(Either) res block:
    | right(ans) => ans
    | left(err) =>
      print-error("Expected an answer, but got compilation errors:")
      for lists.each(e from err):
        print-error(tostring(e))
      end
  end
end

val = lam(str): L.get-result-answer(get-run-answer(str)) end

r = RT.make-runtime()

fun println(str):
  print(str + "\n")
end

repl = R.make-repl(r, [SD.mutable-string-dict:], L.empty-realm(), CLI.default-test-context, lam(): CLI.module-finder end)
fun restart(src, type-check):
  i = repl.make-definitions-locator(lam(): src end, CS.standard-globals)
  repl.restart-interactions(i, CS.default-compile-options.{type-check: type-check})
end

fun next-interaction(src):
  i = repl.make-interaction-locator(lam(): src end)
  repl.run-interaction(i)
  # re = L.get-result-answer(get-run-answer(result))
  # torepr(re)
end

fun make-printable(result):
  v = val(result)
  torepr(v)
end

RL.make-repl(next-interaction, make-printable)
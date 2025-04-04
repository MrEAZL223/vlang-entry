import entry_runtime as runtime
import readline

fn main() {
	for {
		print("\n")
		input := readline.read_line("") or {""}
		code := input.trim_indent()
		if code in ["exit", ""] {
			println("Exiting")
			break
		}

		runtime.go(code)
	}
}
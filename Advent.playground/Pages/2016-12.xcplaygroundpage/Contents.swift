class AssBunnyInt {
    var registers: [String: Int] = ["a": 0, "b": 0, "c": 0, "d": 0]

    func execute(_ instruction: String) {
        let parts = instruction.split(separator: " ").map(String.init)
        switch parts[0] {
        case "cpy":
            let value = Int(parts[1]) ?? registers[parts[1]]!
            registers[parts[2]] = value
        case "inc":
            registers[parts[1]]! += 1
        case "dec":
            registers[parts[1]]! -= 1
        case "jnz":
            let value = Int(parts[1]) ?? registers[parts[1]]!
            if value != 0 {
                curr += (Int(parts[2]) ?? 0) - 1
            }
        default:
            break
        }
    }

    func run(_ program: [String]) {
        while curr < program.count {
            execute(program[curr])
            curr += 1
        }
    }
    private var curr = 0
}

let program = [
    "cpy 1 a",
    "cpy 1 b",
    "cpy 26 d",
    "jnz c 2",
    "jnz 1 5",
    "cpy 7 c",
    "inc d",
    "dec c",
    "jnz c -2",
    "cpy a c",
    "inc a",
    "dec b",
    "jnz b -2",
    "cpy c b",
    "dec d",
    "jnz d -6",
    "cpy 16 c",
    "cpy 12 d",
    "inc a",
    "dec d",
    "jnz d -2",
    "dec c",
    "jnz c -5"
]

let interpreter = AssBunnyInt()
interpreter.run(program)

print(interpreter.registers["a"] as Any)

//DAY 1

/*
func dist(d: String) -> Int {
    let steps = d.split(separator: ", ").map {String($0)}
    var x = 0, y = 0
    var dx = 0, dy = 1

    for step in steps {
        let turn = step.first!
        let blocks = Int(step.dropFirst())!

        if turn == "R" {
            (dx, dy) = (dy, -dx)
        } else {
            (dx, dy) = (-dy, dx)
        }

        x += dx * blocks
        y += dy * blocks
    }

    return abs(x) + abs(y)
}

print(dist(d: "R2, L5, L4, L5, R4, R1, L4, R5, R3, R1, L1, L1, R4, L4, L1, R4, L4, R4, L3, R5, R4, R1, R3, L1, L1, R1, L2, R5, L4, L3, R1, L2, L2, R192, L3, R5, R48, R5, L2, R76, R4, R2, R1, L1, L5, L1, R185, L5, L1, R5, L4, R1, R3, L4, L3, R1, L5, R4, L4, R4, R5, L3, L1, L2, L4, L3, L4, R2, R2, L3, L5, R2, R5, L1, R1, L3, L5, L3, R4, L4, R3, L1, R5, L3, R2, R4, R2, L1, R3, L1, L3, L5, R4, R5, R2, R2, L5, L3, L1, L1, L5, L2, L3, R3, R3, L3, L4, L5, R2, L1, R1, R3, R4, L2, R1, L1, R3, R3, L4, L2, R5, R5, L1, R4, L5, L5, R1, L5, R4, R2, L1, L4, R1, L1, L1, L5, R3, R4, L2, R1, R2, R1, R1, R3, L5, R1, R4"))

 */

//DAY 15

/*
struct Disc {
    let positions: Int
    let initialPosition: Int

    func position(at time: Int) -> Int {
        return (initialPosition + time) % positions
    }
}

func time(discs: [Disc]) -> Int {
    var time = 0
    while true {
        var canPass = true
        for (index, disc) in discs.enumerated() {
            if disc.position(at: time + index + 1) != 0 {
                canPass = false
                break
            }
        }
        if canPass {
            return time
        }
        time += 1
    }
}

var discs = [
    Disc(positions: 7, initialPosition: 0),
    Disc(positions: 13, initialPosition: 0),
    Disc(positions: 3, initialPosition: 2),
    Disc(positions: 5, initialPosition: 2),
    Disc(positions: 17, initialPosition: 0),
    Disc(positions: 19, initialPosition: 7)
]

discs.append(Disc(positions: 11, initialPosition: 0))

let firstTime = time(discs: discs)
print(firstTime)

*/
//DAY 12

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

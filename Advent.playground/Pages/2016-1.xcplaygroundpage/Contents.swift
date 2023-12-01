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

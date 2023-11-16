import Cocoa

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

let discs = [
    Disc(positions: 7, initialPosition: 0),
    Disc(positions: 13, initialPosition: 0),
    Disc(positions: 3, initialPosition: 2),
    Disc(positions: 5, initialPosition: 2),
    Disc(positions: 17, initialPosition: 0),
    Disc(positions: 19, initialPosition: 7)
]

let firstTime = time(discs: discs)
print(firstTime)

import Foundation

func supportsTLS(ip: String) -> Bool {
    func containsABBA(_ s: String) -> Bool {
        for i in 0..<(s.count - 3) {
            let index1 = s.index(s.startIndex, offsetBy: i)
            let index2 = s.index(s.startIndex, offsetBy: i + 1)
            let index3 = s.index(s.startIndex, offsetBy: i + 2)
            let index4 = s.index(s.startIndex, offsetBy: i + 3)
            if s[index1] == s[index4] && s[index2] == s[index3] && s[index1] != s[index2] {
                return true
            }
        }
        return false
    }

    // split IP into hypernet and non hypernet
    let components = ip.split { $0 == "[" || $0 == "]" }
    var hypernets = [String]()
    var nonHypernets = [String]()

    for (index, component) in components.enumerated() {
        if index % 2 == 0 {
            nonHypernets.append(String(component))
        } else {
            hypernets.append(String(component))
        }
    }
    return nonHypernets.contains(where: containsABBA) && !hypernets.contains(where: containsABBA)
}

if let inputFileURL = Bundle.main.url(forResource: "input", withExtension: "txt"),
   let content = try? String(contentsOf: inputFileURL) {
    let ipAddresses = content.components(separatedBy: .newlines)

    let tlsCount = ipAddresses.filter { supportsTLS(ip: $0) }.count
    print("answer is \(tlsCount)")
} else {
    print("no file")
}

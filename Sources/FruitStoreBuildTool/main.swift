import Foundation

let arguments = ProcessInfo().arguments
if arguments.count < 4 {
    print("missing arguments")
}

print("STIIIIIIIIIILLLLLLLFINDDDMMMEEEEE")

let (input, output) = (arguments[1], arguments[3])
var outputURL = URL(fileURLWithPath: output)
var inputURL = URL(fileURLWithPath: input)

var generatedCode = generateHeader()

let fileBase = inputURL.deletingPathExtension().lastPathComponent
let structName = fileBase.capitalized
generatedCode.append(generateStruct(structName: structName))

//let contentsOfInputFile = try String(contentsOf: URL(fileURLWithPath: input)).trimmingCharacters(in: .whitespacesAndNewlines)
//generatedCode.append(generateAddToFruitStore(base:fileBase, structName:structName, itemToAdd: contentsOfInputFile))

let itemsFromFile = try String(contentsOf: URL(fileURLWithPath: input)).split(separator: "\n")
generatedCode.append(generateAddToFruitStore(base:fileBase, structName:structName, itemsToAdd: itemsFromFile))


try generatedCode.write(to: outputURL, atomically: true, encoding: .utf8)

func generateHeader() -> String {
        """
        import Foundation
        
        
        """
}

func generateStruct(structName:some StringProtocol) -> String {
    """
    \n
    struct \(structName):Fruit {
        let name:String
    }
    """
}

func generateAddToFruitStore(base:some StringProtocol, structName:some StringProtocol, itemToAdd: some StringProtocol) -> String {
    """
    
    let \(base) = "\(itemToAdd)"
    func add\(base.capitalized)() {
        FruitStore["\(base)"] = [ \(structName)(name:"\\(\(base))")]
    }
    """
}

func generateAddToFruitStore(base:some StringProtocol, structName:some StringProtocol, itemsToAdd: [some StringProtocol]) -> String {
    let initStrings = itemsToAdd.map { "\(structName)(name:\"\($0.capitalized)\")" }
    let fruitArrayCode = "[\(initStrings.joined(separator: ","))]"
    let insertCode = """
        FruitStore["\(base)"] = \(fruitArrayCode)
    """
    return """
    
    let \(base) = "\(itemsToAdd.randomElement() ?? "No items in list")"
    func add\(base.capitalized)() {
         \(insertCode)
    }
    """
}


//MARK: Old Prints Farm


//Added for ease of scanning for our output.
//print("FIIIIIIIIIIIIIINNNNNNNNNDDDMMMEEEEEEEEEEEEEEEEE")
//print("from MyBuildPluginTool:", input)
//print("from MyBuildPluginTool:", output)

// print("ARGUMENTS")

// arguments.forEach {
//     print($0)
// }

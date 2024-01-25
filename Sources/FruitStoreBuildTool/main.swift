import Foundation

let arguments = ProcessInfo().arguments
if arguments.count < 4 {
    print("missing arguments")
}

// print("ARGUMENTS")

// arguments.forEach {
//     print($0)
// }

let (input, output) = (arguments[1], arguments[3])

//Added for ease of scanning for our output.
print("FIIIIIIIIIIIIIINNNNNNNNNDDDMMMEEEEEEEEEEEEEEEEE")
print("from MyBuildPluginTool:", input)
print("from MyBuildPluginTool:", output)
var outputURL = URL(fileURLWithPath: output)

let contentsOfInputFile = try String(contentsOf: URL(fileURLWithPath: input))
let contentsOfFile = contentsOfInputFile

try contentsOfFile.write(to: outputURL, atomically: true, encoding: .utf8)


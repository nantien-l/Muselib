// Run from the repository root: swift scripts/import-instruments.swift
// Preserve the complete supplied photograph, including details and watermarks.
import Foundation
import CoreGraphics
import ImageIO
import UniformTypeIdentifiers

let root = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let inbox = root.appendingPathComponent("Assets/PhotoInbox")
let catalog = root.appendingPathComponent("Muselib/Assets.xcassets")
let knownNames: Set<String> = ["violin-david-heifetz", "violin-ex-mintz", "violin-lord-dunn-raven", "violin-marquis-de-riviere", "violin-marsick", "violin-panette", "violin-soil", "violin-thunis", "violin-ysaye", "violin-milanollo", "bow-auer-heifetz", "bow-ysaye-stern-tourte", "bow-choi-sartory", "bow-choi-ouchard", "bow-perlman-henry", "bow-oistrakh-richaume", "bow-oistrakh-nurnberger", "bow-ysaye-sartory"]
for file in try FileManager.default.contentsOfDirectory(at: inbox, includingPropertiesForKeys: nil).sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
    let name = file.deletingPathExtension().lastPathComponent
    guard knownNames.contains(name) else { continue }
    guard let source = CGImageSourceCreateWithURL(file as CFURL, nil), let image = CGImageSourceCreateThumbnailAtIndex(source, 0, [kCGImageSourceCreateThumbnailFromImageAlways: true, kCGImageSourceCreateThumbnailWithTransform: true, kCGImageSourceThumbnailMaxPixelSize: 1600] as CFDictionary) else {
        fatalError("Cannot read \(file.path)")
    }
    let context = CGContext(data: nil, width: image.width, height: image.height, bitsPerComponent: 8, bytesPerRow: 0, space: CGColorSpace(name: CGColorSpace.sRGB)!, bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)!
    context.setFillColor(CGColor(gray: 1, alpha: 1))
    context.fill(CGRect(x: 0, y: 0, width: image.width, height: image.height))
    context.draw(image, in: CGRect(x: 0, y: 0, width: image.width, height: image.height))
    let folder = catalog.appendingPathComponent("\(name).imageset")
    try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
    let filename = name + ".jpg"
    let destination = CGImageDestinationCreateWithURL(folder.appendingPathComponent(filename) as CFURL, UTType.jpeg.identifier as CFString, 1, nil)!
    CGImageDestinationAddImage(destination, context.makeImage()!, [kCGImageDestinationLossyCompressionQuality: 0.9] as CFDictionary)
    precondition(CGImageDestinationFinalize(destination))
    let contents: [String: Any] = ["images": [["filename": filename, "idiom": "universal"]], "info": ["author": "xcode", "version": 1]]
    try JSONSerialization.data(withJSONObject: contents, options: [.prettyPrinted, .sortedKeys]).write(to: folder.appendingPathComponent("Contents.json"))
    print("\(name): \(image.width) × \(image.height)")
}

// Run from the repository root: swift scripts/import-portraits.swift
// Normalizes orientation and sRGB, preserves originals, and uses reviewed crops.
import AppKit
import ImageIO
import UniformTypeIdentifiers

struct Crop {
    let heroX: Double
    let heroY: Double
    let thumbnailX: Double
    let thumbnailY: Double
}
let crops: [String: Crop] = [
    "composer-bach": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-vivaldi": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-paganini": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-mendelssohn": Crop(heroX: 0.5, heroY: 0.15, thumbnailX: 0.5, thumbnailY: 0.1),
    "composer-wieniawski": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-tchaikovsky": Crop(heroX: 0.5, heroY: 0.1, thumbnailX: 0.5, thumbnailY: 0),
    "composer-franck": Crop(heroX: 0.5, heroY: 0.15, thumbnailX: 0.5, thumbnailY: 0.05),
    "composer-sibelius": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "portrait-soobeen-lee": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "portrait-anna-im": Crop(heroX: 0.5, heroY: 0.48, thumbnailX: 0.45, thumbnailY: 0.35),
    // Composer crops reviewed against the supplied photographs and painting.
    "composer-vasks": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-beethoven": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-brahms": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-ravel": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-debussy": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-prokofiev": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-shostakovich": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-bartok": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-szymanowski": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-chausson": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "composer-dvorak": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "portrait-anne-sophie-mutter": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.3, thumbnailY: 0),
    "portrait-bohdan-luts": Crop(heroX: 0.5, heroY: 0.05, thumbnailX: 0.5, thumbnailY: 0),
    "portrait-christian-ferras": Crop(heroX: 0.5, heroY: 0.02, thumbnailX: 0.5, thumbnailY: 0.02),
    "portrait-clara-jumi-kang": Crop(heroX: 0.5, heroY: 0.4, thumbnailX: 0.5, thumbnailY: 0.3),
    "portrait-david-oistrakh": Crop(heroX: 0.5, heroY: 0.5, thumbnailX: 0.4, thumbnailY: 0.5),
    "portrait-eugene-ysaye": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.15, thumbnailY: 0),
    "portrait-isaac-stern": Crop(heroX: 0.5, heroY: 0.5, thumbnailX: 0.3, thumbnailY: 0.5),
    "portrait-itzhak-perlman": Crop(heroX: 0.5, heroY: 0, thumbnailX: 0.5, thumbnailY: 0),
    "portrait-jascha-heifetz": Crop(heroX: 0.5, heroY: 0.03, thumbnailX: 0.5, thumbnailY: 0),
    "portrait-jooha-choi": Crop(heroX: 0.5, heroY: 0.08, thumbnailX: 0.5, thumbnailY: 0)
]
let root = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let inbox = root.appendingPathComponent("Assets/PhotoInbox")
let catalog = root.appendingPathComponent("Muselib/Assets.xcassets")
let colorSpace = CGColorSpace(name: CGColorSpace.sRGB)!

func export(_ image: CGImage, name: String, ratio: Double, x: Double, y: Double, maxWidth: Int) throws {
    let width = Double(image.width), height = Double(image.height)
    let cropWidth = min(width, height * ratio)
    let cropHeight = cropWidth / ratio
    let rect = CGRect(x: (width-cropWidth)*x, y: (height-cropHeight)*y, width: cropWidth, height: cropHeight).integral
    guard let cropped = image.cropping(to: rect) else { fatalError("Cannot crop \(name)") }
    // Do not upscale small source files. Four-pixel units keep 4:3 output exact.
    let preservePortrait = ratio != 1 && ["portrait-christian-ferras", "portrait-itzhak-perlman", "composer-brahms", "composer-vivaldi", "composer-paganini", "composer-wieniawski"].contains(name)
    let canvasWidth = preservePortrait ? max(width, height * ratio) : cropWidth
    let outputWidth = max(4, min(maxWidth, Int(canvasWidth)) / 4 * 4)
    let outputHeight = Int(Double(outputWidth) / ratio)
    let context = CGContext(data: nil, width: outputWidth, height: outputHeight, bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)!
    context.setFillColor(CGColor(gray: preservePortrait ? 0 : 1, alpha: 1))
    context.fill(CGRect(x: 0,y: 0,width: outputWidth,height: outputHeight))
    context.interpolationQuality = .high
    if preservePortrait {
        // Preserve close faces and painted instruments/hands instead of cropping them away.
        let scale = min(Double(outputWidth)/width, Double(outputHeight)/height)
        let drawWidth = width*scale, drawHeight = height*scale
        context.draw(image, in: CGRect(x: (Double(outputWidth)-drawWidth)/2, y: (Double(outputHeight)-drawHeight)/2, width: drawWidth, height: drawHeight))
    } else {
        context.draw(cropped, in: CGRect(x: 0,y: 0,width: outputWidth,height: outputHeight))
    }
    let folder = catalog.appendingPathComponent("\(name).imageset")
    try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
    let filename = "\(name).jpg"
    let destination = CGImageDestinationCreateWithURL(folder.appendingPathComponent(filename) as CFURL, UTType.jpeg.identifier as CFString, 1, nil)!
    CGImageDestinationAddImage(destination, context.makeImage()!, [kCGImageDestinationLossyCompressionQuality: 0.88] as CFDictionary)
    guard CGImageDestinationFinalize(destination) else { fatalError("Cannot export \(name)") }
    let contents: [String: Any] = ["images": [["filename": filename, "idiom": "universal"]], "info": ["author": "xcode", "version": 1]]
    try JSONSerialization.data(withJSONObject: contents, options: [.prettyPrinted, .sortedKeys]).write(to: folder.appendingPathComponent("Contents.json"))
    print("\(name): \(outputWidth) × \(outputHeight)")
}

for file in try FileManager.default.contentsOfDirectory(at: inbox, includingPropertiesForKeys: nil).sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
    // Downloads can retain a double extension, e.g. composer-brahms.jpg.avif.
    let imageExtensions = Set(["jpg", "jpeg", "png", "avif", "webp", "heic", "tif", "tiff"])
    var stem = file
    while imageExtensions.contains(stem.pathExtension.lowercased()) {
        stem = stem.deletingPathExtension()
    }
    let name = stem.lastPathComponent
    guard let crop = crops[name] else { continue }
    guard let source = CGImageSourceCreateWithURL(file as CFURL, nil),
          let image = CGImageSourceCreateThumbnailAtIndex(source, 0, [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceThumbnailMaxPixelSize: 8000
          ] as CFDictionary) else { fatalError("Cannot read \(file.path)") }
    try export(image, name: name, ratio: 4.0/3.0, x: crop.heroX, y: crop.heroY, maxWidth: 1600)
    try export(image, name: name + "-thumbnail", ratio: 1, x: crop.thumbnailX, y: crop.thumbnailY, maxWidth: 360)
}

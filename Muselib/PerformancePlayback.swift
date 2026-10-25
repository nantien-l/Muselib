import Foundation

/// A verified performance video. A nil start time opens the dedicated video
/// from the beginning; timestamps are only stored when explicitly confirmed.
struct PerformancePlayback {
    let videoID: String
    let publisher: String
    var startSeconds: Int? = nil
    var sourceURL: URL? = nil

    var url: URL {
        if let sourceURL { return sourceURL }
        var components = URLComponents(string: "https://www.youtube.com/watch")!
        var query = [URLQueryItem(name: "v", value: videoID)]
        if let startSeconds {
            query.append(URLQueryItem(name: "t", value: "\(startSeconds)s"))
        }
        components.queryItems = query
        return components.url!
    }

    var startTimeLabel: String? {
        guard let startSeconds else { return nil }
        return String(format: "%d:%02d", startSeconds / 60, startSeconds % 60)
    }
}

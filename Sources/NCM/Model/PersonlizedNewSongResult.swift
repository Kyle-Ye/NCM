import Foundation

public struct PersonlizedNewSongResult: Codable {
    public let hasTaste: Bool
    public let code: Int
    public let category: Int
    public let result: [Song]
}

public struct Song: Codable {
    public let id: String
    public let name: String
    public let copyWriter: String
    public let picUrl: URL
}

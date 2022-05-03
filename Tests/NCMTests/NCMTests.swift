import XCTest
@testable import NCM

// git clone git@github.com:Binaryify/NeteaseCloudMusicApi.git
// cd NeteaseCloudMusicApi
// npm install && node app.js
final class NCMTests: XCTestCase {
    let client = Client(host: "http://localhost:3000")!

//    func testRecommend() async throws {
//        let result = try await client.personalizedNewSong()
//        XCTAssertTrue(!result.isEmpty)
//    }
//
    func testLyric() async throws {
        let result = try await client.lyric(id: 33894312)
        XCTAssertTrue(!result.isEmpty)
    }
}

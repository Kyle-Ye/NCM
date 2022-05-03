import Foundation
public struct Client {
    let host: String

    /// Init a NeteaseCloudMusic API Client
    /// - Parameter host: The host of the API client, default value is "http://localhost:3000"
    /// Fail if the host is not a valid url
    public init?(host: String = "http://localhost:3000") {
        guard let _ = URL(string: host) else {
            return nil
        }
        self.host = host
    }
}

extension Client {
    /// 推荐新音乐
    /// 说明 : 调用此接口 , 可获取推荐新音乐
    /// 可选参数 : limit: 取出数量 , 默认为 10 (不支持 offset)
    /// 接口地址 : /personalized/newsong
    /// 调用例子 : /personalized/newsong
    public func personalizedNewSong(limit: Int = 10) async throws -> PersonlizedNewSongResult {
        try await Client.result(PersonlizedNewSongResult.self, from: "\(host)/personalized/newsong?limit=\(limit)")
    }

    /// 获取歌词
    /// 说明 : 调用此接口 , 传入音乐 id 可获得对应音乐的歌词 ( 不需要登录 )
    /// 必选参数 : id: 音乐 id
    /// 接口地址 : /lyric
    /// 调用例子 : /lyric?id=33894312
    public func lyric(id: Int) async throws -> String {
        try await lyric(id: String(id))
    }

    /// 获取歌词
    /// 说明 : 调用此接口 , 传入音乐 id 可获得对应音乐的歌词 ( 不需要登录 )
    /// 必选参数 : id: 音乐 id
    /// 接口地址 : /lyric
    /// 调用例子 : /lyric?id=33894312
    public func lyric(id: String) async throws -> String {
        try await Client.result(String.self, from: "\(host)/lyric?id=\(id)")
    }
}

extension Client {
    fileprivate enum ClientError: Error {
        case invalidRequestString(String)
    }

    fileprivate static func result<T>(_ type: T.Type, from requestString: String) async throws -> T where T: Decodable {
        guard let url = URL(string: requestString) else {
            throw ClientError.invalidRequestString(requestString)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(type, from: data)
    }
}

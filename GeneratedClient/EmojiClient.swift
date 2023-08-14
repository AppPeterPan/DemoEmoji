//
//  EmojiClient.swift
//  GeneratedClient
//
//  Created by Peter Pan on 2023/8/14.
//

import OpenAPIURLSession



public struct EmojiClient {

    let apiKey = "9c082d35012ea20e30e76273a49b18b9cf1cd8c0"
    let client = Client(
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport()
    )
    
    public init() {}

    public func searchEmojis(search: String) async throws -> [Components.Schemas.Emoji] {
       
        let response = try await client.searchEmojis(
            .init(query: .init(search: search, access_key: apiKey))
        )
        switch response {
        case .ok(let okResponse):
            switch okResponse.body {
            case .json(let emojis):
                return emojis
            }
        case .undocumented(statusCode: let statusCode, _):
            print(statusCode)
            return []
        }
    }
    
    public func getCategories() async throws -> [Components.Schemas.Category] {
        let response = try await client.getCategories(
            .init(query: .init(access_key: apiKey))
        )
        switch response {
        case .ok(let okResponse):
            switch okResponse.body {
            case .json(let categories):
                return categories
            }
        case .undocumented(statusCode: let statusCode, _):
            print(statusCode)
            return []
        }
    }
}

//
//  PeachagramApp.swift
//  Peachagram
//
//  Created by Soufian Hossam on 13/12/2022.
//

import SwiftUI
import Firebase

@main
struct PeachagramApp: App {
    
    init() {
        FirebaseApp.configure()
        NetworkingManager().setup()
        parse()
    }
    
    var body: some Scene {
        WindowGroup {
            FeedView(viewModel: FeedViewModel())
        }
    }
    
    func parse() {
        let json = """
{
  "documents": [
    {
      "name": "projects/peach-assessment/databases/(default)/documents/posts/5WYEjtIpIBnS8aOLeyig",
      "fields": {
        "mediaType": {
          "stringValue": "video"
        },
        "comments": {
          "arrayValue": {
            "values": [
              {
                "stringValue": "That looks like literal paradise"
              },
              {
                "stringValue": "The only thing I can surf is the web, but very cool"
              }
            ]
          }
        },
        "createdAt": {
          "timestampValue": "2022-11-24T05:38:40.786768Z"
        },
        "authorID": {
          "stringValue": "nkhuJqVWcnB0Rjm0IOA3"
        },
        "storageRef": {
          "stringValue": "nkhuJqVWcnB0Rjm0IOA3/5WYEjtIpIBnS8aOLeyig"
        },
        "caption": {
          "stringValue": "Surfers at sunset just outside of town! Morro Bay, CA"
        },
        "id": {
          "stringValue": "5WYEjtIpIBnS8aOLeyig"
        }
      },
      "createTime": "2022-11-24T05:39:00.342966Z",
      "updateTime": "2022-11-24T05:39:00.342966Z"
    }
]
}
""".data(using: .utf8)!
        
        let json2 = """
{
  "documents": [
    {
      "name": "projects/peach-assessment/databases/(default)/documents/users/IR942k6vHX9HlvnZyqhB",
      "fields": {
        "username": {
          "stringValue": "mike.gants"
        },
        "email": {
          "stringValue": "mike@peach.com"
        }
      },
      "createTime": "2022-11-22T08:03:55.248142Z",
      "updateTime": "2022-11-22T08:03:55.248142Z"
    },
    {
      "name": "projects/peach-assessment/databases/(default)/documents/users/NEiFSfRshs7sIFVEtEQ9",
      "fields": {
        "username": {
          "stringValue": "junaid.jav"
        },
        "email": {
          "stringValue": "junaid@peach.com"
        }
      },
      "createTime": "2022-11-24T05:22:34.339486Z",
      "updateTime": "2022-11-24T05:22:51.352243Z"
    },
    {
      "name": "projects/peach-assessment/databases/(default)/documents/users/nkhuJqVWcnB0Rjm0IOA3",
      "fields": {
        "email": {
          "stringValue": "ryan@peach.com"
        },
        "username": {
          "stringValue": "ryan.long"
        }
      },
      "createTime": "2022-11-22T08:03:26.003218Z",
      "updateTime": "2022-11-22T08:03:34.652599Z"
    }
  ]
}
""".data(using: .utf8)!
        
        let response = try! JSONDecoder.defaultDecoder.decode(Response<PostFields>.self, from: json)
        let posts: [Post] = response.documents.map(Post.init)
        print(posts)
        
        let response2 = try! JSONDecoder.defaultDecoder.decode(Response<UserFields>.self, from: json2)
        let users: [User] = response2.documents.map(User.init)
        print(users)
    }
}

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
        "createdAt": {
          "timestampValue": "2022-11-24T05:38:40.786768Z"
        },
        "caption": {
          "stringValue": "Surfers at sunset just outside of town! Morro Bay, CA"
        },
        "storageRef": {
          "stringValue": "nkhuJqVWcnB0Rjm0IOA3/5WYEjtIpIBnS8aOLeyig"
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
        "id": {
          "stringValue": "5WYEjtIpIBnS8aOLeyig"
        },
        "mediaType": {
          "stringValue": "video"
        },
        "authorID": {
          "stringValue": "nkhuJqVWcnB0Rjm0IOA3"
        }
      },
      "createTime": "2022-11-24T05:39:00.342966Z",
      "updateTime": "2022-11-24T05:39:00.342966Z"
    },
    {
      "name": "projects/peach-assessment/databases/(default)/documents/posts/5llHGnixjuwLK6b02Rt9",
      "fields": {
        "comments": {
          "arrayValue": {
            "values": [
              {
                "stringValue": "Such a pretty view!"
              },
              {
                "stringValue": "Thanks for sharing"
              },
              {
                "stringValue": "So pretty"
              }
            ]
          }
        },
        "createdAt": {
          "timestampValue": "2022-11-24T05:30:28.000679Z"
        },
        "authorID": {
          "stringValue": "IR942k6vHX9HlvnZyqhB"
        },
        "id": {
          "stringValue": "5llHGnixjuwLK6b02Rt9"
        },
        "caption": {
          "stringValue": "Best day ever!"
        },
        "mediaType": {
          "stringValue": "photo"
        },
        "storageRef": {
          "stringValue": "IR942k6vHX9HlvnZyqhB/5llHGnixjuwLK6b02Rt9"
        }
      },
      "createTime": "2022-11-24T05:30:31.751356Z",
      "updateTime": "2022-11-24T05:30:31.751356Z"
    },
    {
      "name": "projects/peach-assessment/databases/(default)/documents/posts/9Gh48fyb6gVeY7cn2ITA",
      "fields": {
        "storageRef": {
          "stringValue": "NEiFSfRshs7sIFVEtEQ9/9Gh48fyb6gVeY7cn2ITA"
        },
        "createdAt": {
          "timestampValue": "2022-11-24T05:40:52.218831Z"
        },
        "mediaType": {
          "stringValue": "photo"
        },
        "id": {
          "stringValue": "9Gh48fyb6gVeY7cn2ITA"
        },
        "authorID": {
          "stringValue": "NEiFSfRshs7sIFVEtEQ9"
        },
        "caption": {
          "stringValue": "Tekkers en la playa (soccer on the beach)"
        },
        "comments": {
          "arrayValue": {
            "values": [
              {
                "stringValue": "That's such a beautiful view man"
              },
              {
                "stringValue": "the beautiful game in a beautiful place!"
              }
            ]
          }
        }
      },
      "createTime": "2022-11-24T05:40:56.283171Z",
      "updateTime": "2022-11-24T05:40:56.283171Z"
    },
    {
      "name": "projects/peach-assessment/databases/(default)/documents/posts/QINf6nAkNwhCjp7L7pCH",
      "fields": {
        "storageRef": {
          "stringValue": "nkhuJqVWcnB0Rjm0IOA3/QINf6nAkNwhCjp7L7pCH"
        },
        "createdAt": {
          "timestampValue": "2022-11-24T05:32:49.564917Z"
        },
        "authorID": {
          "stringValue": "nkhuJqVWcnB0Rjm0IOA3"
        },
        "mediaType": {
          "stringValue": "photo"
        },
        "caption": {
          "stringValue": "Campus at sunset"
        },
        "comments": {
          "arrayValue": {
            "values": [
              {
                "stringValue": "WOWOW"
              },
              {
                "stringValue": "omg, that's breathtaking"
              }
            ]
          }
        },
        "id": {
          "stringValue": "QINf6nAkNwhCjp7L7pCH"
        }
      },
      "createTime": "2022-11-24T05:32:52.882919Z",
      "updateTime": "2022-11-24T05:32:52.882919Z"
    },
    {
      "name": "projects/peach-assessment/databases/(default)/documents/posts/hloX1IVK0YFmilEkiDja",
      "fields": {
        "storageRef": {
          "stringValue": "IR942k6vHX9HlvnZyqhB/hloX1IVK0YFmilEkiDja"
        },
        "id": {
          "stringValue": "hloX1IVK0YFmilEkiDja"
        },
        "caption": {
          "stringValue": "Dinner with a view."
        },
        "mediaType": {
          "stringValue": "video"
        },
        "comments": {
          "arrayValue": {}
        },
        "createdAt": {
          "timestampValue": "2022-11-24T05:43:24.303226Z"
        },
        "authorID": {
          "stringValue": "IR942k6vHX9HlvnZyqhB"
        }
      },
      "createTime": "2022-11-24T05:43:35.443457Z",
      "updateTime": "2022-11-24T05:43:35.443457Z"
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
//        print(posts)
        
        let response2 = try! JSONDecoder.defaultDecoder.decode(Response<UserFields>.self, from: json2)
        let users: [User] = response2.documents.map(User.init)
//        print(users)
    }
}

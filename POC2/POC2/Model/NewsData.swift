//
//  ItemCategories.swift
//  POC2
//
//  Created by Suraj Sagare on 17/09/18.
//  Copyright © 2018 Suraj Sagare. All rights reserved.
//

import Gloss
public struct News: Glossy
{
    public var status: String!
    public var copyright: String!
    public var results: [Results]!
    
    public init?(json: JSON)
    {
        if let status: String = "status" <~~ json {
            self.status = status
        } else {
            self.status = ""
        }
        
        if let copyright: String = "copyright" <~~ json {
            self.copyright = copyright
        } else {
            self.copyright = ""
        }
        
        self.results = "results" <~~ json
        
    }
    
    public func toJSON() -> JSON? {
        return jsonify([
            "status" ~~> self.status,
            "copyright" ~~> self.copyright,
            "results" ~~> self.results
            ])
    }
}
public struct Results: Glossy
{
    public var url: String!
    public var title: String!
    public var abstract: String!
    public var published_date: String!
    public var byline: String!
    public var mediaArray: [Media]!

    public init?(json: JSON)
    {
        if let url: String = "url" <~~ json {
            self.url = url
        } else {
            self.url = ""
        }
        
        if let title: String = "title" <~~ json {
            self.title = title
        } else {
            self.title = ""
        }
        
        if let abstract: String = "abstract" <~~ json {
            self.abstract = abstract
        } else {
            self.abstract = ""
        }
        
        if let published_date: String = "published_date" <~~ json {
            self.published_date = published_date
        } else {
            self.published_date = ""
        }
        
        if let byline: String = "byline" <~~ json {
            self.byline = byline
        } else {
            self.byline = ""
        }
        
        self.mediaArray = "media" <~~ json
        
    }

    public func toJSON() -> JSON? {
        return jsonify([
            "url" ~~> self.url,
            "title" ~~> self.title,
            "abstract" ~~> self.abstract,
            "published_date" ~~> self.published_date,
            "byline" ~~> self.byline,
            "media" ~~> self.mediaArray
            ])
    }
}

public struct Media: Glossy
{
    public var type: String!
    public var subtype: String!
    public var caption: String!
    public var copyright: String!
    public var mediaMetadataArray: [MediaMetaData]!

    public init?(json: JSON)
    {
        if let type: String = "type" <~~ json {
            self.type = type
        } else {
            self.type = ""
        }

        if let subtype: String = "subtype" <~~ json {
            self.subtype = subtype
        } else {
            self.subtype = ""
        }

        if let caption: String = "caption" <~~ json {
            self.caption = caption
        } else {
            self.caption = ""
        }

        if let copyright: String = "copyright" <~~ json {
            self.copyright = copyright
        } else {
            self.copyright = ""
        }
        
        self.mediaMetadataArray = "media-metadata" <~~ json

    }

    public func toJSON() -> JSON? {
        return jsonify([
            "type" ~~> self.type,
            "subtype" ~~> self.subtype,
            "caption" ~~> self.caption,
            "copyright" ~~> self.copyright,
            "media-metadata" ~~> self.mediaMetadataArray
            ])
    }
}

public struct MediaMetaData: Glossy
{
    public var url: String!
    public var format: String!
    
    public init?(json: JSON)
    {
        if let url: String = "url" <~~ json {
            self.url = url
        } else {
            self.url = ""
        }
        
        if let format: String = "format" <~~ json {
            self.format = format
        } else {
            self.format = ""
        }
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "url" ~~> self.url,
            "format" ~~> self.format
            ])
    }
}


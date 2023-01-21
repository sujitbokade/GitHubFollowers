//
//  ErrorMessages.swift
//  GitHubFollowers
//
//  Created by Macbook on 13/01/23.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername  = "This Username created Invalid Request,try again"
    case unableToComplete = "Unable to Complete your request, please check your internet connection."
    case invalidResponse  = "Invalid response from server , try again"
    case invalidData      = "Data from server is Invalid, try again"
    case unableToFavorite = "There was an error favoriting this error, plz try again"
    case alreadyInFavorites = "You have already favorites this user "
}

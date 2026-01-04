//
//  SupabaseClient.swift
//  UltraTracker
//
//  Created by Marcus Miller on 1/2/26.
//

// get URL to plist file

import Foundation
import Supabase

func createSupabaseClient() -> SupabaseClient {
    // 1. get plist URL
    guard let url = Bundle.main.url(forResource: "Config", withExtension: "plist") else {
            fatalError("Config.plist not found")
        }
    // 2. load plist as dictionary
    guard let dict = NSDictionary(contentsOf: url) else {
            fatalError("Could not load Config.plist")
        }
    // 3. extract SupabaseURL and SupabaseAnonKey
    guard let supabaseURLString = dict["SupabaseURL"] as? String,
              let supabaseKey = dict["SupabaseAnonKey"] as? String else {
            fatalError("Missing keys in Config.plist")
        }
    // 4. create Supabase client with those values
    guard let supabaseURL = URL(string: supabaseURLString) else {
            fatalError("Invalid Supabase URL")
        }
    // 5. return the client
    return SupabaseClient(supabaseURL: supabaseURL, supabaseKey: supabaseKey)
}

class SupabaseManager{
    static let shared = SupabaseManager()
    let clinet: SupabaseClient
    
    private init(){
        self.clinet = createSupabaseClient()
    }
}

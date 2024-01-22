//
//  YoutubeViewModel.swift
//  MediumYoutube
//
//  Created by Omer on 22.01.2024.
//

import Foundation
import YouTubeiOSPlayerHelper

typealias CallBack<T> = ((T) -> Void)
final class YoutubeViewModel {
    
    var callbackAlert:CallBack<(String,String)>?
    var callbackLoadVideo:CallBack<String>?
     
    func getYoutubeID (url:String) -> String {
     
        let regexPattern = #"^(?:(?:https?:)?\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})"#

           do {
               let regex = try NSRegularExpression(pattern: regexPattern, options: .caseInsensitive)
               let string = url
               let range = NSRange(location: 0, length: string.utf16.count)

               if let match = regex.firstMatch(in: string, options: [], range: range) {
                   let idRange = Range(match.range(at: 1), in: string)!
                   let id = String(string[idRange])
              
                   return id
               } else {
                   return ""
               }
           } catch {
               print("Error creating regex: \(error)")
               return ""
           }
      
    }

       
    func loadVideo(url:String) {
        
        let id =  getYoutubeID(url: url)
           
           if id.isEmpty == false {
        
               callbackLoadVideo?(id)
           }else{
               callbackAlert?(("Invalid URL","Please enter valid URL"))
             
           }
       
    }
        
}
    


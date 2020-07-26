//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Fazakas Loránd on 2020. 07. 26..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}

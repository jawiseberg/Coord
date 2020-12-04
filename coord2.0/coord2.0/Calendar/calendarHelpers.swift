//
//  calendarHelpers.swift
//  Coord
//
//  Created by Takoda Denhof on 11/28/20.
//

import Foundation
import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        
    }
    
    
}
struct SecondaryCaptionTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.secondary)
    }
}


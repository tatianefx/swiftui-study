//
//  DiceView.swift
//  DiceeGame
//
//  Created by Tatiane Silva on 30/08/23.
//

import SwiftUI

struct DiceView: View {
    
    let value: DiceNumber
    
    var body: some View {
        Image("dice\(value.rawValue)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(value: .one)
            .previewLayout(.sizeThatFits)
    }
}

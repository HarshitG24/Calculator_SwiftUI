//
//  ShowText.swift
//  CalculatorApp
//
//  Created by Harshit Gajjar on 5/16/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct ShowText: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(Color("digittxt"))
            .fontWeight(.heavy)
            .font(.system(size: 40))
    }
}

struct ShowText_Previews: PreviewProvider {
    static var previews: some View {
        ShowText(text: "Harshit")
            .previewLayout(.sizeThatFits)
    }
}

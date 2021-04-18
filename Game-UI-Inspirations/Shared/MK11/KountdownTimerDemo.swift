//
//  KountdownTimerDemo.swift
//
//  Created by nutterfi on 3/11/21.
//

import SwiftUI

struct KountdownTimerDemo: View {
    var body: some View {
      VStack {
        KountdownTimerView()
          .frame(width: 100)
        KountdownTimerView()
          .frame(width: 200)
        KountdownTimerView()
          .frame(width: 50)
        KountdownTimerView()
      }
    }
}

struct CountdownTimerDemo_Previews: PreviewProvider {
    static var previews: some View {
      KountdownTimerDemo()
    }
}

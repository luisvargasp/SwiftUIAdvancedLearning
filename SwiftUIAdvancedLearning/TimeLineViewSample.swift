//
//  TimeLineViewSample.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 29/05/25.
//

import SwiftUI

struct TimeLineViewSample: View {
    var body: some View {
        VStack{
            TimelineView(.animation(minimumInterval :1)){
                context in
                let seconds = Calendar.current.component(.second, from: context.date)
                Text("\(context.date)")
                Rectangle()
                    .frame(
                        width : seconds < 10 ?  50 : seconds < 30 ?   200 : 400 ,
                           height : 100
                    ).animation(.bouncy, value: seconds)
            }
        }
    }
}

#Preview {
    TimeLineViewSample()
}

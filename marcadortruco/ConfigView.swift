//
//  ConfigView.swift
//  marcadortruco
//
//  Created by Gabriel on 25/12/2022
//

import SwiftUI

struct ConfigView: View {
    @EnvironmentObject var dadosTimes: DadosTimes
    var body: some View {
        ZStack{
            Color("FundoVerde")
                .ignoresSafeArea()
            VStack{
                Button("Mudar Nome"){
                    //times.times[0].nome = "Nome mudou"
                    print(dadosTimes.a_nome)
                }
            }
        }
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}

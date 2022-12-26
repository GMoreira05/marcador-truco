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
                Form{
                    Section(header: Text("Equipes")){
                        TextField("Equipe 1", text: $dadosTimes.a_nome)
                        TextField("Equipe 2", text: $dadosTimes.b_nome)
                    }
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

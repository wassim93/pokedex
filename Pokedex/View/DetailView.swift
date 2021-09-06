//
//  DetailView.swift
//  Pokedex
//
//  Created by wassim on 6/9/2021.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    let pokemon: Pokemon
    let pvModel :PokemonViewModel
    let backgroudColor:Color
    
    
    init(pokemon:Pokemon , viewModel :PokemonViewModel) {
        self.pokemon = pokemon
        self.pvModel =  viewModel
        self.backgroudColor =  Color(pvModel.backgroundColor(forType: pokemon.type))
        
    }

    var body: some View {
            ZStack{
                backgroudColor.ignoresSafeArea()
                VStack(alignment: .center,spacing:10){
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width:170,height: 150)
                        .padding(.top,90)
                    
                    VStack(spacing:10){
                        Text(pokemon.name.capitalized).padding(.top,5)
                        Text(pokemon.type)
                            .font(.subheadline).bold()
                            .foregroundColor(.black)
                            .padding(.horizontal,6)
                            .padding([.top,.bottom],10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(backgroudColor.opacity(0.25))
                            )
                        Text(pokemon.name)
                        Spacer()
                    }.frame(maxWidth: .infinity,maxHeight: .infinity)
                    .background(RoundedCorners(tl: 25, tr: 25, bl: 0, br: 0).fill(Color.white))

                }.ignoresSafeArea()
                
            }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pokemon: Pokemon(id: 0, name: "Bulbasur", imageUrl: "1", type: "poison"), viewModel: PokemonViewModel())
    }
}



struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let w = rect.size.width
        let h = rect.size.height
        
        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        path.closeSubpath()

        return path
    }
}

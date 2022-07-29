//
//  InfoView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/14/22.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
    ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
        ZStack {
                Rectangle()
                    .foregroundColor(.white)
            ZStack {
                VStack {
                    Text("Resources and Information")
                        .font(.title)
                        .padding()
                    VStack(alignment: .leading) {
                   
                    Text("Pest Control")
                        .font(.headline)
                        .underline()
                        Group {
                        Text("Houseplant pests are an annoying problem that many plant owners encounter. Here are some tips and recommendations for common houseplant pests.")
                        Text("Spider Mites")
                            .font(.subheadline)
                            .underline()
                            .padding(.top)
                        Text("Spider mites are a member of the arachnid family related to spiders. Spider mites are extremely tiny and build silky webs under leaves and feed on plant sap. They can easily spread to other plants in close proximity. Prevention is important and all new plants should be quarantined.")
                            .font(.footnote)
                            Text("Treatment - Neem Oil, insecticidal soaps, pyrethin-based spray")
                                .font(.footnote)
                        Text("Thrips")
                            .font(.subheadline)
                            .underline()
                            .padding(.top)
                        Text("Thrips are tiny flying insects who suck nutrients from the underside of leaves. Nearly invisible to the eye, they cause leaves to appear dull or yellowed.")
                            .font(.footnote)
                            Text("Treatment - Systemic insecticide (placed in the soil), neem oil, insecticidal soaps")
                                .font(.footnote)
                        Text("Mealy Bugs")
                            .font(.subheadline)
                            .underline()
                            .padding(.top)
                        Text("Thrips are tiny flying insects who suck nutrients from the underside of leaves. Nearly invisible to the eye, they cause leaves to appear dull or yellowed.")
                            .font(.footnote)
                            Text("Treatment - Systemic insecticide (placed in the soil), neem oil, insecticidal soaps")
                                .font(.footnote)

                    }
                        Group {
                            
                    Text("Image Attribution")
                            .underline()
                            .font(.headline)
                            .padding(.bottom)
                    Text("Images for monstera, fiddleleaf fig, snake plant, spider plant, pothos and alocasia created by Freepik at https://www.freepik.com/)")
                            .font(.footnote)
                    Text("Images for prayer plant, string of pearls, dieffenbachia, and arrowhead plant created by Rawpixel at (https://www.freepik.com/)")
                        .font(.footnote)
                    Text("Images for succulent, cactus, pilea and peacelily created by Pikisuperstar at (https://www.freepik.com/)")
                        .font(.footnote)
                    Text("Images for calathea, African violet and orchid created by Upklayak at (https://www.freepik.com/)")
                        .font(.footnote)
                    Text("Image for philodendron by pch.vector at (https://www.freepik.com/)")
                        .font(.footnote)
                    Text("Image for ZZ plant from (https://www.article.com/blog/wp-content/uploads/2020/01/Plant-Spot-Illustration-ZZPlant.jpg)")
                        .font(.footnote)
                        }
                    }.padding()
                }
                }
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

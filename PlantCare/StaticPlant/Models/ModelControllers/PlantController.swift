//
//  PlantController.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/20/22.
//

import Foundation

class PlantController {
    //created a singleton source of truth accessible from many locations
    static let shared = PlantController()
    private init() {}
    
    let staticPlantList = [
    
    Plant(plantName: "Monstera", scientificName: "Monstera deliciosa", water: 3, sunlight: 4, description: "Monsteras are a popular houeplace native to the rainforests of Central America", toxicity: true, staticImage: "monstera"),

        Plant(plantName: "Pilea", scientificName: "Pilea peperomioides", water: 3, sunlight: 3, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: false, staticImage: "pilea"),

        Plant(plantName: "Fiddleleaf Fig", scientificName: "Ficus lyrata", water: 4, sunlight: 4, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: true, staticImage: "fiddleleaffig"),

        Plant(plantName: "Snake Plant", scientificName: "Sansevieria trifasciata", water: 2, sunlight: 2, description: "Snake plants are an easy-to-care for plant that has low water and sunlight needs. Known as an air-purifying plant", toxicity: true, staticImage: "snakeplant"),

        Plant(plantName: "Succulents", scientificName: "various", water: 1, sunlight: 5, description: "Known typically as being very easy to care for, succulents need a surpringly large amount of sun or they will etiolate, becoming branchy and growing upwards.", toxicity: true, staticImage: "succulent"),

        Plant(plantName: "Spider Plant", scientificName: "Chlorophytum comosum", water: 3, sunlight: 3, description: "Aptly named for its spider-like appearance when mature, a healthy spider plant will produce baby plants which can be cut off and propogated into a new plant", toxicity: true, staticImage: "spiderplant"),

        Plant(plantName: "Pothos", scientificName: "Epipremnum sp.", water: 3, sunlight: 3, description: "Pothos come in many different varieties with various leaf colors. Mature plants can produce trailing vines or the plant can be trained to grow on poles. Pothos have moderate watering and sunlight requirements making them an especially easy plant to maintain.", toxicity: true, staticImage: "pothos"),

        Plant(plantName: "Prayer Plant", scientificName: "Maranta leuconeura", water: 4, sunlight: 2, description: "Prayer plants are a member of the Calathea species and have moderate sunlight and water requirements, preferring higher humidity levels. Leaves will raise and lower depending on the time of day, appearing to be in prayer.", toxicity: false, staticImage: "prayerplant"),

        Plant(plantName: "Philodendron", scientificName: "Philodendron sp.", water: 3, sunlight: 3, description: "Philodendron plants come in many different species with unique leaves. Monstera is actually a member of the philodendron family. Native to tropical climates, philodendrons have moderate sunlight and water requirements.", toxicity: true, staticImage: "philodendron.png"),

        Plant(plantName: "String of Pearls", scientificName: "Senecio Rowleyanus", water: 2, sunlight: 4, description: "String of Pearls are a member of the succulent family and as such has low water needs but moderately high sunlight requirements. Too much sun can burn the pearls, and too much water can cause rot.", toxicity: true, staticImage: "stringofpearls"),

        Plant(plantName: "Cactus", scientificName: "various", water: 1, sunlight: 5, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: true, staticImage: "cactus"),

        Plant(plantName: "Peace Lily", scientificName: "Spathiphyllum cochlearispathum", water: 4, sunlight: 5, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: true, staticImage: "peacelily.png"),

        Plant(plantName: "Alocasia", scientificName: "Alocasia sp.", water: 4, sunlight: 4, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: true, staticImage: "alocasia"),

        Plant(plantName: "Calathea", scientificName: "Calathea sp.", water: 4, sunlight: 4, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: false, staticImage: "calathea"),

        Plant(plantName: "African Violet", scientificName: "Saintpaulia ionntha", water: 3, sunlight: 4, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: false, staticImage: "africanviolet.png"),

        Plant(plantName: "Orchid", scientificName: "Orchidaceae", water: 3, sunlight: 3, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: false, staticImage: "orchid.png"),

        Plant(plantName: "Dieffenbachia", scientificName: "Dieffenbachia sp.", water: 3, sunlight: 3, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: true, staticImage: "diffenbachia.png"),

        Plant(plantName: "Wandering Jewel", scientificName: "Tradescantia sp.", water: 3, sunlight: 3, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: true, staticImage: "tradescantia.png"),

        Plant(plantName: "ZZ Plant", scientificName: "Zamioculcas zamiifolia", water: 2, sunlight: 2, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: true, staticImage: "zzplant"),

        Plant(plantName: "Arrowhead Plant", scientificName: "Syngonium podophyllum", water: 3, sunlight: 3, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: true, staticImage: "arrowheadplant.png")

        ]
    
    
    
}

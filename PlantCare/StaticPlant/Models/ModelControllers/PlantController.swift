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
    
    Plant(plantName: "Monstera", scientificName: "Monstera deliciosa", water: 3, sunlight: 4, description: "Monsteras are a popular houeplant native to the rainforests of Central America. Mature leaves will show increased fenestration or holes in the leaves. To help support the growth of your monstera, use a moss pole to support it. Monsteras need bright, filtered sun and allow the soil to dry between waterings", toxicity: true, staticImage: "monstera"),

        Plant(plantName: "Pilea", scientificName: "Pilea peperomioides", water: 3, sunlight: 3, description: "The pilea or money plant is a low maintenance plant and an excellent choice for beginners. Pilea prefer bright, indirect light and have moderate watering needs. The pilea will produce small offshoots from the base which can be propagated into plants.", toxicity: false, staticImage: "pilea2"),

        Plant(plantName: "Fiddleleaf Fig", scientificName: "Ficus lyrata", water: 4, sunlight: 4, description: "The fiddleleaf fig is native to Africa where it thrives in warm and humid conditions. Rotate your tree every week or so to ensure even growth of the leaves. Dust the leaves with a cloth as needed. Fiddleleaf figs prefer bright filtered light and moderate watering.", toxicity: true, staticImage: "fiddleleaffig"),

        Plant(plantName: "Snake Plant", scientificName: "Sansevieria trifasciata", water: 2, sunlight: 2, description: "Snake plants are an easy-to-care for plant that has low water and sunlight needs. Known as an air-purifying plant", toxicity: true, staticImage: "snakeplant"),

        Plant(plantName: "Succulents", scientificName: "various", water: 1, sunlight: 5, description: "Known typically as being very easy to care for, succulents need a surprisingly large amount of sun or they will etiolate, becoming branchy and growing upwards.", toxicity: true, staticImage: "succulent"),

        Plant(plantName: "Spider Plant", scientificName: "Chlorophytum comosum", water: 3, sunlight: 3, description: "Aptly named for its spider-like appearance when mature, a healthy spider plant will produce baby plants which can be cut off and propagated into a new plant", toxicity: true, staticImage: "spiderplant"),

        Plant(plantName: "Pothos", scientificName: "Epipremnum sp.", water: 3, sunlight: 3, description: "Pothos come in many different varieties with various leaf colors. Mature plants can produce trailing vines or the plant can be trained to grow on poles. Pothos have moderate watering and sunlight requirements making them an especially easy plant to maintain.", toxicity: true, staticImage: "pothos"),

        Plant(plantName: "Prayer Plant", scientificName: "Maranta leuconeura", water: 4, sunlight: 2, description: "Prayer plants are a member of the Calathea species and have moderate sunlight and water requirements, preferring higher humidity levels. Leaves will raise and lower depending on the time of day, appearing to be in prayer.", toxicity: false, staticImage: "prayerplant"),

        Plant(plantName: "Philodendron", scientificName: "Philodendron sp.", water: 3, sunlight: 3, description: "Philodendron plants come in many different species with unique leaves. Monstera is actually a member of the philodendron family. Native to tropical climates, philodendrons have moderate sunlight and water requirements.", toxicity: true, staticImage: "philodendron"),

        Plant(plantName: "String of Pearls", scientificName: "Senecio Rowleyanus", water: 2, sunlight: 4, description: "String of Pearls are a member of the succulent family and as such has low water needs but moderately high sunlight requirements. Too much sun can burn the pearls, and too much water can cause rot.", toxicity: true, staticImage: "stringofpearls"),

        Plant(plantName: "Cactus", scientificName: "various", water: 1, sunlight: 5, description: "Native to desert environments, cactus are an easy to care for houseplant that will need lots of sun, but minimal water.", toxicity: true, staticImage: "cactus"),

        Plant(plantName: "Peace Lily", scientificName: "Spathiphyllum cochlearispathum", water: 4, sunlight: 5, description: "Native to the jungles of Columbia, the peace lily is a flowering houseplant with moderate sun but higher water needs. Fertilize every 2 weeks during the growing season.", toxicity: true, staticImage: "peacelily"),

        Plant(plantName: "Alocasia", scientificName: "Alocasia sp.", water: 4, sunlight: 4, description: "Native to the islands of the Philippines, Alocasia are plants with unique foliage. Alocasia thrive best with warm and humid indoor environments and are a more challenging houseplant to own.", toxicity: true, staticImage: "alocasia"),

        Plant(plantName: "Calathea", scientificName: "Calathea sp.", water: 4, sunlight: 4, description: "Native to tropical environments, calathea will tolerate moderate sun and too much can cause the leaves to burn. Calathea can be difficult to care for because of their higher humidity needs and sensitivity to tap water", toxicity: false, staticImage: "calathea"),

        Plant(plantName: "African Violet", scientificName: "Saintpaulia ionntha", water: 3, sunlight: 4, description: "African violets are indoor flowering plant. As a flowering plant, they will need fertilizing every 2 weeks because producing flowers causes increased nutrient needs. Trim dead flowers to encourage growth. African violets have moderate sunlight and watering needs.", toxicity: false, staticImage: "africanviolet"),

        Plant(plantName: "Orchid", scientificName: "Orchidaceae", water: 3, sunlight: 3, description: "Orchids require moist, well draining soil with bright, indirect light. Allow orchids to dry between waterings. Fertilize weekly during the growing season. Orchids only need to be repotted every 1-2 years.", toxicity: false, staticImage: "orchid"),

        Plant(plantName: "Dieffenbachia", scientificName: "Dieffenbachia sp.", water: 3, sunlight: 3, description: "Dieffenbachia are native to South America and Mexico. They are shade tolerant with striking foliage. This plant is toxic to humans and animals. Allow the top two inches of soil to dry between waterings", toxicity: true, staticImage: "dieffenbachia"),

        Plant(plantName: "Bird of Paradise", scientificName: "Strelitzia reginae", water: 4, sunlight: 4, description: "Bird of Paradise are a relatively easy to care for houseplant that produces flowers that appear like a colorful bird. It prefers sunny locations but will tolerate lower light levels. Allow the surface of soil to dry between waterings.", toxicity: true, staticImage: "birdofparadise"),

        Plant(plantName: "ZZ Plant", scientificName: "Zamioculcas zamiifolia", water: 2, sunlight: 2, description: "ZZ plants are a hardy plant with low water and sunlight needs. ZZ plants ironically do best when left alone. Slow growing plant. Use care around children and pets as the ZZ plant is toxic.", toxicity: true, staticImage: "zzplant"),

        Plant(plantName: "Arrowhead Plant", scientificName: "Syngonium podophyllum", water: 4, sunlight: 3, description: "Arrowhead plants or syngonium are plants native to Central and South America. Arrowhead plants produce attractive foliage and can be trained to climb trellis. Place them in low to medium light locations and water when the soil surface begins to feel dry.", toxicity: true, staticImage: "arrowheadplant")

        ]
    
    
    
}

//
//  ContentView.swift
//  Shared
//
//  Created by Ringo Wathelet on 2021/07/16.
//

import SwiftUI



struct ContentView: View {
    @State var meals = [Meal]()
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 30) {
                List {
                    ForEach(meals) { meal in
                        Section(header: Text(meal.name ?? "").font(.title).bold()
                            .foregroundColor(.green)) {
                                
                                NavigationLink("Picture", destination: DetailView(meal: meal))
                                
                                ForEach(meal.ingredients) { ingredient in
                                    if !ingredient.name.isEmpty {
                                        HStack {
                                            Text(ingredient.name)
                                            Spacer()
                                            Text(ingredient.measure)
                                        }
                                    }
                                }
                                
                            }
                    }
                }
            }.padding(30)
        }
        .task {
            let response: ApiResponse? = await fetchMeals()
            if let theMeals = response?.meals {
                meals = theMeals
            }
        }
    }
    
    func fetchMeals<T: Decodable>() async -> T? {
        // all meals that start with `a`
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=a")!
        //  let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        // let url = URL(string:  "https://www.themealdb.com/api/json/v1/1/random.php")!
        
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                // throw URLError(.badServerResponse)   //  todo
                print(URLError(.badServerResponse))
                return nil
            }
            return try JSONDecoder().decode(T.self, from: data)
        }
        catch {
            return nil
        }
    }
    
}

struct DetailView: View {
    var meal: Meal
    
    var body: some View {
        VStack (spacing: 40) {
            if let imgurl = meal.mealThumb {
                AsyncImage(url: URL(string: imgurl)) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "photo.circle.fill").resizable()
                }
                .frame(width: 333, height: 333)
                .padding(40)
            } else {
                Text("NO IMAGE THUMB").foregroundStyle(.blue)
            }
            Text(meal.instructions ?? "")
        }.padding(20)
    }
    
}

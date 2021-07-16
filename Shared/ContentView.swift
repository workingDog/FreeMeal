//
//  ContentView.swift
//  Shared
//
//  Created by Ringo Wathelet on 2021/07/16.
//


import SwiftUI


struct ContentView: View {
    
    @State var meal: Meal?
    
    var body: some View {
        VStack (spacing: 50) {
            if let theMeal = meal {
                let materials = theMeal.getAllMaterials()
                Text(theMeal.name ?? "no name meal")
                Text(theMeal.category ?? "")
                List {
                    ForEach(materials.keys.sorted(), id: \.self) { ingredient in
                        if !ingredient.isEmpty {
                            HStack {
                                Text(ingredient)
                                Spacer()
                                Text(materials[ingredient] ?? "")
                            }
                        }
                    }
                }
            }
        }.padding(30)
        .task {
            let response: ApiResponse? = await fetchMeals()
            if let resp = response, let firstmeal = resp.meals?.first {
                meal = firstmeal
            }
        }
        // .onAppear { loadData() }
    }
    
//    func loadData() {
//        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php") else {
//            print("Your API end point is Invalid")
//            return
//        }
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let response = try? JSONDecoder().decode(ApiResponse.self, from: data) {
//                    DispatchQueue.main.async {
//                        if let firstmeal = response.meals?.first {
//                            meal = firstmeal
//                        }
//                    }
//                    return
//                }
//            }
//        }.resume()
//    }
    
    func fetchMeals<T: Decodable>() async -> T? {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")!
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                // throw URLError(.badServerResponse)   //  todo
                print(URLError(.badServerResponse))
                return nil
            }
            let results = try JSONDecoder().decode(T.self, from: data)
            return results
        }
        catch {
            return nil
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

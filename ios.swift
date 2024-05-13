import SwiftUI

struct ContentView: View {
    @State private var greeting = ""
    @State private var chartData: [ChartData] = []
    @State private var topLinks: [LinkData] = []
    @State private var recentLinks: [LinkData] = []
    @State private var apiError: APIError?

    var body: some View {
        VStack {
            if let error = apiError {
                Text("Error: \(error.message)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                Text(greeting)
                    .padding()
                ChartView(data: chartData)
                TabView {
                    ListView(data: topLinks, title: "Top links")
                        .tabItem {
                            Text("Top links")
                        }
                    ListView(data: recentLinks, title: "Recent links")
                        .tabItem {
                            Text("Recent links")
                        }
                }
                .padding()
            }
        }
        .onAppear {
            fetchData()
        }
    }

    func fetchData() {
        guard let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(DashboardResponse.self, from: data)
                DispatchQueue.main.async {
                    self.greeting = "Good \(self.greetingTime())"
                    self.chartData = decodedResponse.chartData
                    self.topLinks = decodedResponse.topLinks
                    self.recentLinks = decodedResponse.recentLinks
                }
            } catch {
                print("Error decoding JSON response: \(error)")
            }
        }.resume()
    }

    func greetingTime() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 0..<12: return "morning"
        case 12..<17: return "afternoon"
        default: return "evening"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ChartData: Codable {
    let label: String
    let value: Int
}

struct LinkData: Codable {
    let title: String
    let url: URL
}

struct DashboardResponse: Codable {
    let chartData: [ChartData]
    let topLinks: [LinkData]
    let recentLinks: [LinkData]
}

struct ChartView: View {
    var data: [ChartData]

    var body: some View {
        Text("Chart View")
    }
}

struct ListView: View {
    var data: [LinkData]
    var title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            List(data, id: \.title) { link in
                Text(link.title)
            }
        }
    }
}

struct APIError: Codable {
    let status: Bool
    let statusCode: Int
    let message: String
    let name: String
    let errors: [String]
}
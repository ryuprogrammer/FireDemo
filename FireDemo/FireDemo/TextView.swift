import SwiftUI

struct TextView: View {
    @StateObject private var spreadSheetManager = SpreadSheetManager()
    @State private var newEntry: (String, String) = ("", "")

    var body: some View {
        VStack {
            Text("スプレッドシートから取得")
                .font(.headline)
                .padding()

            Button(action: {
                Task {
                    do {
                        try await spreadSheetManager.fetchGoogleSheetData()
                        print("Data fetched successfully")
                    } catch {
                        print("Error fetching data: \(error)")
                    }
                }
            }) {
                Text("再取得")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            List {
                ForEach(spreadSheetManager.spreadSheetResponse.values, id: \.self) { row in
                    HStack {
                        if row.count > 0 {
                            Text(row[0])
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        if row.count > 1 {
                            Text(row[1])
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                }
            }

            HStack {
                TextField("新しいデータ1", text: $newEntry.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("新しいデータ2", text: $newEntry.1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }

            Button(action: {
                Task {
                    do {
                        try await spreadSheetManager.writeGoogleSheetData(data: newEntry)
                        try await spreadSheetManager.fetchGoogleSheetData()
                        print("Data written and fetched successfully")
                    } catch {
                        print("Error writing data: \(error)")
                    }
                }
            }) {
                Text("データ追加")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .task {
            do {
                try await spreadSheetManager.fetchGoogleSheetData()
                print("Initial data fetch successful")
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
}

#Preview {
    TextView()
}

struct SpreadSheetResponse: Codable {
    let range: String?
    let majorDimension: String
    let values: [[String]]
}

class SpreadSheetManager: ObservableObject {
    private let apiKey = "AIzaSyCeQc_0wIhxpWuGqVDvqFCgqp4zfUgqjTQ"
    private let spreadsheetId = "1j6_PE-oePpknUlM1FPl1wyN9pZr9kM20pIPDPzN3oCw"
    private let sheetName = "test1"
    private let cellRange = "A1:B1"
    @Published private(set) var spreadSheetResponse = SpreadSheetResponse(range: "", majorDimension: "", values: [[""]])

    @MainActor
    func fetchGoogleSheetData() async throws {
        let baseURL = "https://sheets.googleapis.com/v4/spreadsheets"
        let url = "\(baseURL)/\(spreadsheetId)/values/\(sheetName)!\(cellRange)?key=\(apiKey)"
        guard let requestURL = URL(string: url) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        let (data, response) = try await URLSession.shared.data(from: requestURL)

        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            }
            throw NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: nil)
        }

        let decoder = JSONDecoder()
        let spreadSheetResponse = try decoder.decode(SpreadSheetResponse.self, from: data)
        self.spreadSheetResponse = spreadSheetResponse
    }

    @MainActor
    func writeGoogleSheetData(data: (String, String)) async throws {
        let baseURL = "https://sheets.googleapis.com/v4/spreadsheets"
        let url = "\(baseURL)/\(spreadsheetId)/values/\(sheetName)!A:B:append?valueInputOption=USER_ENTERED&key=\(apiKey)"
        guard let requestURL = URL(string: url) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }

        let newData = [
            "values": [
                [data.0, data.1]
            ]
        ]

        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONSerialization.data(withJSONObject: newData)

        let (data, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            }
            throw NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: nil)
        }
    }
}

//
//  PetsViewModel.swift
//  PetsSampleApp
//
//  Created by Jyoti Mitkar on 20/12/22.
//

import Foundation

public class PetsViewModel {
    
    let petsModelArray = Box([PetModel]())
    let settings = Box(SettingsModel(dictionary: [String: Any]()))

    init() {
        getPetsList()
        getSettings()
    }
    
    func getPetsList() {
        petsModelArray.value = [PetModel]()
        if let path = Bundle.main.path(forResource: "pets_list", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let pets = jsonResult["pets"] as? [Any] {
                    // do stuff
                    let json = try JSONSerialization.data(withJSONObject: pets)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedPets = try decoder.decode([PetModel].self, from: json)
                    self.petsModelArray.value = decodedPets
                }
            } catch {
                // handle error
            }
        }
    }
    
    func getSettings() {
        settings.value = SettingsModel(dictionary: [String: Any]())
        if let path = Bundle.main.path(forResource: "config", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let settings = jsonResult["settings"] as? [String: Any] {
                    // do stuff
                    let json = try JSONSerialization.data(withJSONObject: settings)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedSettings = try decoder.decode(SettingsModel.self, from: json)
                    self.settings.value = decodedSettings
                }
            } catch {
                // handle error
            }
        }
    }
    
    /*func changeLocation(to newLocation: String) {
        locationName.value = "Loading..."
        geocoder.geocode(addressString: newLocation) { [weak self] locations in
            guard let self = self else { return }
            if let location = locations.first {
                self.locationName.value = location.name
                self.fetchWeatherForLocation(location)
                return
            }
        }
    }
    
    private func fetchWeatherForLocation(_ location: Location) {
        WeatherbitService.weatherDataForLocation(
            latitude: location.latitude,
            longitude: location.longitude) { [weak self] (weatherData, error) in
                guard
                    let self = self,
                    let weatherData = weatherData
                else {
                    return
                }
            }
    }*/
}

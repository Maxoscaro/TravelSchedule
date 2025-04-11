import SwiftUI

struct MainScreenView: View {
    
    @State private var noInternet = true
    @EnvironmentObject var storyViewModel: StoryScreenViewModel
    @EnvironmentObject var navigationModel: NavigationViewModel
    @EnvironmentObject var citySelectionViewModel: CitySelectionViewModel
    @EnvironmentObject var filterViewModel: FilterViewModel
    @EnvironmentObject var stationsViewModel: StationSelectionViewModel
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(0..<storyViewModel.stories.count, id: \.self) { index in
                            if storyViewModel.stories[index].isViewed {
                                ViewedStoriesView(story: storyViewModel.stories[index])
                                    .onTapGesture {
                                        navigationModel.open(.storiesScreenMainView(index: index))
                                    }
                            } else {
                                StoriesView(story: storyViewModel.stories[index])
                                    .onTapGesture {
                                        navigationModel.open(.storiesScreenMainView(index: index))
                                    }
                            }
                        }
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 4)
                }
                .padding(.horizontal)
                .padding(.top, 24)
                
                DirectionsTextFieldView(
                    selectedDeparture: $stationsViewModel.selectedDeparture,
                    selectedArrival: $stationsViewModel.selectedArrival,
                    onTapFromCity: {
                        navigationModel.open(.citiesDeparture)
                    },
                    onTapToCity: {
                        navigationModel.open(.citiesArrival)
                    }
                )
                .padding(.top, 24)
                
                if !stationsViewModel.selectedDeparture.isEmpty && !stationsViewModel.selectedArrival.isEmpty {
                    Button(action: {
                        filterViewModel.resetFilters()
                        navigationModel.open(.carrierList)
                    }) {
                        Text("Найти")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .bold))
                            .padding()
                            .frame(width: 150)
                            .background(.blueUniversal)
                            .cornerRadius(16)
                    }
                    .padding(.top, 16)
                    .padding(.horizontal)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    MainScreenView()
        .environmentObject(CitySelectionViewModel())
        .environmentObject(NavigationViewModel())
        .environmentObject(FilterViewModel())
        .environmentObject(StoryScreenViewModel())
        .environmentObject(StationSelectionViewModel())
}

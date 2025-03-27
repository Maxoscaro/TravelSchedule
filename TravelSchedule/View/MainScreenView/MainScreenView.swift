import SwiftUI

struct MainScreenView: View {
    
    @State private var noInternet = true
    @StateObject var storyViewModel = StoryScreenViewModel()
    @EnvironmentObject var navigationModel: NavigationViewModel
    @EnvironmentObject var citySelectionViewModel: CitySelectionViewModel
    @EnvironmentObject var filterViewModel: FilterViewModel
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(storyViewModel.stories) { story in
                            StoriesView(story: story)
                        }
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 4)
                }
                .padding(.horizontal)
                .padding(.top, 24)
                
                DirectionsTextFieldView(
                    selectedDeparture: $navigationModel.selectedDeparture,
                    selectedArrival: $navigationModel.selectedArrival,
                    onTapFromCity: {
                        navigationModel.open(.citiesDeparture)
                    },
                    onTapToCity: {
                        navigationModel.open(.citiesArrival)
                    }
                )
                .padding(.top, 24)
                
                if !navigationModel.selectedDeparture.isEmpty && !navigationModel.selectedArrival.isEmpty {
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
            
            if noInternet {
                InternetErrorView()
                    .background(Color.whiteDay)
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(1)
                    .transition(.opacity)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    noInternet = false
                }
            }
        }
    }
}

#Preview {
    MainScreenView()
        .environmentObject(CitySelectionViewModel())
        .environmentObject(NavigationViewModel())
        .environmentObject(FilterViewModel())
}

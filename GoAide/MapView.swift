import SwiftUI

enum MapFilter: String, CaseIterable {
    case demandes = "Demandes"
    case benevoles = "Bénévoles"
    case associations = "Associations"
}

enum MapPlaceType {
    case request
    case volunteer
    case association
}

struct MapPlace: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let distance: String
    let urgency: String
    let type: MapPlaceType
    let color: Color
    let x: CGFloat
    let y: CGFloat
}

struct MapView: View {
    @State private var searchText = ""
    @State private var selectedFilter: MapFilter = .demandes
    @State private var selectedPlace: MapPlace?

    private let places = [
        MapPlace(title: "Aide pour courses", subtitle: "Alix", distance: "350 m", urgency: "Urgent", type: .request, color: GOAideColors.red, x: 0.58, y: 0.63),
        MapPlace(title: "Aide pour courrier", subtitle: "Marie D.", distance: "800 m", urgency: "Normal", type: .request, color: GOAideColors.brightBlue, x: 0.36, y: 0.38),
        MapPlace(title: "Bénévole disponible", subtitle: "Nora", distance: "600 m", urgency: "Disponible", type: .volunteer, color: GOAideColors.green, x: 0.72, y: 0.34),
        MapPlace(title: "Secours Populaire", subtitle: "Association", distance: "0,7 km", urgency: "Ouvert", type: .association, color: GOAideColors.orange, x: 0.28, y: 0.70),
        MapPlace(title: "Croix-Rouge française", subtitle: "Association", distance: "1,2 km", urgency: "Ouvert", type: .association, color: GOAideColors.red, x: 0.66, y: 0.78)
    ]

    private var visiblePlaces: [MapPlace] {
        places.filter { place in
            switch selectedFilter {
            case .demandes:
                return place.type == .request
            case .benevoles:
                return place.type == .volunteer
            case .associations:
                return place.type == .association
            }
        }
    }

    var body: some View {
        VStack(spacing: 14) {
            TextField("Rechercher une adresse", text: $searchText)
                .padding(12)
                .background(GOAideColors.card)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 16)

            HStack {
                ForEach(MapFilter.allCases, id: \.self) { filter in
                    Button {
                        selectedFilter = filter
                        selectedPlace = visiblePlaces.first
                    } label: {
                        FilterChip(title: filter.rawValue, selected: selectedFilter == filter)
                    }
                }
            }
            .padding(.horizontal, 16)

            GeometryReader { proxy in
                ZStack {
                    MapPlaceholder()

                    ForEach(visiblePlaces) { place in
                        Button {
                            selectedPlace = place
                        } label: {
                            Image(systemName: iconName(for: place))
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(width: selectedPlace?.id == place.id ? 42 : 34, height: selectedPlace?.id == place.id ? 42 : 34)
                                .background(place.color)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .position(x: proxy.size.width * place.x, y: proxy.size.height * place.y)
                    }
                }
            }
            .overlay(alignment: .bottom) {
                if let selectedPlace {
                    selectedPlaceCard(selectedPlace)
                        .padding()
                } else if let firstPlace = visiblePlaces.first {
                    selectedPlaceCard(firstPlace)
                        .padding()
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .padding(.top, 12)
        .background(GOAideColors.background)
        .navigationTitle("Carte")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            selectedPlace = visiblePlaces.first
        }
    }

    private func iconName(for place: MapPlace) -> String {
        switch place.type {
        case .request:
            return "hand.raised.fill"
        case .volunteer:
            return "person.fill"
        case .association:
            return "cross.case.fill"
        }
    }

    @ViewBuilder
    private func selectedPlaceCard(_ place: MapPlace) -> some View {
        switch place.type {
        case .request:
            NavigationLink(destination: RequestDetailView()) {
                RequestCard(title: place.title, person: place.subtitle, distance: place.distance, urgency: place.urgency, color: place.color)
            }
        case .volunteer:
            NavigationLink(destination: RequesterProfileView()) {
                RequestCard(title: place.title, person: place.subtitle, distance: place.distance, urgency: place.urgency, color: place.color)
            }
        case .association:
            NavigationLink(destination: AssociationDetailView(name: place.title)) {
                RequestCard(title: place.title, person: place.subtitle, distance: place.distance, urgency: place.urgency, color: place.color)
            }
        }
    }
}

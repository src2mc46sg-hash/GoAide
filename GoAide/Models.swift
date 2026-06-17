import Foundation

struct UserModel: Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    let city: String
    let isVerified: Bool
}

struct HelpRequestModel: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let category: String
    let requesterName: String
    let address: String
    let distance: String
    let urgency: String
}

struct AssociationModel: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let distance: String
    let description: String
}

struct MessageModel: Identifiable {
    let id = UUID()
    let text: String
    let isMine: Bool
}

struct MissionModel: Identifiable {
    let id = UUID()
    let title: String
    let personName: String
    let date: String
    let time: String
    let place: String
    let status: String
}

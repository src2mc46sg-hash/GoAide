import SwiftUI

enum ScreenNames {
    // Parcours de lancement
    static let splash = "1. Splash Screen"
    static let onboardingEntraide = "2.1 Onboarding - Entraide locale"
    static let onboardingLocalisation = "2.2 Onboarding - Geolocalisation"
    static let onboardingSecurite = "2.3 Onboarding - Securite"

    // Accueil et navigation principale
    static let home = "5. Accueil / Tableau de bord"
    static let map = "6. Carte"
    static let requestsAround = "8. Liste des demandes autour de vous"
    static let requestDetail = "9. Detail d'une demande"
    static let requesterProfile = "10. Profil demandeur"
    static let acceptMission = "11. Accepter une mission"
    static let chat = "12. Messagerie"

    // Depot de demande
    static let requestType = "7.1 Choix du besoin"
    static let requestDescription = "7.2 Description du besoin"
    static let requestLocation = "7.3 Localisation et urgence"
    static let requestValidation = "7.4 Validation et publication"

    // Connexion et profil
    static let auth = "3. Connexion / Inscription"
    static let profileCreation = "4. Creation du profil"

    // SOS
    static let sosStart = "13.1 SOS Social"
    static let sosForm = "13.2 Formulaire SOS"
    static let sosResult = "13.3 Resultat SOS / Besoin identifie"

    // Associations
    static let associations = "14.1 Recherche d'association"
    static let associationDetail = "14.2 Detail association"

    // Profil et reglages
    static let userProfile = "15. Profil utilisateur"
    static let notifications = "16. Notifications"
    static let settings = "17. Parametres"

    // Ecrans ajoutes pour completer l'app
    static let myRequests = "18. Mes demandes"
    static let myRequestDetail = "19. Detail de ma demande"
    static let myMissions = "20. Mes missions"
    static let missionInProgress = "21. Mission en cours"
    static let missionComplete = "22. Fin de mission"
    static let review = "23. Avis / Remerciement"
    static let report = "24. Signalement securite"
    static let editProfile = "25. Modifier mon profil"
    static let privacy = "26. Confidentialite"
    static let accessibility = "27. Accessibilite"
    static let safetyCenter = "28. Centre de securite"
}

enum ScreenFlow {
    static let mainFlow = [
        ScreenNames.splash,
        ScreenNames.onboardingEntraide,
        ScreenNames.onboardingLocalisation,
        ScreenNames.onboardingSecurite,
        ScreenNames.home
    ]

    static let helpSomeoneFlow = [
        ScreenNames.home,
        ScreenNames.map,
        ScreenNames.requestsAround,
        ScreenNames.requestDetail,
        ScreenNames.requesterProfile,
        ScreenNames.acceptMission,
        ScreenNames.chat
    ]

    static let createRequestConnectedFlow = [
        ScreenNames.home,
        ScreenNames.requestType,
        ScreenNames.requestDescription,
        ScreenNames.requestLocation,
        ScreenNames.requestValidation,
        ScreenNames.home
    ]

    static let createRequestNotConnectedFlow = [
        ScreenNames.home,
        ScreenNames.requestType,
        ScreenNames.requestDescription,
        ScreenNames.requestLocation,
        ScreenNames.auth,
        ScreenNames.profileCreation,
        ScreenNames.requestValidation,
        ScreenNames.home
    ]

    static let sosFlow = [
        ScreenNames.home,
        ScreenNames.sosStart,
        ScreenNames.sosForm,
        ScreenNames.requestType
    ]

    static let associationFlow = [
        ScreenNames.home,
        ScreenNames.associations,
        ScreenNames.associationDetail,
        ScreenNames.map
    ]

    static let profileFlow = [
        ScreenNames.home,
        ScreenNames.userProfile,
        ScreenNames.notifications,
        ScreenNames.settings
    ]
}

enum ScreenChecklist {
    static let allScreens = [
        ScreenNames.splash,
        ScreenNames.onboardingEntraide,
        ScreenNames.onboardingLocalisation,
        ScreenNames.onboardingSecurite,
        ScreenNames.auth,
        ScreenNames.profileCreation,
        ScreenNames.home,
        ScreenNames.map,
        ScreenNames.requestType,
        ScreenNames.requestDescription,
        ScreenNames.requestLocation,
        ScreenNames.requestValidation,
        ScreenNames.requestsAround,
        ScreenNames.requestDetail,
        ScreenNames.requesterProfile,
        ScreenNames.acceptMission,
        ScreenNames.chat,
        ScreenNames.sosStart,
        ScreenNames.sosForm,
        ScreenNames.sosResult,
        ScreenNames.associations,
        ScreenNames.associationDetail,
        ScreenNames.userProfile,
        ScreenNames.notifications,
        ScreenNames.settings,
        ScreenNames.myRequests,
        ScreenNames.myRequestDetail,
        ScreenNames.myMissions,
        ScreenNames.missionInProgress,
        ScreenNames.missionComplete,
        ScreenNames.review,
        ScreenNames.report,
        ScreenNames.editProfile,
        ScreenNames.privacy,
        ScreenNames.accessibility,
        ScreenNames.safetyCenter
    ]
}

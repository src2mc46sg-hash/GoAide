import SwiftUI

enum AssetNames {
    // Logos
    static let logoGOAide = "logo_goaide"
    static let appIconGOAide = "app_icon_goaide"

    // Onboarding
    static let onboardingSplashLogo = "onboarding_splash_logo"
    static let onboardingEntraide = "onboarding_entraide"
    static let onboardingLocalisation = "onboarding_localisation"
    static let onboardingSecurite = "onboarding_securite"

    // Carte et localisation
    static let mapPreview = "map_preview"
    static let mapPinRed = "map_pin_red"
    static let locationMarker = "location_marker"
    static let mapMarkerRequest = "map_marker_request"
    static let mapMarkerVolunteer = "map_marker_volunteer"
    static let mapMarkerAssociation = "map_marker_association"
    static let mapMarkerSelected = "map_marker_selected"
    static let mapRoadsBackground = "map_roads_background"
    static let mapUserLocation = "map_user_location"

    // Categories
    static let iconCourses = "icon_courses"
    static let iconCompagnie = "icon_compagnie"
    static let iconDiscussion = "icon_discussion"
    static let iconAideNumerique = "icon_aide_numerique"
    static let iconAideAdministrative = "icon_aide_administrative"
    static let iconTransport = "icon_transport"
    static let iconActivitesSolidaires = "icon_activites_solidaires"
    static let iconAutre = "icon_autre"

    // Demandes et missions
    static let illustrationDemandePubliee = "illustration_demande_publiee"
    static let illustrationMissionAcceptee = "illustration_mission_acceptee"
    static let illustrationMissionTerminee = "illustration_mission_terminee"
    static let iconCalendar = "icon_calendar"
    static let iconClock = "icon_clock"

    // SOS
    static let iconSOS = "icon_sos"
    static let illustrationSOSResultat = "illustration_sos_resultat"
    static let iconSOSUrgent = "icon_sos_urgent"
    static let iconSOSNeeds = "icon_sos_needs"
    static let iconSOSMobility = "icon_sos_mobility"
    static let iconSOSLocation = "icon_sos_location"
    static let iconSOSContact = "icon_sos_contact"
    static let iconSOSPharmacy = "icon_sos_pharmacy"
    static let iconSOSAdministration = "icon_sos_administration"

    // Associations
    static let logoSecoursPopulaire = "logo_secours_populaire"
    static let logoCroixRouge = "logo_croix_rouge"
    static let logoEmmaus = "logo_emmaus"
    static let iconAssociation = "icon_association"

    // Profils
    static let avatarDefault = "avatar_default"
    static let avatarMarie = "avatar_marie"
    static let avatarInes = "avatar_ines"
    static let avatarVolunteerNora = "avatar_volunteer_nora"

    // Tab bar et interface
    static let tabHome = "tab_home"
    static let tabMap = "tab_map"
    static let tabRequests = "tab_requests"
    static let tabAides = "tab_aides"
    static let tabProfile = "tab_profile"
    static let iconNotification = "icon_notification"
    static let iconSettings = "icon_settings"
    static let iconSendMessage = "icon_send_message"
}

enum AssetChecklist {
    static let requiredAssets = [
        AssetNames.logoGOAide,
        AssetNames.appIconGOAide,
        AssetNames.onboardingEntraide,
        AssetNames.onboardingLocalisation,
        AssetNames.onboardingSecurite,
        AssetNames.mapPreview,
        AssetNames.mapPinRed,
        AssetNames.mapMarkerRequest,
        AssetNames.mapMarkerAssociation,
        AssetNames.iconCourses,
        AssetNames.iconCompagnie,
        AssetNames.iconDiscussion,
        AssetNames.iconAideNumerique,
        AssetNames.iconAideAdministrative,
        AssetNames.iconTransport,
        AssetNames.iconActivitesSolidaires,
        AssetNames.illustrationDemandePubliee,
        AssetNames.illustrationMissionAcceptee,
        AssetNames.iconSOS,
        AssetNames.iconSOSNeeds,
        AssetNames.iconSOSUrgent,
        AssetNames.iconSOSMobility,
        AssetNames.iconSOSLocation,
        AssetNames.iconSOSContact,
        AssetNames.logoSecoursPopulaire,
        AssetNames.logoCroixRouge,
        AssetNames.logoEmmaus,
        AssetNames.avatarDefault,
        AssetNames.avatarMarie,
        AssetNames.avatarInes
    ]

    static let optionalAssets = [
        AssetNames.mapMarkerVolunteer,
        AssetNames.mapMarkerSelected,
        AssetNames.mapRoadsBackground,
        AssetNames.mapUserLocation,
        AssetNames.illustrationSOSResultat,
        AssetNames.iconSOSPharmacy,
        AssetNames.iconSOSAdministration,
        AssetNames.avatarVolunteerNora,
        AssetNames.tabHome,
        AssetNames.tabMap,
        AssetNames.tabAides,
        AssetNames.tabProfile,
        AssetNames.iconNotification,
        AssetNames.iconSettings,
        AssetNames.iconSendMessage
    ]
}

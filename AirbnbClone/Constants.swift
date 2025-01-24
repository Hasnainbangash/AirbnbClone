//
//  Constants.swift
//  AirbnbClone
//
//  Created by Elexoft on 07/01/2025.
//

import Foundation

struct K {
    
    struct HostYourPlaceCell {
        struct Identifiers {
            static let describeYourPlaceCollectionCellIdentifier = "DescribeYourPlaceCollectionReusebaleCell"
            static let describeYourPlaceheaderCellIdentifier = "DescribeYourPlaceHeaderReusebaleCell"
            
            static let guestFavourateBodyCollectionCellIdentifier = "GuestsFavourateBodyReusebaleCell"
            static let guestFavourateHeaderCellIdentifier = "GuestsFavourateHeaderReusebaleCell"
            
            static let safetyItemsBodyCollectionCellIdentifier = "SafetyItemsBodyReusebaleCell"
            static let safetyItemsHeaderCellIdentifier = "SafetyItemsHeaderReusebaleCell"
            
            static let standoutAmenitiesBodyCollectionCellIdentifier = "StandoutAmenitiesBodyReusebaleCell"
            static let standoutAmenitiesHeaderCellIdentifier = "StandoutAmenitiesHeaderReusebaleCell"
        }
        
        struct NibNames {
            static let describeYourPlaceCollectionCellNibName = "DescribeYourPlaceCollectionCell"
            static let describeYourPlaceheaderCellNibName = "DescribeYourPlaceHeaderCell"
            
            static let guestFavourateBodyCollectionCellNibName = "GuestsFavourateBodyCell"
            static let guestFavourateHeaderCellNibName = "GuestsFavourateHeaderCell"
            
            static let safetyItemsCollectionCellNibName = "SafetyItemsBodyCell"
            static let safetyItemsHeaderCellNibName = "SafetyItemsHeaderCell"
            
            static let standoutAmenitiesCollectionCellNibName = "StandoutAmenitiesBodyCell"
            static let standoutAmenitiesHeaderCellNibName = "StandoutAmenitiesHeaderCell"
        }
    }
    
    struct ProfileMainScreen {
        struct Segues {
            
            //Profile
            static let ProfileScreenToShowProfileSegue = "ProfileScreenToShowProfile"
            
            // Settings
            static let ProfileScreenToPersonalInformationSegue = "ProfileScreenToPersonalInformation"
            static let ProfileScreenToLoginandSecuritySegue = "ProfileScreenToLoginandSecurity"
            static let ProfileScreenToPaymentandPayoutsSegue = "ProfileScreenToPaymentandPayouts"
            static let ProfileScreenToAccessibilitySegue = "ProfileScreenToAccessibility"
            static let ProfileScreenToTaxesSegue = "ProfileScreenToTaxes"
            static let ProfileScreenToTranslationSegue = "ProfileScreenToTranslation"
            static let ProfileScreenToNotificationsSegue = "ProfileScreenToNotifications"
            static let ProfileScreenToPrivacyandSharingSegue = "ProfileScreenToPrivacyandSharing"
            static let ProfileScreenToTravelforWorkSegue = "ProfileScreenToTravelforWork"
            
            // Hosting
            static let ProfileScreenToListyourSpaceSegue = "ProfileScreenToListyourSpace"
            static let ProfileScreenToLearnAboutHostingSegue = "ProfileScreenToLearnAboutHosting"
            static let ProfileScreenToHostanExperienceSegue = "ProfileScreenToHostanExperience"
            
            
            // Support
            static let ProfileScreenToVisitHelpCenterSegue = "ProfileScreenToVisitHelpCenter"
            static let ProfileScreenToGetHelpwithSafetyIssuesSegue = "ProfileScreenToHelpwithSafetyIssues"
            static let ProfileScreenToHowAirbnbWorksSegue = "ProfileScreenToHowAirbnbWorks"
            static let ProfileScreenToGiveusFeedbackSegue = "ProfileScreenToGiveusFeedback"
            
            // Legal
            static let ProfileScreenToTermOfServicesSegue = "ProfileScreenToTermOfServices"
            static let ProfileScreenToPrivacyPolicySegue = "ProfileScreenToPrivacyPolicy"
            static let ProfileScreenToOpenSourceLicenesSegue = "ProfileScreenToOpenSourceLicenes"
        }
    }
    
    struct MapScreensCell {
        struct Identifiers {
            static let mapLocationCellIdentifier = "MapLocationImageReuseableCell"
        }
        
        struct NibNames {
            static let mapLocationCellNibName = "MapLocationCell"
        }
    }
    
    struct RecentlyViewedCell {
        struct Identifiers {
            static let recentlyViewedCellIdentifier = "RecentlyViewedReuseableCell"
            static let headerCellIdentifier = "RecentlyViewHeaderReuseableCell"
        }
        
        struct NibNames {
            static let recentlyViewedCellNibName = "RecentlyViewedViewCell"
            static let headerCellNibName = "HeaderCell"
        }
    }
    
    struct MessageScreenCell {
        struct Identifiers {
            static let messageHomeCellIdentifier = "MessageHomeCellReuseableCell"
        }
        
        struct NibNames {
            static let messageHomeCellNibName = "MessageHomeCell"
        }
    }
    
    struct ExploreCells {
        struct Identifiers {
            static let categoryCellIdentifier = "CategoriesCollectionReuseableCell"
            static let locationCellIdentifier = "LocationReuseableCell"
            static let locationPictureViewCellIdentifier = "LocationPictureViewReuseableCell"
        }
        
        struct NibNames {
            static let categoryCellNibName = "CategoryCell"
            static let locationCellNibName = "LocationCell"
            static let locationPictureViewCellNibName = "LocationPictureViewCell"
        }
        
        struct Segue {
            static let ExploreScreenToBottomSheetSegue = "ExploreSecondScreenViewController"
            static let ExploreSecondScreenToExploreLocationDataSegue = "ExploreSecondScreenToExploreLocationDataScreen"
        }
    }
    
    struct ExploreLocationDetailCells {
        
        struct Identifiers {
            static let bedroomCellIdentifier = "BedroomCollectionReuseableCell"
            static let locationImagesCellIdentifier = "LocationImagesCollectionReuseableCell"
            static let reviewCellIdentifier = "ReviewCellCollectionReuseableCell"
        }
        
        struct NibNames {
            static let bedroomCellNibName = "BedroomsCell"
            static let locationImagesCellNibName = "LocationImagesCell"
            static let reviewCellNibName = "ReviewCell"
        }
        
    }
    
}

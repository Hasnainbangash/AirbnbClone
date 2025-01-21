//
//  Constants.swift
//  AirbnbClone
//
//  Created by Elexoft on 07/01/2025.
//

import Foundation

struct K {
    
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

library(shiny)

crimeType <- list("Robbery","Rape", "Aggravated assault",
                  "Murder and nonnegligent manslaughter",
                  "Burglary", "Larceny-theft", "Motor vehicle theft",
                  "Arson", "Violent crime", "Property crime",
                  "Other assaults", "Forgery and counterfeiting",
                  "Fraud","Embezzlement",
                  "Stolen property; buying, receiving, possessing",
                  "Vandalism","Weapons; carrying, possessing, etc.",
                  "Prostitution and commercialized vice",
                  "Sex offenses (except rape and prostitution)",
                  "Drug abuse violations","Drug abuse violations",
                  "Offenses against the family and children",
                  "Gambling", "Driving under the influence",
                  "Liquor laws", "Drunkenness", "Disorderly conduct",
                  "Vagrancy", "All other offenses (except traffic)",
                  "Suspicion", "Curfew and loitering law violations"
                  )

race <- list("White","Black or African American" = "Black",
             "American Indian or Alaskan Native" = "Indian", "Asian",
             "Native Hawaiian or Other Pacific Islander" = "Hawaiian")
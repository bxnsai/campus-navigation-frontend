//
//  srcdest-model.swift
//  csuf-navigator
//
//  Created by Fabrizio Mejia on 11/6/24.
//

import Foundation
import OrderedCollections
import MapKit

struct selected: Identifiable  {
    let name: String
    let code: String
    let coordinates: CLLocationCoordinate2D
    let id = UUID()
}



class srcdest : ObservableObject {
    @Published var source: selected?
    @Published var destination: selected?
    
}

struct places{
    
    let vertices = [ 
        selected(name: "College Park Parking South", code: "cpps", coordinates: CLLocationCoordinate2D(latitude: 33.87620, longitude: -117.88337)),
        selected(name: "College Park Parking", code: "cps", coordinates: CLLocationCoordinate2D(latitude: 33.87721, longitude: -117.88320)),
        selected(name: "College Park Parking North", code: "cpn", coordinates: CLLocationCoordinate2D(latitude: 33.87787, longitude: -117.88315)),
        selected(name: "Mihaylo Hall", code: "sgmh", coordinates: CLLocationCoordinate2D(latitude: 33.87872, longitude: -117.88339)),
        selected(name: "Langsdorf Hall", code: "lh", coordinates: CLLocationCoordinate2D(latitude: 33.87900, longitude: -117.88428)),
        selected(name: "Carls Jr.", code: "cj", coordinates: CLLocationCoordinate2D(latitude: 33.87938, longitude: -117.88380)),
        selected(name: "Lot M", code: "lotm", coordinates: CLLocationCoordinate2D(latitude: 33.87953, longitude: -117.88341)),
        selected(name: "Gordon Hall", code: "gh", coordinates: CLLocationCoordinate2D(latitude: 33.87967, longitude: -117.88417)),
        selected(name: "Humanities", code: "h", coordinates: CLLocationCoordinate2D(latitude: 33.88043, longitude: -117.88426)),
        selected(name: "Modular Complex", code: "mc", coordinates: CLLocationCoordinate2D(latitude: 33.87869, longitude: -117.88598)),
        selected(name: "Lot C East", code: "lotce", coordinates: CLLocationCoordinate2D(latitude: 33.87851, longitude: -117.88721)),
        selected(name: "Loc C West", code: "lotcw", coordinates: CLLocationCoordinate2D(latitude: 33.87834, longitude: -117.88886)),
        selected(name: "Dan Black Hall", code: "dbh", coordinates: CLLocationCoordinate2D(latitude: 33.87914, longitude: -117.88599)),
        selected(name: "Nutwood Parking Structure", code: "nps", coordinates: CLLocationCoordinate2D(latitude: 33.87900, longitude: -117.88843)),
        selected(name: "Greenhouse Complex", code: "gc", coordinates: CLLocationCoordinate2D(latitude: 33.87958, longitude: -117.88703)),
        selected(name: "McCarthy hall", code: "mh", coordinates: CLLocationCoordinate2D(latitude: 33.87965, longitude: -117.88555)),
        selected(name: "Quad", code: "quad", coordinates: CLLocationCoordinate2D(latitude: 33.88049, longitude: -117.88535)),
        selected(name: "Clayes Performing Arts Center", code: "cpac", coordinates: CLLocationCoordinate2D(latitude: 33.88043, longitude: -117.88660)),
        selected(name: "Visual Arts Complex", code: "va", coordinates: CLLocationCoordinate2D(latitude: 33.88070, longitude: -117.88851)),
        selected(name: "Titan Hall", code: "thall", coordinates: CLLocationCoordinate2D(latitude: 33.88081, longitude: -117.89009)),
        selected(name: "Titan Hall Lot", code: "lotth", coordinates: CLLocationCoordinate2D(latitude: 33.88040, longitude: -117.89048)),
        selected(name: "Titan Hall ASC", code: "asc", coordinates: CLLocationCoordinate2D(latitude: 33.88122, longitude: -117.89062)),
        selected(name: "Visitor West Lot", code: "lotvw", coordinates: CLLocationCoordinate2D(latitude: 33.88176, longitude: -117.88923)),
        selected(name: "Titan Student Union", code: "tsu", coordinates: CLLocationCoordinate2D(latitude: 33.88169, longitude: -117.88846)),
        selected(name: "Becker Ampitheater", code: "ba", coordinates: CLLocationCoordinate2D(latitude: 33.88119, longitude: -117.88700)),
        selected(name: "Titan Shop", code: "b", coordinates: CLLocationCoordinate2D(latitude: 33.88181, longitude: -117.88690)),
        selected(name: "Commons", code: "co", coordinates: CLLocationCoordinate2D(latitude: 33.88151, longitude: -117.88608)),
        selected(name: "Pollak Library", code: "pl", coordinates: CLLocationCoordinate2D(latitude: 33.88146, longitude: -117.88539)),
        selected(name: "Education Classroom", code: "ec", coordinates: CLLocationCoordinate2D(latitude: 33.88120, longitude: -117.88446)),
        selected(name: "Lot I", code: "loti", coordinates: CLLocationCoordinate2D(latitude: 33.88150, longitude: -117.88300)),
        selected(name: "Lot F", code: "lotf", coordinates: CLLocationCoordinate2D(latitude: 33.88050, longitude: -117.88306)),
        selected(name: "Eastside South Parking Structure", code: "esps", coordinates: CLLocationCoordinate2D(latitude: 33.88025, longitude: -117.88182)),
        selected(name: "Eastside North Parking Structure", code: "esns", coordinates: CLLocationCoordinate2D(latitude: 33.88109, longitude: -117.88173)),
        selected(name: "Resident Lot 2", code: "lotr2", coordinates: CLLocationCoordinate2D(latitude: 33.88201, longitude: -117.88178)),
        selected(name: "Engineering SE", code: "ese", coordinates: CLLocationCoordinate2D(latitude: 33.88195, longitude: -117.88271)),
        selected(name: "Engineering SW", code: "esw", coordinates: CLLocationCoordinate2D(latitude: 33.88195, longitude: -117.88322)),
        selected(name: "Engineering", code: "eng", coordinates: CLLocationCoordinate2D(latitude: 33.88232, longitude: -117.88323)),
        selected(name: "Computer Science", code: "cs", coordinates: CLLocationCoordinate2D(latitude: 33.88234, longitude: -117.88266)),
        selected(name: "Engineering NW", code: "enw", coordinates: CLLocationCoordinate2D(latitude: 33.88268, longitude: -117.88323)),
        selected(name: "Engineering NE", code: "ene", coordinates: CLLocationCoordinate2D(latitude: 33.88266, longitude: -117.88274)),
        selected(name: "Redwood", code: "redwd", coordinates: CLLocationCoordinate2D(latitude: 33.88243, longitude: -117.88145)),
        selected(name: "Laurel", code: "laur", coordinates: CLLocationCoordinate2D(latitude: 33.88276, longitude: -117.88197)),
        selected(name: "Noble", code: "nobl", coordinates: CLLocationCoordinate2D(latitude: 33.88279, longitude: -117.88140)),
        selected(name: "Gastronome", code: "gas", coordinates: CLLocationCoordinate2D(latitude: 33.88312, longitude: -117.88239)),
        selected(name: "Resident Lot 1", code: "lotr1", coordinates: CLLocationCoordinate2D(latitude: 33.88392, longitude: -117.88142)),
        selected(name: "Holly", code: "holly", coordinates: CLLocationCoordinate2D(latitude: 33.88405, longitude: -117.88173)),
        selected(name: "Pine", code: "pine", coordinates: CLLocationCoordinate2D(latitude: 33.88360, longitude: -117.88275)),
        selected(name: "Juniper", code: "junpr", coordinates: CLLocationCoordinate2D(latitude: 33.88409, longitude: -117.88234)),
        selected(name: "Fig", code: "fig", coordinates: CLLocationCoordinate2D(latitude: 33.88444, longitude: -117.88169)),
        selected(name: "Elm", code: "elm", coordinates: CLLocationCoordinate2D(latitude: 33.88513, longitude: -117.88169)),
        selected(name: "Birch", code: "birch", coordinates: CLLocationCoordinate2D(latitude: 33.88460, longitude: -117.88214)),
        selected(name: "Acacia", code: "aca", coordinates: CLLocationCoordinate2D(latitude: 33.88459, longitude: -117.88255)),
        selected(name: "Manzanita", code: "manz", coordinates: CLLocationCoordinate2D(latitude: 33.88502, longitude: -117.88260)),
        selected(name: "Willow", code: "will", coordinates: CLLocationCoordinate2D(latitude: 33.88542, longitude: -117.88241)),
        selected(name: "Oak", code: "oak", coordinates: CLLocationCoordinate2D(latitude: 33.88503, longitude: -117.88213)),
        selected(name: "Lot J", code: "lotj", coordinates: CLLocationCoordinate2D(latitude: 33.88382, longitude: -117.88299)),
        selected(name: "Ruby Gerontology Center", code: "rg", coordinates: CLLocationCoordinate2D(latitude: 33.88335, longitude: -117.88325)),
        selected(name: "Lot H", code: "loth", coordinates: CLLocationCoordinate2D(latitude: 33.88390, longitude: -117.88362)),
        selected(name: "Student & Health Counseling Center", code: "shcc", coordinates: CLLocationCoordinate2D(latitude: 33.88314, longitude: -117.88425)),
        selected(name: "ECS Lawn", code: "ecsl", coordinates: CLLocationCoordinate2D(latitude: 33.88227, longitude: -117.88405)),
        selected(name: "Kinesiology & Health Science", code: "khs", coordinates: CLLocationCoordinate2D(latitude: 33.88269, longitude: -117.88608)),
        selected(name: "Titan Gym", code: "tg", coordinates: CLLocationCoordinate2D(latitude: 33.88326, longitude: -117.88619)),
        selected(name: "Tuffy Lawn", code: "tufl", coordinates: CLLocationCoordinate2D(latitude: 33.88298, longitude: -117.88704)),
        selected(name: "Student Recereation Center", code: "src", coordinates: CLLocationCoordinate2D(latitude: 33.88292, longitude: -117.88794)),
        selected(name: "State College Parking Structure", code: "scps", coordinates: CLLocationCoordinate2D(latitude: 33.88307, longitude: -117.88873)),
        selected(name: "Golleher Alumni House", code: "goah", coordinates: CLLocationCoordinate2D(latitude: 33.88232, longitude: -117.88938)),
        selected(name: "Lot R", code: "lotr", coordinates: CLLocationCoordinate2D(latitude: 33.88237, longitude: -117.88881)),
        selected(name: "University Police", code: "up", coordinates: CLLocationCoordinate2D(latitude: 33.88308, longitude: -117.88937)),
        selected(name: "Corporate Yard", code: "cy", coordinates: CLLocationCoordinate2D(latitude: 33.88414, longitude: -117.88891)),
        selected(name: "Lot D", code: "lotd", coordinates: CLLocationCoordinate2D(latitude: 33.88416, longitude: -117.88780)),
        selected(name: "Parking & Transporation", code: "pt", coordinates: CLLocationCoordinate2D(latitude: 33.88486, longitude: -117.88943)),
        selected(name: "Lot A South", code: "lotas", coordinates: CLLocationCoordinate2D(latitude: 33.88500, longitude: -117.88871)),
        selected(name: "Titan Tennis Courts", code: "ttc", coordinates: CLLocationCoordinate2D(latitude: 33.88397, longitude: -117.88699)),
        selected(name: "Intramural Field", code: "inmf", coordinates: CLLocationCoordinate2D(latitude: 33.88409, longitude: -117.88609)),
        selected(name: "East Playfield", code: "ep", coordinates: CLLocationCoordinate2D(latitude: 33.88402, longitude: -117.88505)),
        selected(name: "Titan House", code: "thouse", coordinates: CLLocationCoordinate2D(latitude: 33.88386, longitude: -117.88414)),
        selected(name: "Military Science", code: "milt", coordinates: CLLocationCoordinate2D(latitude: 33.88411, longitude: -117.88408)),
        selected(name: "Titan Softball Field", code: "tsf", coordinates: CLLocationCoordinate2D(latitude: 33.88537, longitude: -117.88484)),
        selected(name: "Titan Track Field", code: "ttf", coordinates: CLLocationCoordinate2D(latitude: 33.88532, longitude: -117.88627)),
        selected(name: "Children's Center", code: "cc", coordinates: CLLocationCoordinate2D(latitude: 33.88585, longitude: -117.88843)),
        selected(name: "Lot A", code: "lota", coordinates: CLLocationCoordinate2D(latitude: 33.88718, longitude: -117.88890)),
        selected(name: "Titan Stadium", code: "ts", coordinates: CLLocationCoordinate2D(latitude: 33.88681, longitude: -117.88711)),
        selected(name: "Lot G", code: "lotg", coordinates: CLLocationCoordinate2D(latitude: 33.88836, longitude: -117.88654)),
        selected(name: "Goodwin Field", code: "gf", coordinates: CLLocationCoordinate2D(latitude: 33.88670, longitude: -117.88549)),
        selected(name: "Anderson Family Field", code: "af", coordinates: CLLocationCoordinate2D(latitude: 33.88600, longitude: -117.88525)),
        selected(name: "Arboretum Parking", code: "arbp", coordinates: CLLocationCoordinate2D(latitude: 33.88799, longitude: -117.88514)),
        selected(name: "Fullerton Arboretum", code: "arb", coordinates: CLLocationCoordinate2D(latitude: 33.88815, longitude: -117.88441))

        ]
        
    
    let dictvertices: OrderedDictionary = [
        "College Park Parking South": ["cpps",CLLocationCoordinate2D(latitude: 33.87620, longitude: -117.88337) ],
        "College Park Parking": ["cps", CLLocationCoordinate2D(latitude: 33.87721, longitude: -117.88320) ],
        "College Park": ["cp", CLLocationCoordinate2D(latitude: 33.87756, longitude: -117.88337 ) ],
        "College Park Parking North": ["cpn", CLLocationCoordinate2D(latitude: 33.87787, longitude: -117.88315) ],
        "Mihaylo Hall": ["sgmh", CLLocationCoordinate2D(latitude: 33.87872, longitude: -117.88339) ],
        "Langsdorf Hall": ["lh", CLLocationCoordinate2D(latitude: 33.87900, longitude: -117.88428) ],
        "Carls Jr.": ["cj", CLLocationCoordinate2D(latitude: 33.87938, longitude: -117.88380) ],
        "Lot M": ["lotm", CLLocationCoordinate2D(latitude: 33.87953, longitude: -117.88341)],
        "Gordon Hall": ["gh", CLLocationCoordinate2D(latitude: 33.87967, longitude: -117.88417)],
        "Humanities": ["h", CLLocationCoordinate2D(latitude: 33.88043, longitude: -117.88426)],
        "Modular Complex": ["mc",CLLocationCoordinate2D(latitude: 33.87869, longitude: -117.88598)],
        "Lot C East": ["lotce",CLLocationCoordinate2D(latitude: 33.87851, longitude: -117.88721)],
        "Loc C West": ["lotcw",CLLocationCoordinate2D(latitude: 33.87834, longitude: -117.88886)],
        "Dan Black Hall": ["dbh",CLLocationCoordinate2D(latitude: 33.87914, longitude: -117.88599)],
        "Nutwood Parking Structure": ["nps", CLLocationCoordinate2D(latitude: 33.87900, longitude: -117.88843) ],
        "Greenhouse Complex": ["gc", CLLocationCoordinate2D(latitude: 33.87958, longitude: -117.88703)],
        "McCarthy hall": ["mh",CLLocationCoordinate2D(latitude: 33.87965, longitude: -117.88555)],
        "Quad": ["quad", CLLocationCoordinate2D(latitude: 33.88049, longitude: -117.88535)],
        "Clayes Performing Arts Center": ["cpac",CLLocationCoordinate2D(latitude: 33.88043, longitude: -117.88660)],
        "Visual Arts Complex": ["va", CLLocationCoordinate2D(latitude: 33.88070, longitude: -117.88851) ],
        "Titan Hall": ["thall", CLLocationCoordinate2D(latitude: 33.88081, longitude: -117.89009)],
        "Titan Hall Lot": ["lotth", CLLocationCoordinate2D(latitude: 33.88040, longitude: -117.89048)],
        "Titan Hall ASC": ["asc", CLLocationCoordinate2D(latitude: 33.88122, longitude: -117.89062)],
        "Visitor West Lot": ["lotvw", CLLocationCoordinate2D(latitude: 33.88176, longitude: -117.88923)],
        "Titan Student Union": ["tsu", CLLocationCoordinate2D(latitude: 33.88169, longitude: -117.88846)],
        "Becker Ampitheater": ["ba",CLLocationCoordinate2D(latitude: 33.88119, longitude: -117.88700)],
        "Titan Shop": ["b",CLLocationCoordinate2D(latitude: 33.88181, longitude: -117.88690)],
        "Commons": ["co",CLLocationCoordinate2D(latitude: 33.88151, longitude: -117.88608)],
        "Pollak Library": ["pl",CLLocationCoordinate2D(latitude: 33.88146, longitude: -117.88539)],
        "Education Classroom": ["ec", CLLocationCoordinate2D(latitude: 33.88120, longitude: -117.88446)],
        "Lot I": ["loti",CLLocationCoordinate2D(latitude: 33.88150, longitude: -117.88300)],
        "Lot F": ["lotf", CLLocationCoordinate2D(latitude: 33.88050, longitude: -117.88306)],
        "Eastside South Parking Structure": ["esps", CLLocationCoordinate2D(latitude: 33.88025, longitude: -117.88182)],
        "Eastside North Parking Structure": ["esns", CLLocationCoordinate2D(latitude: 33.88109, longitude: -117.88173)],
        "Resident Lot 2": ["lotr2", CLLocationCoordinate2D(latitude: 33.88201, longitude: -117.88178)],
        "Engineering SE": ["ese", CLLocationCoordinate2D(latitude: 33.88195, longitude: -117.88271)],
        "Engineering SW": ["esw", CLLocationCoordinate2D(latitude: 33.88195, longitude: -117.88322)],
        "Engineering": ["eng",CLLocationCoordinate2D(latitude: 33.88232, longitude: -117.88323)],
        "Computer Science": ["cs",CLLocationCoordinate2D(latitude: 33.88234, longitude: -117.88266)],
        "Engineering NW": ["enw", CLLocationCoordinate2D(latitude: 33.88268, longitude: -117.88323)],
        "Engineering NE": ["ene", CLLocationCoordinate2D(latitude: 33.88266, longitude: -117.88274)],
        "Redwood": ["redwd", CLLocationCoordinate2D(latitude: 33.88243, longitude: -117.88145)],
        "Laurel": ["laur", CLLocationCoordinate2D(latitude: 33.88276, longitude: -117.88197)],
        "Noble": ["nobl", CLLocationCoordinate2D(latitude: 33.88279, longitude: -117.88140)],
        "Gastronome": ["gas",CLLocationCoordinate2D(latitude: 33.88312, longitude: -117.88239)],
        "Resident Lot 1": ["lotr1", CLLocationCoordinate2D(latitude: 33.88392, longitude: -117.88142)],
        "Holly": ["holly",CLLocationCoordinate2D(latitude: 33.88405, longitude: -117.88173)],
        "Pine": ["pine",CLLocationCoordinate2D(latitude: 33.88360, longitude: -117.88275)],
        "Juniper": ["junpr",CLLocationCoordinate2D(latitude: 33.88409, longitude: -117.88234)],
        "Fig": ["fig",CLLocationCoordinate2D(latitude: 33.88444, longitude: -117.88169)],
        "Elm": ["elm",CLLocationCoordinate2D(latitude: 33.88513, longitude: -117.88169)],
        "Birch": ["birch",CLLocationCoordinate2D(latitude: 33.88460, longitude: -117.88214)],
        "Acacia": ["aca",CLLocationCoordinate2D(latitude: 33.88459, longitude: -117.88255)],
        "Manzanita": ["manz",CLLocationCoordinate2D(latitude: 33.88502, longitude: -117.88260)],
        "Willow": ["will",CLLocationCoordinate2D(latitude: 33.88542, longitude: -117.88241)],
        "Oak": ["oak",CLLocationCoordinate2D(latitude: 33.88503, longitude: -117.88213)],
        "Lot J": ["lotj", CLLocationCoordinate2D(latitude: 33.88382, longitude: -117.88299)],
        "Ruby Gerontology Center": ["rg",CLLocationCoordinate2D(latitude: 33.88335, longitude: -117.88325)],
        "Lot H": ["loth", CLLocationCoordinate2D(latitude: 33.88390, longitude: -117.88362)],
        "Student & Health Counseling Center": ["shcc",CLLocationCoordinate2D(latitude: 33.88314, longitude: -117.88425)],
        "ECS Lawn": ["ecsl", CLLocationCoordinate2D(latitude: 33.88227, longitude: -117.88405)],
        "Kinesiology & Health Science": ["khs",CLLocationCoordinate2D(latitude: 33.88269, longitude: -117.88608)],
        "Titan Gym": ["tg",CLLocationCoordinate2D(latitude: 33.88326, longitude: -117.88619)],
        "Tuffy Lawn": ["tufl",CLLocationCoordinate2D(latitude: 33.88298, longitude: -117.88704)],
        "Student Recereation Center": ["src",CLLocationCoordinate2D(latitude: 33.88292, longitude: -117.88794)],
        "State College Parking Structure": ["scps",CLLocationCoordinate2D(latitude: 33.88307, longitude: -117.88873)],
        "Golleher Alumni House": ["goah",CLLocationCoordinate2D(latitude: 33.88232, longitude: -117.88938)],
        "Lot R": ["lotr",CLLocationCoordinate2D(latitude: 33.88237, longitude: -117.88881)],
        "University Police": ["up",CLLocationCoordinate2D(latitude: 33.88308, longitude: -117.88937)],
        "Corporate Yard": ["cy",CLLocationCoordinate2D(latitude: 33.88414, longitude: -117.88891)],
        "Lot D": ["lotd",CLLocationCoordinate2D(latitude: 33.88416, longitude: -117.88780)],
        "Parking & Transporation": ["pt",CLLocationCoordinate2D(latitude: 33.88486, longitude: -117.88943)],
        "Lot A South": ["lotas",CLLocationCoordinate2D(latitude: 33.88500, longitude: -117.88871)],
        "Titan Tennis Courts": ["ttc",CLLocationCoordinate2D(latitude: 33.88397, longitude: -117.88699)],
        "Intramural Field": ["inmf",CLLocationCoordinate2D(latitude: 33.88409, longitude: -117.88609)],
        "East Playfield": ["ep",CLLocationCoordinate2D(latitude: 33.88402, longitude: -117.88505)],
        "Titan House": ["thouse",CLLocationCoordinate2D(latitude: 33.88386, longitude: -117.88414)],
        "Military Science": ["milt",CLLocationCoordinate2D(latitude: 33.88411, longitude: -117.88408)],
        "Titan Softball Field": ["tsf",CLLocationCoordinate2D(latitude: 33.88537, longitude: -117.88484)],
        "Titan Track Field": ["ttf",CLLocationCoordinate2D(latitude: 33.88532, longitude: -117.88627)],
        "Children's Center": ["cc",CLLocationCoordinate2D(latitude: 33.88585, longitude: -117.88843)],
        "Lot A": ["lota",CLLocationCoordinate2D(latitude: 33.88718, longitude: -117.88890)],
        "Titan Stadium": ["ts",CLLocationCoordinate2D(latitude: 33.88681, longitude: -117.88711)],
        "Lot G": ["lotg",CLLocationCoordinate2D(latitude: 33.88836, longitude: -117.88654)],
        "Goodwin Field": ["gf", CLLocationCoordinate2D(latitude: 33.88670, longitude: -117.88549)],
        "Anderson Family Field": ["af",CLLocationCoordinate2D(latitude: 33.88600, longitude: -117.88525)],
        "Arboretum Parking": ["arbp", CLLocationCoordinate2D(latitude: 33.88799, longitude: -117.88514)],
        "Fullerton Arboretum": ["arb",CLLocationCoordinate2D(latitude: 33.88815, longitude: -117.88441)]
    ] 
 
}

#import "./../templates/index.typ": *

#let dateLastModified = datetime.today()
#let thisSection = "Preliminary Cockpit Preparation"

#let sop--preliminary-cockpit-preparation(operatorAbbreviated, aircraft, document, documentAbbreviated, h1, h1Abbreviated, h2, h2Abbreviated, h3, h3Abbreviated, h4) = {


set page("us-letter")
set page(foreground: image("./images/cover_preliminary_cockpit_preparation.png"))
text[Preliminary cockpit preparation]

text[For simulation purposes]

pagebreak()
set page(
  paper: "a5",
  foreground:none,
  header: pageheader(aircraft, document, h1, h2, h3, thisSection),
  footer: pagefooter(operatorAbbreviated, aircraft, documentAbbreviated, h1Abbreviated, h2Abbreviated, h3Abbreviated, dateLastModified)
)

sectionheadingbox[General]
indent[Items marked by asterisks \(\*\) are the only steps to be completed after a transit stop without flight crew change. Otherwise, the new flight crew performs all the items. \ 
The flight crew performs the preliminary cockpit preparation to ensure that all required safety checks
are completed. \ 
The safety checks prevent the inadvertent operation of aircraft systems, danger to the aircraft, and danger to the personnel.
]

sectionheadingbox[Aircraft Setup]
indent([
  #smallheading[General]

  #indent(
    warningbox[Do not pressurize the hydraulic systems until clearance is obtained from ground personnel.]
  )
  #smallheading[Eng]

  #indent([
    #item("Eng 1,2 master levers", "OFF", "CM2", false)

    #item("ENG MODE selector", "NORM", "CM2", true)
  ])

  #smallheading[Weather Radar]
  #indent([
    #item("* XWR/PWS sw", "OFF", "CM2", false)

    #item("* CAPT DISPLAY mode selector", "OFF", "CM2", false)

    #item("* F/O DISPLAY mode selector", "OFF", "CM2", false)

    #item("* GAIN knob", "AUTO", "CM2", false)

    #item("* TURB sw", "AUTO", "CM2", true)
  ])
  #smallheading[Weather Radar]
  #indent([
    #item("* RADAR sw", "OFF", "CM2", false)

    #item("* WINDSHEAR / PWS sw", "OFF", "CM2", false)

    #item("* GAIN knob", "AUTO/CAL", "CM2", false)

    #item("* MODE selector", "AS RQRD", "CM2", true)
  ])
  #smallheading[L/G]
  #indent([
    #item("L/G lever", "DOWN", "CM2", true)
  ])
  #smallheading[WIPERS]
  #indent([
    #item("Both WIPER selectors", "OFF", "CM2", true)
  ])
  #pagefooter(operatorAbbreviated, aircraft, documentAbbreviated, h1Abbreviated, h2Abbreviated, h3Abbreviated, dateLastModified)
])
}

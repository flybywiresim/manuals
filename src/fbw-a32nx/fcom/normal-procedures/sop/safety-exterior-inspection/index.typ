#import "./../../../templates/index.typ": *

#let dateLastModified = datetime.today()
#let thisSection = "Safety Exterior Inspection"
#let thisSectionAbbreviated = "-03"
#let sectionEndLabel = <NOR-PRO-SOP-03-END>

#let sop--safety-exterior-inspection(operatorAbbreviated, aircraft, document, documentAbbreviated, h1, h1Abbreviated, h2, h2Abbreviated, h3, h3Abbreviated) = {

set page("us-letter")
set page(foreground: image("./images/cover_safety_exterior_inspection.png"))
text[Safety Exterior Inspection]

text[For simulation purposes]

let subsection = counter("subsection")
subsection.update(0)
pagebreak()
set page(
  paper: "a5",
  foreground:none,
  header: pageheader(aircraft, document, h1, h2, h3, thisSection),
  footer: pagefooter(operatorAbbreviated, aircraft, documentAbbreviated, h1Abbreviated, h2Abbreviated, h3Abbreviated+thisSectionAbbreviated, sectionEndLabel, dateLastModified)
)

counter(page).update(1)

sectionheadingbox[SAFETY EXTERIOR INSPECTION]
indent[
  #smallheading[GENERAL]

  Items marked by asterisks \(\*\) are the only steps to be completed after a transit stop without flight crew change. Otherwise, the new flight crew performs all the items. \

  Safety exterior inspections ensure that the aircraft and the external environment of the aircraft are safe for operation. When the flight crew arrives at the aircraft, they must check for, or be informed of any obstructions near the aircraft, engineering activity, or refueling activity, etc.

  #smallheading[WHEEL CHOCKS]
  #indent[
    #item("WHEEL CHOCKS", "CHECK", "CM2", true)

    #L2()#italic[
      If the wheel chocks are not in position, the flight crew must check that the parking brake is set with sufficient accumulator pressure.
    ]
  ]
  
  #smallheading[LANDING GEAR DOORS]
  #indent[
    #item("LANDING GEAR DOORS", "CHECK POSITION", "CM2", true)

    #warningbox[If any landing gear door is open, do not pressurize the hydraulic systems until clearance is obtained from ground personnel.]
  ]

  #smallheading[APU AREA]
  #indent[
    #item("APU AREA", "CHECK", "CM2", true)

    #L2()#italic[
      Observe that the APU inlet and outlet are clear.
    ]
  ]
]
subsection.step()

context[#metadata("End of section Safety Exterior Inspection") #sectionEndLabel]
}

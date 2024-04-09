#import "./../templates/index.typ": *

#let sop--preliminary-cockpit-preparation(document, aircraft, h1,h2,h3,h4) = {


set page("us-letter")
set page(foreground: image("./images/cover_preliminary_cockpit_preparation.png"))
text[Preliminary cockpit preparation]

text[For simulation purposes]

pagebreak()
set page(
  paper: "a5",
  foreground:none,
)

pageheader(document, aircraft, h1, h2, h3, "- Preliminary Cockpit Preparation",)

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
    #item("Eng 1,2 master levers", "off", "CM2", false)

    #item("ENG MODE selector", "Norm", "CM2", true)
  ])

  #smallheading[Weather Radar]
  #indent([
    #item("* XWR/PWS sw", "off", "CM2", false)

    #item("* CAPT DISPLAY mode selector", "off", "CM2", false)

    #item("* F/O DISPLAY mode selector", "off", "CM2", false)

    #item("* GAIN knob", "AUTO", "CM2", false)

    #item("* TURB sw", "AUTO", "CM2", true)
    ])
])
}

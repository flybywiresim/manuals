#import "./../templates/index.typ": *

#set page("us-letter")
#set page(foreground: image("./images/cover_preliminary_cockpit_preparation.png"))
Preliminary cockpit preparation

For simulation purposes
#set page(foreground: none)
#set page(paper: "a5")

#pagebreak()

#headerbox[Aircraft Setup]
#indent([
  #h3[General]

  #indent(
    warningbox[Do not pressurize the hydraulic systems until clearance is obtained from ground personnel.]
  )
  #h3[Eng]

  #indent([
    #item("Eng 1,2 master levers", "off", "CM2", false)

    #item("ENG MODE selector", "Norm", "CM2", true)
  ])

  #h3[Weather Radar]
  #indent([
    #item("XWR/PWS sw", "off", "CM2", false)

    #item("CAPT DISPLAY mode selector", "off", "CM2", false)

    #item("F/O DISPLAY mode selector", "off", "CM2", false)

    #item("GAIN knob", "AUTO", "CM2", false)

    #item("TURB sw", "AUTO", "CM2", true)
    ])
])

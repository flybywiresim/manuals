#import "./../../../templates/index.typ": *

#let dateLastModified = datetime.today()
#let thisSection = "Preliminary Cockpit Preparation"

#let sop--preliminary-cockpit-preparation(operatorAbbreviated, aircraft, document, documentAbbreviated, h1, h1Abbreviated, h2, h2Abbreviated, h3, h3Abbreviated) = {


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
indent[
  #smallheading[General]

  #indent[
    #warningbox[
      Do not pressurize the hydraulic systems until clearance is obtained from ground personnel.
    ]
  ]
  #smallheading[Eng]

  #indent[
    #item("Eng 1,2 MASTER LEVERS", "OFF", "CM2")
    #item("ENG MODE selector", "NORM", "CM2", true)
  ]

  #smallheading[Weather Radar]
  #indent[
    #item("* RADAR sw", "OFF", "CM2")
    #item("* WINDSHEAR / PWS sw", "OFF", "CM2")
    #item("* GAIN knob", "AUTO/CAL", "CM2")
    #item("* MODE selector", "AS RQRD", "CM2", true)
  ]
  #smallheading[L/G]
  #indent[
    #item("L/G lever", "DOWN", "CM2", true)
  ]
  #smallheading[WIPERS]
  #indent[
    #item("Both WIPER selectors", "OFF", "CM2", true)
  ]
]

pagebreak()
sectionheadingbox[Batteries Check/External Power]
indent[
  #squaredot[
    If the aircraft has not been electrically supplied for 6 h or more, perform the following check:
  ]
  #indent[
    #item("BAT 1 pb-sw and BAT 2 pb-sw", "CHECK OFF", "CM2")
    #item("BAT 1 and 2 VOLTAGE", "CHECK ABOVE 25.5 V", "CM2", true)

    #L2()#italic[Battery voltage above 25.5 V ensures a charge above 50 %]

    #L1()#squaredot[If the battery voltage is at or below 25.5 V:]

    #indent[
      A charging cycle of about 20 min is required.

      #item("BAT 1 pb-sw and BAT 2 pb-sw", "AUTO", "CM2")
      #item("EXT PWR pb-sw", "ON", "CM2", true)

      #L2()Check on #underline[ELEC] SD page, #italic[that the battery contactor is closed and the batteries are charging.]

      #L1()#rounddot[After 20 min:]

      #indent[
        #item("BAT 1 pb-sw and BAT 2 pb-sw.", "OFF", "CM2")
        #item("BAT 1 and 2 VOLTAGE.", "CHECK ABOVE 25.5 V", "CM2")
        #item("BAT 1 pb-sw and BAT 2 pb-sw.", "AUTO", "CM2", true)
      ]
    ]
    #squaredot[If the battery voltage is above 25.5 V:]
    #indent[
      #item("BAT 1 pb-sw and BAT 2 pb-sw.", "AUTO", "CM2", true)

      #L2()#italic[
        If the APU is started on batteries only, it should be started within 30 min after the selection of batteries to AUTO (35 min after battery selection to AUTO, the battery charge is less than 25 % of maximum capacity)
      ]
    ]
  ]
  #L1()#squaredot[
    If the aircraft has been electrically supplied during the last 6 h:
    ]
  #indent[
    #item("BAT 1 pb-sw and BAT 2 pb-sw.", "AUTO", "CM2", true)

    #rounddot[If the #green[AVAIL] light is on:]
    #indent[
      #item("EXT PWR pb-sw", "ON", "CM2", true)
    ]
  ]
]

pagebreak()
sectionheadingbox[APU Fire Test/APU Start]
indent[
  #smallheading[RMP]
  #indent[
    #item("RMP", "CHECK ON/SET", "CM2")
    #item("Green NAV light", "CHECK OFF", "CM2")
    #item("SEL light", "CHECK OFF", "CM2")
    #item("COM FREQUENCIES", "TUNE", "CM2", true)

    #L2()#italic[
      Use VHF 1 for ATC (only VHF 1 is available in emergency electrical configuration), VHF 2 for ATIS and company frequencies. VHF 3 is normally devoted to ACARS.
      ]
  ]
  #smallheading[APU]
  #indent[
    #warningbox[
      The automatic shutdown of the APU and the discharge of the APU fire extinguisher bottle may occur if the flight crew presses the APU FIRE test pb for more than 3 seconds.
    ]

    #item("APU FIRE pb-sw", "CHECK IN and GUARDED", "CM2")
    #item("APU AGENT light", "CHECK OFF", "CM2")
    #item("APU FIRE TEST pb", "PRESS and MAINTAIN", "CM2", true)
  ]
]
}

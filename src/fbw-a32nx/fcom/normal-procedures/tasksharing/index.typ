#let operatorAbbreviated = "FBW"
#let aircraft = "A32NX"
#let document = [Flight Crew\ Operating Manual]
#let documentAbbreviated = "FCOM"
#let h1 = "Procedures"
#let h1Abbreviated = "PRO"
#let h2 = "Normal Procedures"
#let h2Abbreviated = "NOR"
#let h3 = "Tasksharing"
#let h3Abbreviated = "TSK"
#let sectionEndLabel = <NOR-PRO-TSK-END>

#let tasksharing() = {

set text(
  font: "Familjen Grotesk",
  size: 8pt,
  hyphenate: false,
)
set page(
  paper: "a5",
  margin: (inside: 1.7cm, outside: 0.5cm, top: 3.0cm, bottom: 1.8cm),
  header-ascent: 15%,
  footer-descent: 10%,
)
set par(
  justify: true,
  leading: 0.52em,
)

import "./../../templates/index.typ": *
let dateLastModified = datetime.today()

set page(
  paper: "a5",
  foreground:none,
  header: pageheader(aircraft, document, h1, h2, h3),
  footer: pagefooter(operatorAbbreviated, aircraft, documentAbbreviated, h1Abbreviated, h2Abbreviated, h3Abbreviated, sectionEndLabel, dateLastModified),
  numbering: "1 / 1"
)

show ref: it => {
  let fi = figure
  let el = it.element
  if el != none and el.func() == fi {
    // Override figure references.
    numbering(
      el.numbering,
      ..counter(fi).at(el.location())
    )
  } else {
    // Other references as usual.
    it
  }
}
set figure(numbering: "(1)")

let subsection = counter("subsection")
subsection.update(0)

section(subsection, [
  #sectionheadingbox[SAFETY EXTERIOR INSPECTION <PRO-NOR-TSK-A>]

  #tasksharingtable(
    "",
    "CM1", "CM2",
    [], [#item("* WHEEL CHOCKS", "CHECK")],
    [], [#item("* L/G DOORS", "CHECK POSITION")],
    [], [#item("* APU AREA", "CHECK")],
  )
])

section(subsection, [
  #sectionheadingbox[PRELIMINARY COCKPIT PREPARATION <PRO-NOR-TSK-B>]

  #tasksharingtable(
    "AIRCRAFT SETUP:", false,
    "CM1", "CM2",
    [], [#item("ENG 1, 2 MASTER LEVERS", "OFF")],
    [], [#item("ENG MODE selector", "NORM")],
    [], [#item("* WEATHER RADAR", "OFF")],
    [], [#item("* WINDSHEAR/PWS " + optiontriangle() + " sw", "OFF")],
    [], [#item("L/G lever", "DOWN")],
    [], [#item("Both WIPER selectors", "OFF")],
  )

  #tasksharingtable(
    "BATTERIES/EXTERNAL POWER:", false,
    "CM1", "CM2",
    [], [#item("BAT", "CHECK/AUTO")],
    [], [#item("EXT PWR pb", "ON")],
  )

  #tasksharingtable(
    "APU FIRE TEST/APU START:", false,
    "CM1", "CM2",
    [], [#item("RMP", "CHECK ON/SET")],
    [], [#item("APU FIRE TEST", "PERFORM")],
    [], [#item("APU", "START")],
    [], [
      #rounddot([When the APU is AVAIL:], false)
      #linebreak()
      #item("AIR COND panel", "SET")
      ],
    [], [#item("* EXT PWR pb", "AS RQRD")],
  )

  #tasksharingtable(
    "ADIRS:", false,
    "CM1", "CM2",
    [], [#item("All IR MODE selectors", "NAV")],
  )

  #tasksharingtable(
    "COCKPIT LIGHTS:", false,
    "CM1", "CM2",
    [#item("* COCKPIT LIGHTS", "AS RQRD")], [#item("* COCKPIT LIGHTS", "AS RQRD")],
  )

  #tasksharingtable(
    "EFB INITIALIZATION:", false,
    "CM1", "CM2",
    [#item("All EFB", "START")], [#item("All EFB", "START")],
    [#item("EFB/eQRH Version", "CHECK")], [#item("EFB/eQRH Version", "CHECK")],
    combinedcell[
      #rounddot([If EFB SYNCHRO AVNCS #optiontriangle() is used:], false)
      #linebreak()
      #underline[FMGS PRE-INITIALIZATION:]
    ],
    table.hline(stroke: none),
    [#indent(item("* ENGINE & AIRCRAFT TYPE", "CHECK"))],[],
    table.hline(stroke: none),
    [#indent(item("* DATABASE VALID", "CHECK"))],[],
    table.hline(stroke: none),
    combinedcell([
        #item("* FLT NBR & FROM/TO", "INSERT/CHECK")
        #item("* FLT NBR & FROM/TO", "INSERT/CHECK")
    ], center),
    [#item("* EFB SYNCHRO AVIONICS", "CLICK")], [#item("* EFB SYNCHRO AVIONICS", "CLICK")],
    [#item("* EFB STATUS page", "INSERT/CHECK")], [#item("* EFB STATUS page", "INSERT/CHECK")],
  )

  #tasksharingtable(
    "AIRCRAFT ACCEPTANCE:", false,
    "CM1", "CM2",
    [#item("* RCL pb", "PRESS 3 s")], [],
    combinedcell([
        #item("* LOGBOOK AND MEL/CDL ITEMS", "CHECK")
    ], center),
    combinedcell([
        #item("* AIRCRAFT CONFIGURATION SUMMARY", "CHECK")
    ], center),
    combinedcell([
        #item("* OEB", "CHECK")
    ], center),
    [#item("* AIRCRAFT ACCEPTANCE", "PERFORM")], [],
  )

  #tasksharingtable(
    "PRELIMINARY PERFORMANCE DETERMINATION:", false,
    "CM1", "CM2",
    [#item("* AIRFIELD DATA", "OBTAIN")], [#item("* AIRFIELD DATA", "OBTAIN")],
    combinedcell[
      #rounddot([If the LOADSHEET application is used], false)
    ],
    table.hline(stroke: none),
    [#text(size: 7.5pt, item("* PRELIMINARY LOADING", "COMPUTE/CROSSCHECK"))],[#text(size: 7.5pt, item("* PRELIMINARY LOADING", "COMPUTE/CROSSCHECK"))],
    [#item("* MEL/CDL ITEMS", "CHECK ACTIVATED")],[#item("* MEL/CDL ITEMS", "CHECK ACTIVATED")],
    combinedcell([
        #item("NAV CHARTS CLIPBOARD", "PREPARE")
    ], center),
    [#item("* PRELIM T.O PERF DATA", "COMPUTE")],[#item("* PRELIM T.O PERF DATA", "COMPUTE")],
    combinedcell([
        #item("* PRELIM T.O PERF DATA.", "CROSSCHECK")
    ], center),
  )

  #tasksharingtable(
    "BEFORE WALKAROUND:", false,
    "PF", "PM",
    [], [#text(size: 7.5pt, item("* ECAM OXY PRESS/HYD QTY/ENG OIL QTY", "CHECK"))],
    [], [#item("FLAPS", "CHECK POSITION")],
    [], [#item("* SPEED BRAKE lever", "CHECK RET AND DISARMED")],
    [], [#item("* ACCU PRESS", "CHECK")],
    [], [#item("* PARK BRK handle", "ON")],
    [], [#item("* BRAKES PRESS indicator", "CHECK")],
    [], [#item("EMER EQPT", "CHECK")],
    [], [#item("RAIN REPELLENT " + optiontriangle() + " ", "CHECK")],
    [], [#item("C/B PANELS", "CHECK")],
    [], [#item("* GEAR PINS", "CHECK ONBOARD/STOWED")],
    [], [#item("* EXTERIOR WALKAROUND", "PERFORM")],
  )
])


section(subsection, [
  #sectionheadingbox[COCKPIT PREPARATION]

  #tasksharingtable(
    "OVERHEAD PANEL:", false,
    "PF", "PM",
    [
      #text("As a general rule, during the scan sequence:")
      #linebreak()
      #text(size: 7.5pt, item("* All white lights (except MAINTENANCE panel)", "OFF"))], [],
    [#item("* RCDR GND CTL pb-sw", "ON")], [],
    [#item("CVR TEST pb", "PRESS")], [],
    [#item("CAPT & PURS/CAPT sw", "AS RQRD")], [],
    [#item("EXTERIOR LIGHTS", "SET")], [],
    [#item("* SIGNS panel", "SET")], [],
    [#item("PROBE/WINDOW HEAT pb-sw", "AUTO")], [],
    [#item("LDG ELEV", "AUTO")], [],
    [#item("* PACK FLOW", "AS RQRD")], [],
    [#item("ELEC panel", "CHECK")], [],
    [#item("BAT", "CHECK")], [],
    [#item("ENG FIRE", "CHECK/TEST")], [],
    [#item("AUDIO SWITCHING", "NORM")], [],
    [#item("CARGO AIR COND panel", "AS RQRD")], [],
    [#item("PA (3rd occupant)", "RECEPT")], [],
    [#item("MAINT panel", "CHECK")], [],
  )

  #tasksharingtable(
    "CTR INSTRUMENT PANEL:", false,
    "PF", "PM",
    [#item("* ISIS/STBY INSTRUMENTS", "CHECK")], [],
    [#item("* CLOCK", "CHECK/SET")], [],
    [#item("* A/SKID & N/W STRG sw", "ON")], [],
  )

  #tasksharingtable(
    "PEDESTAL:", false,
    "PF", "PM",
    [#item("ACP", "CHECK ON/SET")], [],
    [#item("* COCKPIT DOOR sw", "NORM")], [],
    [#item("SWITCHING PANEL", "NORM")], [],
    [#item("* THRUST LEVERS", "IDLE")], [],
    [#item("* ENG MASTER LEVERS", "OFF")], [],
    [#item("* ENG MODE selector", "NORM")], [],
    [#item("* ACCU PRESS", "CHECK")], [],
    [#item("* PARK BRK handle", "AS RQRD")], [],
    [#item("* BRAKES PRESS", "CHECK")], [],
    [#item("GRAVITY GEAR EXTN", "CHECK STOWED")], [],
    [#item("* ATC", "STBY")], [],
    [#item("* MSG RECORD (MCDU)", "ERASE")], [],
    [#item("* FMS", "PREPARE")], [],
    [], [#item("* FMS PREPARATION", "CROSSCHECK")],
    [], [#item("* EFB/MCDU GREEN DOT", "COMPARE")],
  )

  #tasksharingtable(
    "GLARESHIELD:", false,
    "PF", "PM",
    combinedcell[#rounddot([When both flight crewmembers are seated:],false)],
    [#item("* BAROMETRIC REFERENCE", "SET/CROSSCHECK")], [#item("* BAROMETRIC REFERENCE", "SET/CROSSCHECK")],
    [#item("* FD", "CHECK ON")], [#item("* FD", "CHECK ON")],
    [#item("* LS/ILS", "AS RQRD")], [#item("* LS/ILS", "AS RQRD")],
    [#item("* ND mode and range", "AS RQRD")], [#item("* ND mode and range", "AS RQRD")],
    [#item("* VOR/ADF selector", "AS RQRD")], [#item("* VOR/ADF selector", "AS RQRD")],
    [#item("* FCU", "SET")], [],
  )

  #tasksharingtable(
    "LATERAL CONSOLE AND PF/PM INSTRUMENT PANELS:", false,
    "PF", "PM",
    combinedcell[#rounddot([When both flight crewmembers are seated:],false)],
    [#item("OXYGEN MASK", "TEST")], [#item("OXYGEN MASK", "TEST")],
    [#item("PFD-ND brightness", "AS RQRD")], [#item("PFD-ND brightness", "AS RQRD")],
    [#item("* LS/ILS", "AS RQRD")], [#item("* LS/ILS", "AS RQRD")],
    [#item("LOUDSPEAKER knob", "SET")], [#item("LOUDSPEAKER knob", "SET")],
    [#item("* PFD-ND", "CHECK")], [#item("* PFD-ND", "CHECK")],
    [#item("* LDG ELEV (ECAM)", "CHECK AUTO")], [#item("* IRS ALIGN", "CHECK")],
    [#item("* ECAM STATUS", "CHECK")], [],
    [#item("FOB", "CHECK")], [#item("FOB", "CHECK")],
    combinedcell([#item("* DEPARTURE BRIEFING", "PERFORM")],center),
    [#item("* COCKPIT PREPARATION C/L", "COMPLETE")], [#item("* COCKPIT PREPARATION C/L", "COMPLETE")],
  )
])

section(subsection, [
  #sectionheadingbox[BEFORE PUSHBACK OR START]

  #tasksharingtable(
    "BEFORE PUSHBACK/START CLEARANCE:", false,
    "PF", "PM",
    [#item("FINAL LOADSHEET", "CHECK")], [#item("FINAL LOADSHEET", "CHECK")],
    [#item("FUEL ON BOARD", "CHECK")], [#item("FUEL ON BOARD", "CHECK")],
    combinedcell[
      #rounddot([If takeoff conditions changed:], false)
    ],
    table.hline(stroke: none),
    [#item("FINAL T.O PERF DATA", "RECOMPUTE")], [#item("FINAL T.O PERF DATA", "RECOMPUTE")],
    table.hline(stroke: none),
    [#item("FMS T.O DATA", "REVISE")], [],
    [], [#item("FINAL T.O PERF DATA", "CROSSCHECK")],
    [], [#item("EFB/MCDU GREEN DOT", "COMPARE")],
    [#item("SEATING POSITION", "ADJUST")], [#item("SEATING POSITION", "ADJUST")],
    [#item("HUD " + optiontriangle() + " ", "DEPLOY/ADJUST")], [#item("HUD " + optiontriangle() + " ", "DEPLOY/ADJUST")],
    [#item("FMS PERF TO page", "SELECT")], [#item("FMS F-PLN page", "SELECT")],
    [], [#item("AIR CONDITIONING UNITS", "CHECK DISCONNECTED")],
    [], [#item("EXT PWR", "CHECK " + textgreen("AVAIL"))],
    [], [#item("EXT PWR DISCONNECTION", "REQUEST ")],
  )

  #tasksharingtable(
    "AT PUSHBACK/START CLEARANCE:", false,
    "PF", "PM",
    [], [#item("PUSHBACK/START CLEARANCE", "OBTAIN")],
    [#item("BEACON sw", "ON")], [],
    [], [#item("ATC", "SET FOR OPERATIONS")],
    [#item("WINDOWS/DOORS", "CHECK CLOSED")], [#item("WINDOWS/DOORS", "CHECK CLOSED")],
    [#item("SLIDES", "CHECK ARMED")], [#item("SLIDES", "CHECK ARMED")],
    [#item("THRUST LEVERS", "IDLE")], [],
    [#item("ACCU PRESS", "CHECK")], [],
    combinedcell[
      #rounddot([If pushback is not required:], false)
    ],
    table.hline(stroke: none),
    [#item("PARK BRK handle", "ON")], [],
    table.hline(stroke: none),
    [#item("BEFORE START C/L", "COMPLETE")], [#item("BEFORE START C/L", "COMPLETE")],
    combinedcell[
      #rounddot([If pushback is required:], false)
    ],
    table.hline(stroke: none),
    [#item(textgreen("N/W STEER DISC ") + "MEMO", "ON")], [],
    table.hline(stroke: none),
    [#item("BEFORE START C/L", "COMPLETE")], [#item("BEFORE START C/L", "COMPLETE")],
    table.hline(stroke: none),
    [#item("PARK BRK handle", "OFF")], [],
    table.hline(stroke: none),
    [#indent(rounddot([When pushback is completed:], false))], [],
    table.hline(stroke: none),
    [#indent(item("PARK BRK handle", "ON"))], [],
  )
])

section(subsection, [
  #sectionheadingbox[ENGINE START]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [#item("THRUST LEVERS", "IDLE")], [],
    [#item("ENG MODE selector.", "IGN/START")], [],
    [#item("ENGINE 2 START", "ANNOUNCE")], [],
    [#item("ENG 2 MASTER LEVER", "ON")], [],
    [#item("ENG IDLE PARAMETERS", "CHECK")], [],
    [REPEAT THE START SEQUENCE FOR ENG 1], [],
  )
])

section(subsection, [
  #sectionheadingbox[AFTER START]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [#item("ENG MODE selector", "NORM")], [],
    [#item("APU BLEED pb-sw", "OFF")], [#item("GND SPLRS", "ARM")],
    [#item("ANTI ICE", "AS RQRD")], [#item("RUD TRIM", "CHECK ZERO")],
    [], [#item("FLAPS", "SET")],  
    [#rounddot([If the APU is not required:], false)], [#item("PITCH TRIM", "SET")],
    table.hline(stroke: none),
    [#item("APU MASTER SW pb-sw", "OFF")], [],
    [#item("ECAM STATUS", "CHECK")], [#item("ECAM STATUS", "CHECK")],
    [#item(textamber("NW STRG DISC ") + "MEMO", "CHECK NOT DISPLAYED")], [],
    [#item("CLEAR TO DISCONNECT", "ANNOUNCE")], [],
    [#item("AFTER START C/L", "COMPLETE")], [#item("AFTER START C/L", "COMPLETE")],
  )
])

section(subsection, [
  #sectionheadingbox[TAXI]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [], [#item("TAXI CLEARANCE", "OBTAIN")],
    [#item("EXTERIOR LIGHTS", "SET")], [],
    [#item("PARK BRK handle", "OFF")], [],
    [#item("BRAKES", "CHECK")], [#item("BRAKE FAN " + optiontriangle() + " pb", "AS RQRD")],
    [#item("F/CTL", "CHECK")], [#item("F/CTL", "CHECK")],
    [], [#item("ATC CLEARANCE", "CONFIRM")],
    [], [#item("FMS F-PLN/SPD", "CHECK")],
    [], [#item("FCU ALT/HDG", "SET")],
    [], [#item("BOTH FD", "CHECK ON")],
    [#item("PFD/ND", "CHECK")], [#item("PFD/ND", "CHECK")],
    combinedcell([
      #item("DEPARTURE BRIEFING", "CONFIRM")], center
    ),
    [], [#item("AUTO BRK MAX pb-sw", "ON")],
    [#item("TERR ON ND " + optiontriangle() + " ", "AS RQRD")], [#item("TERR ON ND " + optiontriangle() + " ", "AS RQRD")],
    [], [#item("ATC CODE/MODE", "CONFIRM/SET FOR TAKEOFF")],
    [], [#item("ENG MODE selector", "AS RQRD")],
    [], [#item("WEATHER RADAR", "ON")],
    [], [#item("PREDICTIVE WINDSHEAR SYSTEM " + optiontriangle() + " ", "ON")],
    [], [#item("T.O CONFIG pb", "TEST")],
    [], [#item("T.O MEMO", "CHECK NO BLUE")],
    [#item("CABIN REPORT", "RECEIVE")], [#item("CABIN REPORT", "RECEIVE")],
    [#item("TAXI C/L", "COMPLETE")], [#item("TAXI C/L", "COMPLETE")],
  )
])

section(subsection, [
  #sectionheadingbox[DEPARTURE CHANGE]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [#item("FINAL T.O PERF DATA", "RECOMPUTE")], [#item("FINAL T.O PERF DATA", "RECOMPUTE")],
    [], [#item("FINAL T.O. DATA", "REVISE")],
    [#item("FMS REVISED T.O PERF DATA", "CROSSCHECK")], [],
    [#item("EFB/MCDU GREEN DOT", "COMPARE")], [],
    [], [#item("FLAPS lever", "AS APPROPRIATE")],
    [], [#item("FMS F-PLN/SPD", "CHECK")],
    [#item("EFB/MCDU GREEN DOT", "COMPARE")], [],
    combinedcell([
      #item("RE-BRIEFING", "COMPLETE")], center
    ),
    [#item("DEPARTURE CHANGE C/L", "COMPLETE")], [#item("DEPARTURE CHANGE C/L", "COMPLETE")],
  )
])

section(subsection, [
  #sectionheadingbox[BEFORE TAKEOFF]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [], [#rounddot("If the brake fans " + optiontriangle() + " are set to ON and the temperature of all brakes is below 150°C:", false)],
    table.hline(stroke: none),
    [], [#item("BRAKE FAN pb", "OFF")],
    [], [#item("LINE-UP CLEARANCE", "OBTAIN")],
    [], [#item("TCAS", "TA ONLY or TA/RA")],
    [#item("TAKEOFF RUNWAY", "CONFIRM")], [#item("TAKEOFF RUNWAY", "CONFIRM")],
    [#item("APPROACH PATH", "CLEAR OF TRAFFIC")], [#item("APPROACH PATH", "CLEAR OF TRAFFIC")],
    [#item("EXTERIOR LIGHTS", "SET")], [#item("PACK 1 and 2", "AS RQRD")],
    [#item("SLIDING TABLE", "STOW")], [#item("SLIDING TABLE", "STOW")],
    [#item("All EFB TRANSMITTING MODE", "AS RQRD")], [#item("ALL EFB TRANSMITTING MODE", "AS RQRD")],
    [#item("All EFB (with no mounted equipment)", "STOW")], [#item("ALL EFB (with no mounted equipment)", "STOW")],
    [#item("THRUST BUMP " + optiontriangle() + " ", "AS RQRD")], [],
    [], [#item("CABIN CREW", "ADVISE")],
    [#item("LINE UP C/L", "COMPLETE")], [#item("LINE UP C/L", "COMPLETE")],

  )
])

section(subsection, [
  #sectionheadingbox[TAKEOFF]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [], [#item("TAKEOFF CLEARANCE", "OBTAIN")],
    [#item("EXTERIOR LIGHTS", "SET")], [],
    [#item("TAKEOFF", "ANNOUNCE")], [],
    [#item("THRUST", "50% N1 (1.05 EPR)")], [],
    [#item("SIDESTICK", "AS RQRD")], [],
    [#item("BRAKES", "RELEASE")], [],
    [#item("THRUST LEVERS", "FLX OR TOGA")], [#item("CHRONO", "START")],
    combinedcell([
      #text(weight: "bold", "The captain places hand on thrust levers until V1")], center
    ),
    [#item("DIRECTIONAL CONTROL", "USE RUDDER")], [],
    [], [#item("PFD/ND", "MONITOR")],
    combinedcell[
      #rounddot("Below 80 kt:", false)
    ],
    table.hline(stroke: none),
    [], [
      #item("TAKEOFF THRUST", "SET")
      #item("THRUST SET", "ANNOUNCE")
      #item("PFD and ENG indications", "MONITOR")
      ],
    combinedcell[
      #rounddot("At 80 kt:", false)
    ],
    table.hline(stroke: none),
    [#item("SIDESTICK", "RELEASE")], [],
    combinedcell[
      #rounddot("At 100 kt:", false)
    ],
    table.hline(stroke: none),
    [#item("100 kt", "CROSSCHECK")], [#item("ONE HUNDRED KNOTS", "ANNOUNCE")],
    combinedcell[
      #rounddot("At V1:", false)
    ],
    table.hline(stroke: none),
    [], [#item("V1", "MONITOR or ANNOUNCE")],
    combinedcell[
      #rounddot("At VR:", false)
    ],
    table.hline(stroke: none),
    [#item("ROTATION", "PERFORM")], [#item("ROTATION", "ORDER")],
    combinedcell[
      #rounddot("When positive climb:", false)
    ],
    table.hline(stroke: none),
    [], [#item("POSITIVE CLIMB", "ANNOUNCE")],
    table.hline(stroke: none),
    [#item("L/G UP", "ORDER")], [#item("L/G lever", "SELECT UP")],
    table.hline(stroke: none),
    [#item("AP", "AS RQRD")], [],
    combinedcell[
      #rounddot("At the thrust reduction altitude:", false)
    ],
    table.hline(stroke: none),
    [#item("THRUST LEVERS", "CL")], [#item("PACK 1 and 2 (if applicable)", "ON")],
    combinedcell[
      #rounddot("At F speed:", false)
    ],
    table.hline(stroke: none),
    [#item("FLAPS 1", "ORDER")], [#item("FLAPS 1", "SELECT")],
    combinedcell[
      #rounddot("At S speed:", false)
    ],
    table.hline(stroke: none),
    [#item("FLAPS 0", "ORDER")], [#item("FLAPS 0", "SELECT")],
    table.hline(stroke: none),
    [], [
      #item("GND SPOILERS", "DISARM")
      #item("L/G", "CHECK UP")
      #item("EXTERIOR LIGHT", "SET")],
  )
])

section(subsection, [
  #sectionheadingbox[AFTER TAKEOFF]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [], [
      #rounddot("If the APU was used to supply the air conditioning during takeoff:", false)
      #linebreak()
      #item("APU BLEED pb-sw", "OFF")
      #item("APU MASTER SW pb-sw", "OFF")
    ],
    [], [#item("ENG MODE selector", "AS RQRD")],
    [], [
      #rounddot("If the takeoff was performed with TA ONLY:", false)
      #linebreak()
      #item("TCAS", "TA/RA")
      ],
    [], [#item("ANTI ICE", "AS RQRD")],

  )
])

section(subsection, [
  #sectionheadingbox[CLIMB]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [#item("MCDU", "PERF CLB")], [#item("MCDU", "F-PLN")],
    combinedcell[
      #rounddot("At transition altitude", false)
    ],
    table.hline(stroke: none),
    [#item("BAROMETRIC REFERENCE", "SET STD/CROSSCHECK")], [#item("BAROMETRIC REFERENCE", "SET STD/CROSSCHECK")],
    [#item("WEATHER RADAR", "ADJUST AS APPROPRIATE")], [#item("ENG ANTI ICE pb-sw", "AS RQRD")],
    combinedcell[
      #rounddot("At 10 000 ft AAL", false)
    ],
    table.hline(stroke: none),
    [], [#item("LAND sw", "RETRACT")],
    [], [#item("SEAT BELTS sw", "AS RQRD")],
    [#item("EFIS OPTIONS", "AS RQRD")], [#item("EFIS OPTIONS", "AS RQRD")],
    [], [#item("ECAM MEMO", "REVIEW")],
    [], [#item("NAVAIDS", "CLEAR")],
    [], [#item("SEC F-PLN", "AS RQRD")],
    [], [#item("OPT FL/REC MAX FL", "CHECK")],
  )
])

section(subsection, [
  #sectionheadingbox[CRUISE]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [#item("ECAM MEMO/SD PAGES", "REVIEW")], [#item("ECAM MEMO/SD PAGES", "REVIEW")],
    [#item("FLIGHT PROGRESS", "CHECK")], [#item("FLIGHT PROGRESS", "CHECK")],
    [#item("FUEL", "MONITOR")], [#item("FUEL", "MONITOR")],
    combinedcell[
      #rounddot("If " + textamber("GPS PRIMARY LOST") + ":", false)
    ],
    table.hline(stroke: none),
    [#item("NAVIGATION ACCURACY", "MONITOR")], [#item("NAVIGATION ACCURACY", "MONITOR")],
    [#item("RADAR", "ADJUST AS APPROPRIATE")], [],
  )
])

section(subsection, [
  #sectionheadingbox[DESCENT PREPARATION]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [], [#item("WEATHER AND LANDING INFORMATION", "OBTAIN")],
    combinedcell([
      #item("NAV CHARTS CLIPBOARD", "PREPARE")
    ], center),
    [], [#item("STATUS page", "CHECK")],
    [#item("LANDING CONDITIONS", "CONFIRM")], [#item("LANDING CONDITIONS", "CONFIRM")],
    combinedcell[
      #rounddot("If landing conditions changed:", false)
    ],
    table.hline(stroke: none),
    [#item("LANDING PERF DATA", "COMPUTE")], [#item("LANDING PERF DATA", "COMPUTE")],
    combinedcell([
      #item("LADING PERF DATA", "CROSSCHECK")
    ], center),
    [#item("FMS", "PREPARE")], [#item("FMS PREPARATION", "CROSSCHECK")],
    [#item("GPWS LDG FLAP 3", "AS RQRD")], [],
    [#item("LDG ELEV", "CHECK")], [],
    [#item("AUTO BRK", "AS RQRD")], [],
    combinedcell([
      #item("ARRIVAL BRIEFING", "PERFORM")
    ], center),
    [#item("RADAR", "ADJUST AS APPROPRIATE")], [],
    [], [#item("ANTI ICE pb-sw", "AS RQRD")],
    [], [#item("DESCENT CLEARANCE", "OBTAIN")],
    [#item("CLEARED ALTITUDE ON FCU", "SET")], [],
  )
])

pagebreak()

section(subsection, [
  #sectionheadingbox[DESCENT]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [#item("DESCENT", "INITIATE")], [],
    [#item("MCDU", "PROG/PERF DESCENT")], [#item("MCDU", "F-PLN")],
    [#item("DESCENT", "MONITOR/ADJUST")], [],
    [#item("TERR ON ND", "AS RQRD")], [#item("TERR ON ND", "AS RQRD")],
    combinedcell[
      #rounddot("When the aircraft approaches the transition level, and when cleared for an altitude:", false)
    ],
    table.hline(stroke: none),
    [#item("BAROMETRIC REFERENCE", "SET/CROSSCHECK")], [#item("BAROMETRIC REFERENCE", "SET/CROSSCHECK")],
    combinedcell[
      #rounddot("At 10 000 ft AAL:", false)
    ],
    table.hline(stroke: none),
    [], [#item("LAND sw", "ON")],
    [], [#item("SEAT BELTS sw", "ON")],
    [#item("EFIS option pb", "CSTR")], [#item("EFIS option pb", "CSTR")],
    [#item("LS pb", "AS RQRD")], [#item("LS pb", "AS RQRD")],
    [#item("NAVAIDS", "AS RQRD/CHECK")], [#item("ENG MODE selector", "AS RQRD")],
    combinedcell[
      #rounddot("If " + textamber("GPS PRIMARY LOST") + ":", false)
    ],
    table.hline(stroke: none),
    [#item("NAVIGATION ACCURACY", "MONITOR")], [],
    [#item("APPROACH C/L", "COMPLETE")], [#item("APPROACH C/L", "COMPLETE")],

  )
])

section(subsection, [
  #sectionheadingbox[APPROACH]

  #tasksharingtable(
    "AIRCRAFT CONFIGURATION FOR APPROACH", true,
    "PF", "PM",
    combinedcell[
      #underline("INITIAL APPROACH:")
    ],
    [#item("F-PLN SEQUENCING", "ADJUST")], [],
    combinedcell[
      #rounddot("Approx 15 NM from touchdown:", false)
    ],
    table.hline(stroke: none),
    combinedcell([
        #item("APPROACH PHASE", [CHECK/ACTIVATE or set green dot #super[@apprConf1]])
    ], center),
    [#item("MANAGED SPEED", "SET")], [],
    [#item("FLIGHT PATH", "MONITOR")], [#item("NAV ACCURACY", "MONITOR")],
    [#item("SPEED BRAKES lever", "AS REQUIRED")], [],
    [#item("RADAR", "ADJUST AS APPROPRIATE")], [],
    combinedcell[
      #underline("INTERMEDIATE/FINAL APPROACH:")
    ],
    combinedcell[
      #rounddot("At green dot:", false)
    ],
    table.hline(stroke: none),
    [#item("FLAPS 1", "ORDER")], [#item("FLAPS 1", "SELECT")],
    [], [#item("TCAS", "TA ONLY or TA/RA")],
    combinedcell([
        #item("S SPEED", [CHECK or SET #super[@apprConf1]])
    ], center),
    combinedcell[
      #rounddot("At 2000ft AGL minimum:", false)
    ],
    table.hline(stroke: none),
    [#item("FLAPS 2", "ORDER")], [#item("FLAPS 2", "SELECT")],
    combinedcell([
        #item("F SPEED", [CHECK or SET #super[@apprConf1]])
    ], center),
    combinedcell[
      #rounddot("When FLAPS 2:", false)
    ],
    table.hline(stroke: none),
    [#item("L/G DOWN", "ORDER")], [#item("L/G lever", "SELECT DOWN")],
    [], [#item("AUTO BRAKE", "CONFIRM")],
    [], [#item("GND SPLRS", "ARM")],
    [], [#item("EXTERIOR LIGHTS", "SET")],
    combinedcell[
      #rounddot("When L/G down:", false)
    ],
    table.hline(stroke: none),
    [#item("FLAPS 3", "ORDER")], [#item("FLAPS 3", "SELECT")],
    [], [#item("ECAM WHEEL PAGE", "CHECK")],
    combinedcell[
      #rounddot("When FLAPS 3:", false)
    ],
    table.hline(stroke: none),
    [#item("FLAPS FULL", "ORDER")], [#item("FLAPS FULL", "SELECT")],
    combinedcell([
        #item("SPEED TARGET", [CHECK or SET #super[@apprConf1]])
    ], center),
    [], [#item("A/THR", "CHECK IN SPEED MODE or OFF")],
    [], [#item("WING A.ICE (if not required)", "OFF")],
    [#item("SLIDING TABLE", "STOW")], [#item("SLIDING TABLE", "STOW")],
    [#item("All EFB (with no mounted equipment)", "STOW")], [#item("All EFB (with no mounted equipment)", "STOW")],
    [], [#item("LDG MEMO", "CHECK NO BLUE")],
    [#item("CABIN REPORT", "RECEIVE")], [#item("CABIN REPORT", "RECEIVE")],
    [#item("LANDING C/L", "COMPLETE")], [#item("LANDING C/L", "COMPLETE")],
    [], [#item("CABIN CREW", "ADVISE")],
    [], [#item("FLIGHT PARAMETERS", "MONITOR")],
  )

  #counter(figure).update(0)
  #note("apprConf1", "PF if AP is ON, PM if AP is OFF. The PF may request that this action is performed by the PM depending on the situation.")

  #tasksharingtable(
    "APPROACH USING LOC G/S GUIDANCE", true,
    "PF", "PM",
    combinedcell[
      #underline("DESCENT PREPARATION:")
    ],
    [#item("APPROACH MINIMUM", "DETERMINE")], [],
    combinedcell([
        #item("ARRIVAL BRIEFING", "PERFORM")
    ], center),
    combinedcell[
      #underline("INITIAL APPROACH:")
    ],
    [#item("APPR pb on FCU", "PRESS")], [],
    [#item("BOTH AP", "ENGAGE")], [],
    [#item("LOC", "CHECK ARMED")], [],
    [#item("G/S", "CHECK ARMED")], [],
    [#item("LOC CAPTURE", "MONITOR")], [],
    [#item("G/S CAPTURE", "MONITOR")], [],
    combinedcell([
        #item("GO-AROUND ALTITUDE", [SET #super[@locGs1]])
    ], center),
    combinedcell[
      #underline("FINAL APPROACH:")
    ],
    [], [#item("FLIGHT PARAMETERS", "MONITOR")],
    combinedcell[
      #rounddot("At 350 ft:", false)
    ],
    table.hline(stroke: none),
    [#item("LAND mode", "CHECK ENGAGED/ANNOUNCE")], [],
    combinedcell[
      #bold("For CAT I, CAT II and CAT III with DH approach:")
      #linebreak()
      #indent(
        rounddot("At minimum +100 ft:", false)
      )
    ],
    table.hline(stroke: none),
    [], [#item("ONE HUNDRED ABOVE", "MONITOR or ANNOUNCE")],
    combinedcell[
      #indent(
        rounddot("At minimum:", false)
      )
    ],
    table.hline(stroke: none),
    [#indent(item("CONTINUE or GO-AROUND", "ANNOUNCE"))], [#item("MINIMUM", "MONITOR or ANNOUNCE")],
    combinedcell[
      #bold("For CAT III with no DH approach:")
      #linebreak()
      #indent([
        #rounddot("At 100 ft RA:", false)
        #linebreak()
        #text("If no failure detected")
    ])
    ],
    table.hline(stroke: none),
    [#indent(item("CONTINUE", "ANNOUNCE"))], [],
  )

  #counter(figure).update(0)
  #note("locGs1", "PF if AP is ON, PM if AP is OFF. The PF may request that this action is performed by the PM depending on the situation.")

  #tasksharingtable(
    "APPROACH USING FPA GUIDANCE", true,
    "PF", "PM",
    combinedcell[
      #underline("DESCENT PREPARATION:")
    ],
    [#item("F-PLN A Page", "CHECK")], [#item("F-PLN A Page", "CHECK")],
    [#item("PROG Page", "COMPLETE")], [#item("PROG Page", "COMPLETE")],
    [#item("GO-AROUND STRATEGY", "REVIEW")], [],
    combinedcell[#underline("DESCENT:")],
    combinedcell[#rounddot("At 10 000 ft AAL", false)],
    table.hline(stroke: none),
    [#item("NAV ACCURACY", "CHECK")], [],
    combinedcell[#rounddot("For RNAV(GNSS):", false)],
    table.hline(stroke: none),
    [#indent(item("GPS PRIMARY", "CHECK"))],[],
    combinedcell[
      #underline("INITIAL/INTERMEDIATE/FINAL APPROACH:")
    ],
    [#item("LATERAL GUIDANCE MODE", "SET FOR APPROACH")], [],
    combinedcell[#rounddot("For LOC ONLY and ILS G/S OUT:", false)],
    table.hline(stroke: none),
    [#indent(item("LOC pb-sw", "PRESS"))],[],
    [#indent(item("LOC", "CHECK ARMED"))],[],
    combinedcell[#rounddot("For back course localizer approaches:", false)],
    table.hline(stroke: none),
    [#indent(item("TRK FPA MODE", "USE FOR APPROACH"))],[],
    [#item("LATERAL path", "INTERCEPT")], [],
    [#item("TRK FPA (Bird)", "SELECT")], [],
    [#item("FPA FOR FINAL APPROACH", "SET")], [],
    combinedcell[#rounddot("At 0.3 NM from the Final Descent Point", false)],
    table.hline(stroke: none),
    [#item("FPA selector", "PULL")], [],
    [#item("FPA", "CHECK ENGAGED")], [],
    [#item("POSITION/FLT PATH", "MONITOR/ADJUST")], [],
    combinedcell([
        #item("GO-AROUND ALTITUDE", [SET #super[@approachFpa1]])
    ], center),
    [], [#item("FLIGHT PARAMETERS", "MONITOR")],
    combinedcell[#rounddot("At minimum +100 ft:", false)],
    table.hline(stroke: none),
    [], [#item("ONE HUNDRED ABOVE", "MONITOR or ANNOUNCE")],
    combinedcell[#rounddot("At minimum:", false)],
    table.hline(stroke: none),
    [#item("CONTINUE or GO-AROUND", "ANNOUNCE")], [#item("MINIMUM", "MONITOR or ANNOUNCE")],
  )

  #counter(figure).update(0)
  #note("approachFpa1", "PF if AP is ON, PM if AP is OFF. The PF may request that this action is performed by the PM depending on the situation.")
])

section(subsection, [
  #sectionheadingbox[MANUAL LANDING]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [#item("AP", "OFF")], [],
    combinedcell[#rounddot("Around 30 ft RA:", false)],
    table.hline(stroke: none),
    [#item("FLARE", "PERFORM")], [#item("ATTITUDE", "MONITOR")],
    table.hline(stroke: none),
    [#item("THRUST LEVERS", "IDLE")], [],
    combinedcell[#rounddot("At touchdown:", false)],
    table.hline(stroke: none),
    [#item("DEROTATION", "INITIATE")], [],
    table.hline(stroke: none),
    [#item("ALL REVERSER LEVERS", "REV MAX or REV IDLE")], [#item("GND SPLRS", "CHECK/ANNOUNCE")],
    table.hline(stroke: none),
    [], [#item("REVERSERS", "CHECK/ANNOUNCE")],
    table.hline(stroke: none),
    [#item("DIRECTIONAL CONTROL", "ENSURE")], [],
    table.hline(stroke: none),
    combinedcell[#rounddot("If autobrake is selected:", false)],
    table.hline(stroke: none),
    [], [#item("AUTO BRK", "CHECK/ANNOUNCE")],
    table.hline(stroke: none),
    [], [#item("AUTO BRK", "MONITOR")],
    table.hline(stroke: none),
    combinedcell[#rounddot("If landing without autobrake:", false)],
    table.hline(stroke: none),
    [#item("BRAKES", "AS RQRD")], [],
    table.hline(stroke: none),
    [], [#item("DECELERATION", "CHECK/ANNOUNCE")],
    combinedcell[#rounddot("At 70 kt:", false)],
    table.hline(stroke: none),
    [], [#item("SEVENTY KNOTS", "ANNOUNCE")],
    table.hline(stroke: none),
    [#item("ALL REVERSER LEVERS", "IDLE")], [],
    combinedcell[#rounddot("At taxi speed:", false)],
    table.hline(stroke: none),
    [#item("ALL REVERSER LEVERS", "STOW")], [],
    combinedcell[#rounddot("Before 20 kt:", false)],
    table.hline(stroke: none),
    [#item("AUTO BRK", "DISARM")], [],
  )
])

section(subsection, [
  #sectionheadingbox[AUTOMATIC LANDING]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    combinedcell[#rounddot("At 350 ft RA:", false)],
    table.hline(stroke: none),
    [#item([#textgreen("LAND") on FMA], "CHECK/ANNOUNCE")], [],
    table.hline(stroke: none),
    [#item("ILS/GLS/MLS COURSE", "CHECK")], [],
    combinedcell[#rounddot("At 40 ft RA:", false)],
    table.hline(stroke: none),
    [], [#item([#textgreen("FLARE") on FMA], "CHECK/ANNOUNCE")],
    table.hline(stroke: none),
    [#item("FLARE", "MONITOR")], [],
    combinedcell[#rounddot("At 30 ft RA:", false)],
    table.hline(stroke: none),
    [], [#item("THR IDLE", "CHECK")],
    combinedcell[#rounddot("At 10 ft RA: \"Retard\"", false)],
    table.hline(stroke: none),
    [#item("THRUST LEVERS", "IDLE")], [],
    table.hline(stroke: none),
    [#item("LATERAL GUIDANCE", "MONITOR")], [],
    combinedcell[#rounddot("At touchdown:", false)],
    table.hline(stroke: none),
    [], [#item([#textgreen("ROLL OUT") mode], "CHECK/ANNOUNCE")],
    table.hline(stroke: none),
    [#item("ALL REVERSER LEVERS", "REV MAX or REV IDLE")], [#item("GND SPLRS", "CHECK/ANNOUNCE")],
    table.hline(stroke: none),
    [], [#item("REVERSERS", "CHECK/ANNOUNCE")],
    table.hline(stroke: none),
    [#item("DIRECTIONAL CONTROL", "MONITOR")], [],
    table.hline(stroke: none),
    combinedcell[#rounddot("If autobrake is selected:", false)],
    table.hline(stroke: none),
    [], [#item("AUTO BRK", "CHECK/ANNOUNCE")],
    table.hline(stroke: none),
    [], [#item("AUTO BRK", "MONITOR")],
    table.hline(stroke: none),
    combinedcell[#rounddot("If landing without autobrake:", false)],
    table.hline(stroke: none),
    [#item("BRAKES", "AS RQRD")], [],
    table.hline(stroke: none),
    [], [#item("DECELERATION", "CHECK/ANNOUNCE")],
    combinedcell[#rounddot("At 70 kt:", false)],
    table.hline(stroke: none),
    [], [#item("SEVENTY KNOTS", "ANNOUNCE")],
    table.hline(stroke: none),
    [#item("BOTH THRUST LEVERS", "REV IDLE")], [],
    combinedcell[#rounddot("Before 20 kt:", false)],
    table.hline(stroke: none),
    [#item("AUTO BRK", "DISARM")], [],
    combinedcell[#rounddot("End of roll out:", false)],
    table.hline(stroke: none),
    [#item("ALL REVERSER LEVERS", "STOW")], [],
    [#item("AP", "OFF")], [],
  )
])

pagebreak()

section(subsection, [
  #sectionheadingbox[GO AROUND (WITH FD ON)]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    combinedcell(rounddot("Simultaneously apply the following three actions:", false)),
    table.hline(stroke: none),
    [#item("THRUST LEVERS", "TOGA THEN FLEX/MCT")], [],
    table.hline(stroke: none),
    [#item("ROTATION", "PERFORM")], [#item("FLIGHT PARAMETERS", "MONITOR")],
    table.hline(stroke: none),
    [#item("GO-AROUND", "ANNOUNCE")], [#item("FLAPS", "RETRACT ONE STEP")],
    [#item("FMA", "CHECK/ANNOUNCE")], [],
    [], [#item("POSITIVE CLIMB", "ANNOUNCE")],
    [#item("L/G UP", "ORDER")], [#item("L/G", "UP")],
    [#item("NAV or HDG", "AS RQRD")], [#item("GO AROUND ALTITUDE", "CHECK")],
    combinedcell(rounddot("At go-around thrust reduction altitude:", false)),
    table.hline(stroke: none),
    [#item("THRUST LEVERS", "CL")], [],
    combinedcell(rounddot("At go-around acceleration altitude:", false)),
    table.hline(stroke: none),
    [#item("SPEED TARGET", "MONITOR")], [],
    table.hline(stroke: none),
    [#rounddot("AT F SPEED:", false)], [],
    table.hline(stroke: none),
    [#item("FLAPS 1", "ORDER")], [#item("FLAPS 1", "SELECT")],
    table.hline(stroke: none),
    [#rounddot("AT S SPEED:", false)], [],
    table.hline(stroke: none),
    [#item("FLAPS 0", "ORDER")], [#item("FLAPS 0", "SELECT")],
    table.hline(stroke: none),
    [], [#item("GND SPLRS", "DISARM")],
    table.hline(stroke: none),
    [], [#item("L/G", "CHECK UP")],
    table.hline(stroke: none),
    [], [#item("EXTERIOR LIGHTS", "SET")]
  )
])

section(subsection, [
  #sectionheadingbox[AFTER LANDING]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [#item("GND SPLRS", "DISARM")], [],
    [#item("EXTERIOR LIGHTS", "SET")], [],
    [], [#item("RADAR", "OFF")],
    [], [#item("PREDICTIVE WINDSHEAR " + optiontriangle() + " ", "OFF")],
    [], [#item("ENG MODE selecor", "NORM")],
    [], [#item("FLAPS", "RETRACT")],
    [], [#item("TCAS", "STBY")],
    [], [#item("ATC", "AS RQRD")],
    [], [#item("APU", "START")],
    [], [#item("ANTI ICE", "AS RQRD")],
    [], [#item("BRAKE TEMPERATURE", "MONITOR")],
    [], [#item("BRK FAN pb " + optiontriangle() + " ", "AS RQRD")],
    [#item("AFTER LANDING C/L", "COMPLETE")], [#item("AFTER LANDING C/L", "COMPLETE")],
  )
])

section(subsection, [
  #sectionheadingbox[PARKING]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [#item("ACCU PRESS", "CHECK")], [#item("ANTI ICE", "OFF")],
    [#item("PARK BRK handle", "ON")], [#item("APU BLEED pb-sw", "ON")],
    [#item("BRAKES PRESS indicator", "CHECK")], [],
    [#item("ALL ENG MASTER LEVERS", "OFF")], [],
    [#item("WING sw", "OFF")], [],
    [#item("BEACON sw", "OFF")], [],
    [#item("OTHER EXTERIOR LIGHTS", "AS RQRD")], [#item("FUEL PUMPS/CTR XFR VALVES", "OFF")],
    [#item("SLIDES", "CHECK DISARMED")], [],
    [#item("SEAT BELTS sw", "OFF")], [],
    [#item("GROUND CONTACT", "ESTABLISH")], [],
    [#item("PARK BRK handle", "AS RQRD")], [#item("BRAKE FAN pb " + optiontriangle() + " ", "AS RQRD")],
    [#item("PARKING C/L", "COMPLETE")], [#item("PARKING C/L", "COMPLETE")],
    [#item("HUD " + optiontriangle() + " ", "STOW")], [#item("HUD " + optiontriangle() + " ", "STOW")],
    [], [#item("ATC", "STBY")],
    [], [#item("IRS PERFORMANCE", "CHECK")],
    [], [#item("FUEL QUANTITY", "CHECK")],
    [#item("DUs", "DIM")], [#item("DUs", "DIM")],
    combinedcell([#item("LOGBOOK", "COMPLETE (CM1)")], center),
    [#item("All EFB TRANSMITTING MODDE", "AS RQRD")], [#item("All EFB TRANSMITTING MODDE", "AS RQRD")],
    [#rounddot("If performing transit stop:", false)], [#rounddot("If performing transit stop:", false)],
    table.hline(stroke: none),
    [#item("CLEAR/CLOSE FLIGHT", "APPLY")], [#item("CLEAR/CLOSE FLIGHT", "APPLY")],
  )
])

section(subsection, [
  #sectionheadingbox[SECURING THE AIRCRAFT]

  #tasksharingtable(
    "", false,
    "PF", "PM",
    [#item("PARK BRK handle", "ON")], [#item("OXGEN CREW SUPPLY pb-sw", "OFF")],
    [], [#item("EXTERIOR LIGHTS", "OFF")],
    [#item("ALL IR MODE selectors", "OFF")], [#item("APU BLEED pb-sw", "OFF")],
    [], [#item("EXT PWR pb", "AS RQRD")],
    [], [#item("APU MASTER SW pb-sw", "OFF")],
    [], [#item("EMER EXIT LT sw", "OFF")],
    [], [#item("SIGNS sw", "OFF")],
    [], [#item("BAT 1 pb-sw + BAT 2 pb-sw", "OFF")],
    [#item("SECURING THE AIRCRAFT C/L", "COMPLETE")], [#item("SECURING THE AIRCRAFT C/L", "COMPLETE")],
    combinedcell([#item("EFB applications", "CLOSE")], center),
    combinedcell([#item("All EFB", "SWITCH OFF")], center),
    [], [#item("MAINT BUS sw", "AS RQRD")],
  )
])

context[#metadata("End of section Tasksharing") #sectionEndLabel]
}


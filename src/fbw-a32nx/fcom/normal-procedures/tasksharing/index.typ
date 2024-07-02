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
  size: 9pt,
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

let subsection = counter("subsection")
subsection.update(0)

sectionheadingbox[SAFETY EXTERIOR INSPECTION <PRO-NOR-TSK-A>]

tasksharingtable(
  "",
  "CM1", "CM2",
  [], [#item("* WHEEL CHOCKS", "CHECK")],
  [], [#item("* L/G DOORS", "CHECK POSITION")],
  [], [#item("* APU AREA", "CHECK")],
)
subsection.step()

sectionheadingbox[PRELIMINARY COCKPIT PREPARATION <PRO-NOR-TSK-B>]

tasksharingtable(
  "AIRCRAFT SETUP:",
  "CM1", "CM2",
  [], [#item("ENG 1, 2 MASTER LEVERS", "OFF")],
  [], [#item("ENG MODE selector", "NORM")],
  [], [#item("* WEATHER RADAR", "OFF")],
  [], [#item("* WINDSHEAR/PWS " + optiontriangle() + " sw", "OFF")],
  [], [#item("L/G lever", "DOWN")],
  [], [#item("Both WIPER selectors", "OFF")],
)

tasksharingtable(
  "BATTERIES/EXTERNAL POWER:",
  "CM1", "CM2",
  [], [#item("BAT", "CHECK/AUTO")],
  [], [#item("EXT PWR pb", "ON")],
)

tasksharingtable(
  "APU FIRE TEST/APU START:",
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

tasksharingtable(
  "ADIRS:",
  "CM1", "CM2",
  [], [#item("All IR MODE selectors", "NAV")],
)

tasksharingtable(
  "COCKPIT LIGHTS:",
  "CM1", "CM2",
  [#item("* COCKPIT LIGHTS", "AS RQRD")], [#item("* COCKPIT LIGHTS", "AS RQRD")],
)

tasksharingtable(
  "EFB INITIALIZATION:",
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

tasksharingtable(
  "AIRCRAFT ACCEPTANCE:",
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

tasksharingtable(
  "PRELIMINARY PERFORMANCE DETERMINATION:",
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

tasksharingtable(
  "BEFORE WALKAROUND:",
  "PF", "PM",
  [], [#text(size: 7.5pt, item("* ECAM OXY PRESS/HYD QTY/ENG OIL QTY", "CHECK"))],
  [], [#item("FLAPS", "CHECK POSITION")],
  [], [#text(size: 8pt, item("* SPEED BRAKE lever", "CHECK RET AND DISARMED"))],
  [], [#item("* ACCU PRESS", "CHECK")],
  [], [#item("* PARK BRK handle", "ON")],
  [], [#item("* BRAKES PRESS indicator", "CHECK")],
  [], [#item("EMER EQPT", "CHECK")],
  [], [#item("RAIN REPELLENT " + optiontriangle() + " ", "CHECK")],
  [], [#item("C/B PANELS", "CHECK")],
  [], [#item("* GEAR PINS", "CHECK ONBOARD/STOWED")],
  [], [#item("* EXTERIOR WALKAROUND", "PERFORM")],
)
subsection.step()

sectionheadingbox[COCKPIT PREPARATION]

tasksharingtable(
  "OVERHEAD PANEL:",
  "PF", "PM",
  [
    #text(size: 8pt, "As a general rule, during the scan sequence:")
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

tasksharingtable(
  "CTR INSTRUMENT PANEL:",
  "PF", "PM",
  [#item("* ISIS/STBY INSTRUMENTS", "CHECK")], [],
  [#item("* CLOCK", "CHECK/SET")], [],
  [#item("* A/SKID & N/W STRG sw", "ON")], [],
)

tasksharingtable(
  "PEDESTAL:",
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

tasksharingtable(
  "GLARESHIELD:",
  "PF", "PM",
  combinedcell[#rounddot([When both flight crewmembers are seated:],false)],
  [#item("* BAROMETRIC REFERENCE", "SET/CROSSCHECK")], [#item("* BAROMETRIC REFERENCE", "SET/CROSSCHECK")],
  [#item("* FD", "CHECK ON")], [#item("* FD", "CHECK ON")],
  [#item("* LS/ILS", "AS RQRD")], [#item("* LS/ILS", "AS RQRD")],
  [#item("* ND mode and range", "AS RQRD")], [#item("* ND mode and range", "AS RQRD")],
  [#item("* VOR/ADF selector", "AS RQRD")], [#item("* VOR/ADF selector", "AS RQRD")],
  [#item("* FCU", "SET")], [],
)

tasksharingtable(
  "LATERAL CONSOLE AND PF/PM INSTRUMENT PANELS:",
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
subsection.step()

sectionheadingbox[BEFORE PUSHBACK OR START]

tasksharingtable(
  "BEFORE PUSHBACK/START CLEARANCE:",
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
  [], [#item("EXT PWR", "CHECK " + green("AVAIL"))],
  [], [#item("EXT PWR DISCONNECTION", "REQUEST ")],
)

tasksharingtable(
  "AT PUSHBACK/START CLEARANCE:",
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
  [#item(green("N/W STEER DISC ") + "MEMO", "ON")], [],
  table.hline(stroke: none),
  [#item("BEFORE START C/L", "COMPLETE")], [#item("BEFORE START C/L", "COMPLETE")],
  table.hline(stroke: none),
  [#item("PARK BRK handle", "OFF")], [],
  table.hline(stroke: none),
  [#indent(rounddot([When pushback is completed:], false))], [],
  table.hline(stroke: none),
  [#indent(item("PARK BRK handle", "ON"))], [],
)
subsection.step()

sectionheadingbox[ENGINE START]

tasksharingtable(
  "",
  "PF", "PM",
  [#item("THRUST LEVERS", "IDLE")], [],
  [#item("ENG MODE selector.", "IGN/START")], [],
  [#item("ENGINE 2 START", "ANNOUNCE")], [],
  [#item("ENG 2 MASTER LEVER", "ON")], [],
  [#item("ENG IDLE PARAMETERS", "CHECK")], [],
  [REPEAT THE START SEQUENCE FOR ENG 1], [],
)
subsection.step()

sectionheadingbox[AFTER START]

tasksharingtable(
  "",
  "PF", "PM",
  [#item("ENG MODE selector", "NORM")], [],
  [#item("APU BLEED pb-sw", "OFF")], [#item("GND SPLRS", "ARM")],
  [#item("ANTI ICE", "AS RQRD")], [#item("RUD TRIM", "CHECK ZERO")],
  [], [#item("FLAPS", "SET")],  
  [#rounddot([If the APU is not required:], false)], [#item("PITCH TRIM", "SET")],
  table.hline(stroke: none),
  [#item("APU MASTER SW pb-sw", "OFF")], [],
  [#item("ECAM STATUS", "CHECK")], [#item("ECAM STATUS", "CHECK")],
  [#text(size: 8.5pt, item(orange("NW STRG DISC ") + "MEMO", "CHECK NOT DISPLAYED"))], [],
  [#item("CLEAR TO DISCONNECT", "ANNOUNCE")], [],
  [#item("AFTER START C/L", "COMPLETE")], [#item("AFTER START C/L", "COMPLETE")],
)
subsection.step()

sectionheadingbox[TAXI]

tasksharingtable(
  "",
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
  [#item("TERR ON ND " + optiontriangle(), "AS RQRD")], [#item("TERR ON ND " + optiontriangle() + " ", "AS RQRD")],
  [], [#text(size: 8pt, item("ATC CODE/MODE", "CONFIRM/SET FOR TAKEOFF"))],
  [], [#item("ENG MODE selector", "AS RQRD")],
  [], [#item("WEATHER RADAR", "ON")],
  [], [#item("PREDICTIVE WINDSHEAR SYSTEM " + optiontriangle() + " ", "ON")],
  [], [#item("T.O CONFIG pb", "TEST")],
  [], [#item("T.O MEMO", "CHECK NO BLUE")],
  [#item("CABIN REPORT", "RECEIVE")], [#item("CABIN REPORT", "RECEIVE")],
  [#item("TAXI C/L", "COMPLETE")], [#item("TAXI C/L", "COMPLETE")],
)
subsection.step()

context[#metadata("End of section Tasksharing") #sectionEndLabel]
}


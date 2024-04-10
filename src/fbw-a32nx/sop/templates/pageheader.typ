#let pageheader(aircraft, document,h1,h2,h3, h4) = {
  table(
    columns: (100pt, 1fr),
    inset: 3pt,
    align: center,
    stroke: black,
    [#grid(
      rows: (22pt, auto),
      gutter: 3pt,
      align: center,
      [#pad(
        image("../images/fbw_logo.svg"),
        bottom: 3pt,
      )],
      [#text(black, size: 10pt, weight: "bold", hyphenate: false, upper(aircraft))],
      [#text(black, weight: "semibold", size: 7pt, hyphenate: false, upper(document))],
    )],
    [#grid(
      align: center,
      gutter: 5pt,
      [#pad(
        text(black, size: 10pt, weight: "bold", hyphenate: false, upper(h1)),
        bottom: 3pt,
      )],
      [#pad(
        text(black, size: 9pt, weight: "bold", hyphenate: false, upper(h2)),
        bottom: 2pt,
      )],
      [#box(
        height: 16pt,
        align(center + horizon)[
          #if (h3.len() + " - ".len() +  h4.len()) > 60 [
            #text(black, size: 8pt, hyphenate: false, upper([#h3 \ - #h4]))
          ] else [
            #text(black, size: 8pt, hyphenate: false, upper(h3 + " - " + h4))
          ]
        ]
      )],
    )],
  )
}

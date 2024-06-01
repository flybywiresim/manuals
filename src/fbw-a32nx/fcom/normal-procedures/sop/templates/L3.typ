#let L3() = {
  set text(5pt)
  context(
    place(
      left,
      if calc.even(here().page()) [
          #move(
            dx: - here().position().x + 0.5cm,
            square(
              width: 9pt,
              stroke: 0.5pt + black,
              fill: rgb("#d4d4d4"),
              align(center + horizon)[
                #text[L3]
              ]
            )
          )
        ] else [
          #move(
            dx: - here().position().x + 1.7cm,
            square(
              width: 9pt,
              stroke: 0.5pt + black,
              fill: rgb("#d4d4d4"),
              align(center + horizon)[
                #text[L3]
              ]
            )
          )
        ],
    )
  )
  text([\u{200B}])
  
}

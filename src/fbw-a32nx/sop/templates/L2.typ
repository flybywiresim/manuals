#let L2() = {
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
                #text[L2]
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
                #text[L2]
              ]
            )
          )
        ],
    )
  )
  text([\u{200B}])
  
}

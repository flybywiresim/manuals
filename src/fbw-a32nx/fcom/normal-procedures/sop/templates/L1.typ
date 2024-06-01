#let L1() = {
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
              align(center + horizon)[
                #text[L1]
              ]
            )
          )
        ] else [
          #move(
            dx: - here().position().x + 1.7cm,
            square(
              width: 9pt,
              stroke: 0.5pt + black,
              align(center + horizon)[
                #text[L1]
              ]
            )
          )
        ],
    )
  )
  text([\u{200B}])
  
}

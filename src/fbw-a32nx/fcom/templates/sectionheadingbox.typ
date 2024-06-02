#let sectionheadingbox(body,) = {
  set text(black, size: 10pt, weight: "black")
  set align(center)
  rect(
    inset: 5pt,
    width: 100%,
    [#upper(body)],
  )
  context[#metadata("sectionheadingbox") <sectionheadingbox>]
}

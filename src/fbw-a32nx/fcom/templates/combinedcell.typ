#let combinedcell(content, ..sink) = {
  let center = sink.pos().at(0, default: false,)
  if center != false {
    table.cell(colspan: 2)[
      #grid(columns: (30pt, 1fr, 30pt),
        [],content,[]
      )
    ]
   } else {
    table.cell(colspan: 2)[
      #content
    ]
   }
}

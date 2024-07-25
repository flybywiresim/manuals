#let tasksharingtable(title, centeredTitle, role1, role2, ..content) = {
  table(
    columns: (1fr, 1fr),
    inset: 3pt,
    align: left + horizon,
    if title != "" {
      if centeredTitle {
        table.header(
          table.cell(align: center, colspan: 2, box(height: 10pt, text(weight: "black", size: 10pt, upper(title)))),
          table.cell(align: center, box(height: 10pt, text(black, size: 10pt, weight: "black", role1))),
          table.cell(align: center, box(height: 10pt, text(black, size: 10pt, weight: "black", role2))),
        )
      } else {
        table.header(
          table.cell(colspan: 2, text(weight: "bold", size: 10pt, underline(upper(title)))),
          table.cell(align: center, box(height: 10pt, text(black, size: 10pt, weight: "black", role1))),
          table.cell(align: center, box(height: 10pt, text(black, size: 10pt, weight: "black", role2))),
        )
      }
    } else {
      table.header(
        table.cell(align: center, box(height: 10pt, text(black, size: 10pt, weight: "black", role1))),
        table.cell(align: center, box(height: 10pt, text(black, size: 10pt, weight: "black", role2))),
      )
    },
    ..content
  )
}

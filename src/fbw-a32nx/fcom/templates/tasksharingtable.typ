#let tasksharingtable(title, role1, role2, ..content) = {
  table(
    columns: (1fr, 1fr),
    inset: 3pt,
    align: left + horizon,
    if title != "" {
      table.header(
        table.cell(colspan: 2, text(weight: "bold", size: 10pt, underline(upper(title)))),
        table.cell(align: center, box(height: 10pt, text(black, size: 10pt, weight: "black", role1))),
        table.cell(align: center, box(height: 10pt, text(black, size: 10pt, weight: "black", role2))),
      )
    } else {
      table.header(
        table.cell(align: center, box(height: 10pt, text(black, size: 10pt, weight: "black", role1))),
        table.cell(align: center, box(height: 10pt, text(black, size: 10pt, weight: "black", role2))),
      )
    },
    ..content
  )
}

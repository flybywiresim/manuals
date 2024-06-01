#let tasksharingtable(title, role1, role2, ..content) = {
  table(
    columns: (1fr, 1fr),
    inset: 3pt,
    align: center + horizon,
    table.header(
    table.cell(colspan: 2, align: left)[#text(weight: "bold", size: 10pt, underline(upper(title)))],
    text(black, size: 10pt, weight: "black", role1),text(black, size: 10pt, weight: "black", role2),
    ),
    ..content
  )
}

// Shared report helpers; layout is adapted from typesetting/academic/report.typ.
#let ink = rgb("24344a")
#let accent = rgb("245b88")
#let muted = rgb("697580")
#let rule = rgb("cbd3db")
#let pale = rgb("f0f4f7")
#let serif = ("Libertinus Serif", "Source Han Serif", "SimSun")
#let sans = ("Liberation Sans", "Source Han Sans", "Microsoft YaHei")

#let code-field(value) = text(
  font: ("Source Code Pro", "Source Han Sans"),
  size: .87em,
  fill: muted,
  value,
)

#let report-table(widths, title, headers, cells) = {
  show figure.where(kind: table): set block(breakable: cells.len() / headers.len() > 7)
  figure({
    set text(size: 9pt)
    set par(justify: false, leading: .6em)
    table(
      columns: widths,
      align: left + top,
      inset: (x: 5.5pt, y: 6pt),
      stroke: (left: none, right: none, top: none, bottom: .35pt + rule),
      fill: (x, y) => if y == 0 { pale } else if calc.odd(y) { rgb("fafbfc") },
      table.header(..headers.map(it => table.cell(text(font: sans, weight: "bold", it)))),
      ..cells.map(it => table.cell(breakable: false, it)),
    )
  },
  kind: table,
  supplement: [表],
  caption: title,
  )
}

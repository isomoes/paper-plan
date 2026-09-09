// Adapted from typesetting/presentations/simple.typ, commit 091aa83.
// Retains Touying 0.6.1, the Simple theme, 16:9 pages and speaker notes.
// Optional animation/demo dependencies are not needed for this static deck.
//
// MIT License
// Copyright (c) 2023 LaTeX Typesetting Project Contributors
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "@preview/touying:0.6.1": *
#import themes.simple: *

#let ink = rgb("20344b")
#let accent = rgb("245b88")
#let teal = rgb("177b79")
#let muted = rgb("667585")
#let pale = rgb("f0f5f9")
#let rule = rgb("d5dfe8")
#let sans = ("Liberation Sans", "Source Han Sans")

#let presentation-theme(body) = {
  show: simple-theme.with(
    aspect-ratio: "16-9",
    primary: accent,
    footer: [后量子对称密码 · 文献截止 2026-09-08],
    footer-right: context [#counter(page).display("1") / #counter(page).final().first()],
    header-right: [研究组分享],
    subslide-preamble: block(below: 22pt,
      text(size: 31pt, weight: "bold", fill: ink,
        utils.display-current-heading(level: 2))),
    config-page(
      width: 960pt, height: 540pt,
      margin: (left: 48pt, right: 48pt, top: 56pt, bottom: 42pt),
    ),
    config-common(
      new-section-slide-fn: none,
      reset-page-counter-to-slide-counter: false,
      show-notes-on-second-screen: if sys.inputs.at("speaker-notes", default: "false") == "true" { right } else { none },
    ),
  )
  set text(font: sans, size: 22pt, fill: ink, lang: "zh", region: "CN")
  set par(justify: false, leading: .55em, spacing: .6em)
  set list(indent: .8em, body-indent: .5em, spacing: .65em)
  show link: set text(fill: accent)
  body
}

#let kicker(body) = text(size: 14pt, weight: "bold", fill: teal, body)
#let small(body) = text(size: 17pt, fill: muted, body)
#let card(title, body, tint: pale, height: auto) = block(
  width: 100%, height: height, fill: tint, radius: 5pt, inset: 18pt,
  breakable: false,
)[
  #text(size: 23pt, weight: "bold", fill: accent, title)
  #v(10pt)
  #set text(size: 20pt)
  #body
]
#let takeaway(body) = block(width: 100%, inset: (x: 16pt, y: 12pt),
  fill: rgb("eaf4f2"), radius: 4pt)[
  #text(size: 21pt, weight: "bold", fill: teal, body)
]
#let source(body) = {
  v(1fr)
  line(length: 100%, stroke: .6pt + rule)
  v(6pt)
  text(size: 12pt, fill: muted, body)
}
#let compare(widths, headers, ..cells) = {
  set text(size: 19pt)
  set par(leading: .45em)
  table(columns: widths, inset: (x: 12pt, y: 13pt),
    stroke: (bottom: .5pt + rule, rest: none),
    fill: (x, y) => if y == 0 { pale },
    table.header(..headers.map(it => text(weight: "bold", fill: accent, it))),
    ..cells.pos(),
  )
}
#let paper(url, id, title, status) = block(below: 13pt, breakable: false)[
  #text(size: 18pt, link(url)[*#id*　#title])
  #linebreak()
  #text(size: 14pt, fill: muted, status)
]

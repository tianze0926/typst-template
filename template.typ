#import "@preview/oxifmt:0.2.0": strfmt
#import "@local/svg-emoji:0.1.0": setup-emoji

#let project(title: "", authors: (), body) = {
  show: setup-emoji
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    numbering: "1", number-align: center,
    margin: 1.5cm,
  )
  set text(font: (
    "Source Han Sans SC",
  ), lang: "zh")
  // set heading(numbering: "1.1")
  set par(justify: true)

  let link_color(color) = {
    (it) => {
      set text(color)
      underline(it)
    }
  }
  show link: link_color(blue)
  show ref: link_color(red)
  
  show raw.where(block: false): box.with(
    fill: luma(250),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  show raw.where(block: true): block.with(
    fill: luma(250),
    width: 100%,
    inset: 10pt,
    radius: 4pt,
  )
  show raw: set text(font: (
    "CodeNewRoman Nerd Font",
    "Source Han Mono SC",
  ))

  show math.equation.where(block: false): eq => {
    if eq.body.has("size") and eq.body.size == "display" { eq } else { $display(eq)$ }
  } // https://github.com/typst/typst/discussions/2242#discussioncomment-7112991
  set math.mat(delim: "[")
  set math.equation(numbering: "(1)")
  show math.lt.eq: math.lt.eq.slant
  show math.gt.eq: math.gt.eq.slant
  
  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center)[
        #author.name
        // *#author.name* \
        // #author.email \
        // #author.affiliation
      ]),
    ),
  )

  body
}

#let footnote = (content) => h(0.25em) + footnote(content, numbering: "[1]")

#let note = (title: "", icon: emoji.eyes, content) => block(
  fill: rgb("#f7fbff"),
  width: 100%,
  inset: 10pt,
  radius: 4pt,
  icon + h(0.5em) + if title.len() != 0 { strong(title) + v(0.25em) } + content,
)

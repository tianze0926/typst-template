#import "@preview/oxifmt:0.2.0": strfmt

#let fontsize = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)

#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    numbering: "1", number-align: center,
    margin: 1.5cm,
  )
  set text(font: (
    "Times New Roman",
    "SimSun",
  ), size: fontsize.五号, lang: "zh")
  set heading(numbering: (..nums) => {
    if nums.pos().len() == 1 {
      ("零", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十").at(nums.pos().first()) + "、"
    } else if nums.pos().len() == 2 {
      strfmt("{}.", nums.pos().at(1))
    } else if nums.pos().len() == 3 {
      strfmt("({})", nums.pos().at(2))
    }
  })
  show heading: it => {
    if it.level == 1 {
      set text(size: fontsize.小四, font: "SimHei", weight: "bold")
      it
    } else if it.level == 2 {
      set text(size: fontsize.五号, weight: "bold")
      it
    } else {
      set text(size: fontsize.五号, weight: "regular")
      it
    }
    par()[#text(size:0.5em)[#h(0.0em)]] // 让第一段也首行缩进
  }
  set par(justify: true, first-line-indent: 2em)

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
  show raw: set text(font: "Noto Sans Mono")

  show math.equation.where(block: false): eq => {
    if eq.body.has("size") and eq.body.size == "display" { eq } else { $display(eq)$ }
  } // https://github.com/typst/typst/discussions/2242#discussioncomment-7112991
  set math.mat(delim: "[")
  set math.equation(numbering: "(1)")
  show math.lt.eq: math.lt.eq.slant
  show math.gt.eq: math.gt.eq.slant
  
  // Title row.
  align(center)[
    #block(text(size: fontsize.小二, font: "FangSong", weight: "bold", title))
  ]

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

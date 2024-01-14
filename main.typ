#import "template.typ": *

#show: project.with(
  title: "hw",
)


#text(lang: "en")[
#bibliography("refs.bib", title: text(
  size: fontsize.五号,
  font: "SimHei",
)[参考文献], style: "gb-7714-2015-numeric")
]


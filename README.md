## Layout

> https://github.com/lucifer1004/pkuthss-typst/blob/main/template.typ

- 首行缩进
- 各级标题（包括编号）格式修改

## Fonts

- SimSun
- SimHei
- KaiTi
- FangSong
- Times New Roman

### 粗体

其中经典的中文字体没有粗体版本，Typst 目前暂不支持 fake bold (https://github.com/typst/typst/issues/394) ，因此可使用 `fontforge` 手动生成 fake bold 版本的字体，参考 `boldfont.py`。

## Bibliography

两种方式：

### Raw

`refs.yml` 和 `raw.csl` 搭配：

```typst
#bibliography("refs.yml", title: text(
  size: fontsize.五号,
  font: "SimSun",
  weight: "bold",
)[参考文献], style: "raw.csl")
```

可较好地支持知网等国内平台（知网的 GB/T 7714 引用的信息比 BibTex 格式的更加丰富）。

### Regular

可使用 BibTex 或 yml：

```typst
#bibliography("refs.bib", title: text(
  size: fontsize.五号,
  font: "SimHei",
)[参考文献], style: "gb-7714-2015-numeric")
```

- `#citet("label_name")`：模拟 LaTex 中的 `\citet{}`


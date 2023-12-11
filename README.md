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

因本人写作时 Typst 对 GB/T 7714 引用的支持不佳 (https://github.com/typst/typst/issues/2548) ，本模板提供了一种手动添加格式化后的引用的方法（见 `refs.yml`），能较好地支持知网等国内平台（知网的 GB/T 7714 引用的信息比 BibTex 格式的更加丰富）。

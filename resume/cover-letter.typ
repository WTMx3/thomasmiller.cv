#set document(
  title: "Thomas Miller III - Cover letter",
  author: ("Thomas Miller III",),
  description: "Platform-focused engineer with more than 10 years of experience building full-stack products and the systems that keep them reliable: cloud infrastructure, CI/CD, observability, identity and access management, scalable architecture, incident response, and technical leadership.",
)
#set page(
  paper: "us-letter",
  margin: (top: 0.62in, bottom: 0.56in, left: 0.67in, right: 0.67in),
  numbering: "1",
  number-align: right,
)
#let ink = rgb("#20272d")
#let body = rgb("#3d474e")
#let muted = rgb("#626b73")
#let accent = rgb("#395a68")
#set text(font: "Inter", size: 9.5pt, fill: body)
#set par(leading: 3.3pt)
#set list(indent: 12pt, body-indent: 6pt, spacing: 4pt, tight: false)
#show link: set text(fill: accent)
#let section(title) = {
  v(10pt)
  text(size: 10.2pt, weight: "bold", fill: accent, upper(title))
  v(7pt)
}
#grid(columns: (0.85fr, 1.55fr), column-gutter: 16pt, align: top,
  [#text(size: 17pt, weight: "bold", fill: ink)[Thomas Miller III]],
  [#align(right)[#text(size: 8.2pt, fill: body)[
    #link("mailto:mail@thomasmiller.cv")[mail\@thomasmiller.cv]  |  #link("tel:+12143991411")[214-399-1411] \
    #link("https://thomasmiller.cv")[thomasmiller.cv]  |  #link("https://github.com/WTMx3")[github.com/WTMx3]  |  #link("https://www.linkedin.com/in/wtmx3")[linkedin.com/in/wtmx3]
  ]]],
)
#v(14pt)
#rect(width: 100%, height: 1.5pt, fill: accent)
#v(58pt)
#text(size: 14.5pt, weight: "bold", fill: ink)[Dear Hiring Team,]
#v(19pt)
#block(width: 100%)[#set text(size: 10.8pt); #set par(leading: 6.2pt); I am an experienced software engineer with countless real-world hours of experience, searching to further my career in technology. I am excited to tackle any role or task I am presented with. I want to emphasize my eagerness to tackle new challenges, and my competitive drive.]
#v(19pt)
#block(width: 100%)[#set text(size: 10.8pt); #set par(leading: 6.2pt); In my current position, I own the complete software product lifecycle across web, mobile, cloud, DevOps, reliability, and security. I lead work from early planning and architecture through implementation, release, monitoring, support, and continuous improvement. I regularly interact with clients and stakeholders, finding solutions for their problems,
 and bringing value and change to their organizations.]
#v(19pt)
#block(width: 100%)[#set text(size: 10.8pt); #set par(leading: 6.2pt); I would welcome the opportunity to discuss how that combination could support your products, engineering organization, and customers. Thank you for your consideration.]
#v(23pt)
#text(size: 10.5pt)[Sincerely,]
#v(6pt)
#text(size: 10.8pt, weight: "bold", fill: ink)[Thomas Miller III]

#import "@preview/cuti:0.4.0": fakesc

#let cv_section_label_notes = none
#let cv_section_label_note(label) = {
  if cv_section_label_notes == none { none }
  else { cv_section_label_notes.at(label, default: none) }
}
#let cv_section_note_pattern = regex("^\\s*(.+?)\\s*\\(\\s*note\\s*:\\s*(.+?)\\s*\\)\\s*$")
#let cv_section_parse_heading(text) = {
  if cv_section_note_pattern == none {
    (title: text, note: none)
  } else {
    let m = text.match(cv_section_note_pattern)
    if m == none {
      (title: text, note: none)
    } else {
      let caps = m.captures
      let title = caps.at(caps.len() - 2, default: text)
      let note = caps.at(caps.len() - 1, default: none)
      (title: title, note: note)
    }
  }
}

#let resume(
  margin: (left: 1.4cm, right: 1.2cm, top: 0.8cm, bottom: 1cm),
  font-settings: (
    font-family: "Palatino",
    font-size: 10pt,
    author-font-size: 25pt,
    lang: "en",
  ),
  par-settings: (
    leading: 0.5em,
    spacing: 0pt,
  ),
  author-info: (
    name: "John Doe",
    primary-info: [
      +1-234-567-8900 | #link("mailto:john.doe@example.com")[john.doe\@example.com] | #link("https://www.john-doe.com/")[john-doe.com]
    ],
    secondary-info: [
      #link("https://www.linkedin.com/in/john-doe-linkedin")[linkedin] | #link("https://github.com/john-doe-github")[github] | #link("https://scholar.google.com/citations?user=john-doe-google-scholar")[google-scholar] | #link("https://orcid.org/john-doe-orcid")[orcid]
    ],
    tertiary-info: "Your City, Your State - Your ZIP, Your Country",
  ),
  author-position: center,
  body,
) = {
  set document(author: author-info.name, title: author-info.name)
  set page(
    paper: "a4",
    margin: margin,
  )
  set text(
    font: font-settings.font-family,
    size: font-settings.font-size,
    lang: font-settings.lang,
    ligatures: false
  )
  set par(
    leading: par-settings.leading,
    spacing: par-settings.spacing,
  )

// heading.where(body.)
  // Small caps for section titles
  show heading.where(level: 2): it => [
    #block(breakable: false, above: 16pt, below: 6pt)[
      #show: it => fakesc[#text(tracking: 0.5pt, it)]
      #let content_to_string(x) = {
        if x == none { "" }
        else if type(x) == str { x }
        else if x.has("text") { x.text }
        else if x.has("body") { content_to_string(x.body) }
        else if x.has("children") { x.children.map(x => content_to_string(x)).join("") }
        else { "" }
      }
      #let heading_text = content_to_string(it.body)
      #let label_note = if it.has("label") { cv_section_label_note(it.label) } else { none }
      #let parsed = cv_section_parse_heading(heading_text)
      #let section_note = if label_note == none { parsed.note } else { label_note }
      #let title_text = if parsed.note == none { heading_text } else { parsed.title }
      #let display_title = if parsed.note == none { it.body } else { [#parsed.title] }
      #text(size: 13pt, weight: "semibold")[#display_title] #h(1fr)
      #if section_note == none {
        if title_text.contains("Publication") { text(size: 8pt, weight: "light")[C=Conference, J=Journal, P=Patent, S=In Submission, T=Thesis] } else { [] }
      } else {
        text(size: 8pt)[#section_note]
      }
      #v(-3mm)
      #line(length: 100%, stroke: 0.4pt + black)
    ]
  ]

  align(author-position)[
    #text(size: font-settings.author-font-size, weight: "bold")[#author-info.name] \
    #v(1em)
    #par(leading: 0.6em)[
      #text[#author-info.primary-info \ #author-info.secondary-info \ #author-info.tertiary-info]
    ]
  ]

  body
}

#let cv_section(title, note: none) = [
  #pad(top: 16pt, bottom: 6pt)[
    #show: it => fakesc[#text(tracking: 0.5pt, it)]
    #text(size: 13pt, weight: "semibold")[#title] #h(1fr) #if note == none { [] } else { text(size: 8pt)[#note] }
    #v(2mm)
    #line(length: 100%, stroke: 0.4pt + black)
  ]
]

#let row2col(left, rhs) = [
  #grid(columns: (1fr, auto), gutter: 6pt)[
    #left
    #align(right)[#rhs]
  ]
]

#let resume_subheading(title, location, subtitle, dates) = [
  #row2col(text(weight: "bold")[#title], text(size: 9pt, style: "italic")[#dates])
  #row2col(text(size: 9pt, style: "italic")[#subtitle], text(size: 9pt)[#location])
  #v(-2mm)
]

#let resume_research_exp(title, location, org, dates) = [
  #row2col(text(weight: "bold")[#title], text(size: 9pt, style: "italic")[#dates])
  #row2col(text(size: 9pt)[#org], text(size: 9pt)[#location])
  #v(-2mm)
]

#let resume_project(title, role, dates, location) = [
  #row2col(text(weight: "bold")[#title], text(size: 9pt, style: "italic")[#dates])
  #row2col(text(size: 9pt, style: "italic")[#role], text(size: 9pt)[#location])
  #v(-2mm)
]

#let resume_honor(title, org, date) = [
  #row2col(text(weight: "bold")[#title], text(size: 9pt, style: "italic")[#date])
  #row2col(text(size: 9pt, style: "italic")[#org], [])
  #v(-1.4mm)
]

#let resume_item_list(body) = [
  #set list(spacing: 0.4em)
  #body
  #v(-2mm)
]

#let pub_item(label, body) = [
  #grid(columns: (auto, 1fr), gutter: 6pt)[
    #text(weight: "bold")[#label]
    #body,
  ]
  #v(2pt)
]

#let skill_row(label, value) = [
  #grid(columns: (auto, 1fr), gutter: 6pt)[
    #text(weight: "bold")[#label]
    #value,
  ]
  #v(2pt)
]

#let objective_block(body) = [
  #body
  #v(-2mm)
]

#let experience_item(company, location, title, dates, body) = [
  #resume_subheading(company, location, title, dates)
  #resume_item_list[#body]
]

#let project_item(title, role, dates, url: none, body) = [
  #let link_cell = if url == none { [] } else { link(url)[url] }
  #resume_project(title, role, dates, link_cell)
  #resume_item_list[#body]
]

#let leadership_item(title, org, dates, url: none, body) = [
  #project_item(title, org, dates, url: url)[#body]
]

#let volunteer_item(title, org, dates, url: none, body) = [
  #project_item(title, org, dates, url: url)[#body]
]

#let membership_item(org, member_id, dates, url: none) = [
  #let member_text = if member_id == none { [] } else { member_id }
  #let member_value = if url == none { member_text } else { link(url)[member_text] }
  #row2col(
    [
      #text(weight: "bold")[#org]
      #if member_id == none { [] } else { ", " + member_value }
    ],
    text(size: 9pt, style: "italic")[#dates]
  )
  #v(-1.4mm)
]

#let certification_item(name, date, org: none, url: none) = [
  #row2col(
    [
      #if org == none {
        text(weight: "bold")[#if url == none { name } else { link(url)[name] }]
      } else {
        text(weight: "bold")[#org:] + if url == none { name } else { link(url)[name] }
      }
    ],
    text(size: 9pt, style: "italic")[#date]
  )
  #v(-1.4mm)
]

#let additional_info_block(languages, interests) = [
  #text(weight: "bold")[Languages:] #languages \
  #text(weight: "bold")[Interests:] #interests
  #v(-2mm)
]

#let reference_item(name, title, org, email, phone, relationship) = [
  #text(weight: "bold")[#name] \
  #title \
  #org \
  Email: #email \
  Phone: #phone \
  #text(style: "italic")[Relationship: #relationship]
]

#let reference_list(body) = [
  #set list(spacing: 0.6em)
  #body
  #v(-2mm)
]

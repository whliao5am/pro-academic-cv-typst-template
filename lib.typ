#import "@preview/cuti:0.4.0": fakesc

#let cv_section_parse_heading(text) = {
  let m = text.match(regex("^\\s*(.+?)\\s*\\(\\s*note\\s*:\\s*(.+?)\\s*\\)\\s*$"))
  if m == none {
    (title: text, note: none)
  } else {
    let caps = m.captures
    let title = caps.at(caps.len() - 2, default: text)
    let note = caps.at(caps.len() - 1, default: none)
    (title: title, note: note)
  }
}

// Two-column row: left-aligned content + right-aligned content
#let row2col(left, rhs) = [#left #h(1fr) #rhs]

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
    spacing: 0.5em,
  ),
  list-settings: (
    bullet-list-spacing: 0.7em,
    numbered-list-spacing: 0.7em,
  ),
  heading-settings: (
    above-spacing: 1.2em,
    below-spacing: 0.6em,
    section-title-size: 1em,
    section-title-weight: "semibold",
    section-note-size: 0.8em,
    section-note-weight: "light",
    section-line-above-spacing: -0.85em,
    line-length: 100%,
    line-stroke: 0.04em + black,
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
  
  let list_marker1 = text(size: 0.6em, baseline: 0.1em)[#sym.circle.filled]
  set list(spacing: list-settings.bullet-list-spacing, marker: list_marker1)
  set enum(spacing: list-settings.numbered-list-spacing)

  // Small caps for section titles
  show heading.where(level: 2): it => [
    #block(breakable: false, above: heading-settings.above-spacing, below: heading-settings.below-spacing)[
      #show: it => fakesc[#text(tracking: 0.05em, it)]
      #let content_to_string(x) = {
        if x == none { "" }
        else if type(x) == str { x }
        else if x.has("text") { x.text }
        else if x.has("body") { content_to_string(x.body) }
        else if x.has("children") { x.children.map(x => content_to_string(x)).join("") }
        else { "" }
      }
      #let heading_text = content_to_string(it.body)
      #let parsed = cv_section_parse_heading(heading_text)
      #let section_note = parsed.note
      #row2col(text(size: heading-settings.section-title-size, weight: heading-settings.section-title-weight)[#parsed.title], if section_note != none { text(size: heading-settings.section-note-size, weight: heading-settings.section-note-weight)[#section_note] } else { [] })
      #v(heading-settings.section-line-above-spacing)
      #line(length: heading-settings.line-length, stroke: heading-settings.line-stroke)
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

// ============================================================
// Layout Primitives
// ============================================================

// Style: Single-Line Entry (label + inline text + right-aligned content) \
// Use for: memberships, certifications, simple dated items
#let single_line_entry(label, value, rcontent, label-args: (:), rc-args: (:)) = {
  let default-label-args = (weight: "bold")
  let default-rc-args = (size: 0.9em, style: "italic")
  let merged-label-args = default-label-args + label-args
  let merged-rc-args = default-rc-args + rc-args
  [#row2col([#text(..merged-label-args)[#label] #value], text(..merged-rc-args)[#rcontent])]
}

// Style: Multi-Line List
#let multi_line_list(list-type: "list", ..lines) = {
  if list-type == "enum" {
    enum(..lines)
  } else {
    list(..lines)
  }
}

// Style: Multi-Line Text
#let multi_line_text(..lines) = [
  #for line in lines.pos() {
    line + linebreak()
  }
]

// ============================================================
// Layout Templates
// ============================================================

// Style: Publication Entry List (auto-numbered by category) \
// entries: array of dicts with keys: \
//   - category: str — category prefix for numbering (e.g., "C", "J", "P") \
//   - value: content — publication text (mutually exclusive with bib-key) \
// spacing: vertical spacing between entries \
// number-style: "descending" (default) — first entry (most recent) gets highest number \
//               "ascending" — first entry gets number 1 \
// label-width: width of the label column (auto = fit widest label) \
#let publication_entry_list(
  entries,
  column-gutter: 1.3em,
  row-gutter: 0.9em,
  number-style: "descending",
  label-width: auto,
) = {
  // Count entries per category
  let cat_counts = (:)
  for entry in entries {
    let cat = entry.category
    let current = if cat in cat_counts { cat_counts.at(cat) } else { 0 }
    cat_counts.insert(cat, current + 1)
  }

  // Build grid children with auto-generated labels
  let children = ()
  let cat_seen = (:)
  for entry in entries {
    let cat = entry.category
    let seen = if cat in cat_seen { cat_seen.at(cat) } else { 0 }
    cat_seen.insert(cat, seen + 1)

    let num = if number-style == "descending" {
      cat_counts.at(cat) - seen
    } else {
      seen + 1
    }

    children.push(text(weight: "bold")[[#cat.#str(num)]])
    children.push(entry.value)
  }

  grid(
    columns: (label-width, 1fr),
    column-gutter: column-gutter,
    row-gutter: row-gutter,
    ..children,
  )
}

// Style: Personal Info Block \
// Use for: references, contact cards
#let personal_info(name, title, org, email, phone, note) = [
  #multi_line_text(
    text(weight: "bold")[#name],
    if title != none {[#title]},
    if org != none {[#org]},
    if email != none {[Email: #email]},
    if phone != none {[Phone: #phone]},
    if note != none {text(style: "italic")[#note]},
  )
]

// Style: Personal Info List \
// Use for: references, contact cards
#let personal_info_list(items, spacing: 1em, list-type: "enum") = [
  #if list-type == "enum" {
    set enum(spacing: spacing)
    enum(..items.map(item => personal_info(item.name, item.title, item.org, item.email, item.phone, item.note)))
  } else {
    set list(spacing: spacing)
    list(..items.map(item => personal_info(item.name, item.title, item.org, item.email, item.phone, item.note)))
  }
]

// // Style: Entry Header (two-row header) \
// // Row 1: bold title (left) + italic 9pt date (right) \ 
// // Row 2: italic 9pt subtitle (left) + 9pt location (right) \
// // Use for: education, experience, research, honors
// #let entry_header(title, date, subtitle: none, location: none, spacing: 0pt) = {
//   let header = [#text(weight: "bold")[#title] #h(1fr) #text(size: 9pt, style: "italic")[#date]]
//   if subtitle != none or location != none {
//     let sub = if subtitle != none { subtitle }
//     let loc = if location != none { location }
//     header = header + [\ #text(size: 9pt, style: "italic")[#sub] #h(1fr) #text(size: 9pt)[#loc]]
//   }
//   header + v(spacing)
// }

// // Style: Entry with Items (entry header + bullet list) \
// // Use for: experience, projects, awards, leadership, volunteer
// #let entry_with_items(title, date, subtitle: none, location: none, url: none, body) = {
//   let loc = if url != none { link(url)[url] } else if location != none { location } else { [] }
//   entry_header(title, date, subtitle: subtitle, location: loc) + body
// }
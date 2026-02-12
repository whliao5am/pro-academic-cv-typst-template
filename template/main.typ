#import "../lib.typ": *

#show: resume

== Objective
// #cv_section([Objective])
#objective_block[
Seeking a challenging position in \[your field\] to leverage my expertise in \[your key skills\]. Aiming to contribute to innovative projects at the intersection of \[your interests\] and practical problem-solving in fields such as \[specific areas of interest\].
]

== Experience
// #cv_section([Experience])
#experience_item(
  [Company A],
  [City, Country],
  [Job Title A],
  [Month Year - Month Year],
)[
- Developed \[specific achievement\] achieving \[specific metric\] in \[specific area\]
- Implemented \[technology/method\], enhancing \[specific aspect\] by \[specific percentage\]
- Conducted analysis on \[specific data\], identifying \[key findings\]
- Presented findings at \[specific event\], receiving \[specific recognition\]
]
#experience_item(
  [Company B],
  [Remote],
  [Job Title B],
  [Month Year - Month Year],
)[
- Engineered a \[specific system/model\], improving \[specific metric\] by \[percentage\]
- Developed \[specific tool/method\], increasing \[specific aspect\] by \[percentage\]
- Implemented \[specific system\], reducing \[specific metric\] by \[percentage\]
- Conducted \[specific test/analysis\] to validate \[specific aspect\]
]

== Education
// #cv_section([Education])
#resume_subheading(
  [University Name],
  [City, Country],
  [Degree Name],
  [Month Year - Month Year],
)
#resume_item_list[
- GPA: X.XX/4.00
]

#resume_subheading(
  [College Name],
  [City, Country],
  [Pre-University Education],
  [Month Year],
)
#resume_item_list[
- Grade: XX.X%
]

#resume_subheading(
  [High School Name],
  [City, Country],
  [Secondary Education],
  [Month Year],
)
#resume_item_list[
- GPA: X.X/10
]

#cv_section([Projects])
#project_item(
  [Project A: \[Brief Description\]],
  [Tools: \[List of tools and technologies used\]],
  [Month Year - Month Year],
  url: "https://github.com/your-username/project-a",
)[
- Developed \[specific feature/system\] for \[specific purpose\]
- Implemented \[specific technology\] for \[specific goal\], achieving \[specific result\]
- Created \[specific component\], ensuring \[specific benefit\]
- Applied \[specific method\] to analyze \[specific aspect\]
]

#project_item(
  [Project B: \[Brief Description\]],
  [Tools: \[List of tools and technologies used\]],
  [Month Year],
  url: "https://github.com/your-username/project-b",
)[
- Developed \[specific model/system\], achieving \[specific metric\]
- Implemented \[specific feature\], processing \[specific volume\] of data
- Created \[specific visualization\] for \[specific purpose\]
- Developed \[specific component\] for easy integration with \[specific system\]
]

== Patents & Publications (note: C=Conference, J=Journal, P=Patent, S=In Submission, T=Thesis)
// == Patents & Publications
// #cv_section([Patents & Publications], note: [C=Conference, J=Journal, P=Patent, S=In Submission, T=Thesis])
#text(size: 9.5pt)[
  #pub_item([C.1], [Your Name, et al. (Year). #link("https://doi.org/XX.XXXX/XXXXXXX.XXXX.XXXXXXX")[*Title of Conference Paper*]. In _Name of Conference Proceedings_, pp. XX-XX. Publisher. Date, Location. DOI: XX.XXXX/XXXXXXX.XXXX.XXXXXXX])

  #pub_item([S.1], [Your Name, et al. (Year). *Title of Submitted Paper*. Manuscript submitted for publication in _Journal Name_.])

  #pub_item([P.1], [Inventor 1, Your Name, Inventor 3, et al. (Year). #link("https://patentoffice.gov/patent/XXXXXXXXX")[*Title of Patent*]. Patent Office, Patent No. XXXXXXXXX. Registration Date: Date, Grant Date: Date, Publication Date: Date.])

  #pub_item([J.1], [Author 1, Your Name, Author 3, et al. (Year). #link("https://doi.org/XX.XXXX/XXXXX.XXXX.XXXXXXX")[*Title of Journal Article*]. _Journal Name_, Vol. XX, Issue X, pp. XXX-XXX. DOI: XX.XXXX/XXXXX.XXXX.XXXXXXX])
]

#cv_section([Skills])
#skill_row([Programming Languages:], [Language 1, Language 2, Language 3, Language 4, Language 5])
#skill_row([Web Technologies:], [Technology 1, Technology 2, Technology 3, Technology 4, Technology 5])
#skill_row([Database Systems:], [Database 1, Database 2, Database 3])
#skill_row([Data Science & Machine Learning:], [Tool 1, Tool 2, Tool 3, Tool 4, Tool 5, Tool 6])
#skill_row([Cloud Technologies:], [Cloud Platform 1, Cloud Platform 2, Cloud Platform 3])
#skill_row([DevOps & Version Control:], [Tool 1, Tool 2, Tool 3, Tool 4, Tool 5])
#skill_row([Specialized Area:], [Skill 1, Skill 2, Skill 3, Skill 4])
#skill_row([Mathematical & Statistical Tools:], [Tool 1, Tool 2, Tool 3, Tool 4, Tool 5])
#skill_row([Other Tools & Technologies:], [Tool 1, Tool 2, Tool 3, Tool 4, Tool 5])
#skill_row([Research Skills:], [Skill 1, Skill 2, Skill 3, Skill 4, Skill 5, Skill 6])

#cv_section([Honors & Awards])
#project_item(
  [Award Name A],
  [Awarding Institution/Organization],
  [Month Year],
  url: "https://award-link-a.com",
)[
- Brief description of the award and its significance
- Impact or recognition associated with the award
]

#project_item(
  [Award Name B],
  [Awarding Institution/Organization],
  [Month Year],
  url: "https://award-link-b.com",
)[
- Brief description of the award and its significance
- Impact or recognition associated with the award
]

#project_item(
  [Competition Achievement],
  [Competition Name, Organizing Body],
  [Month Year],
  url: "https://competition-link.com",
)[
- Specific achievement or rank in the competition
- Skills or abilities demonstrated through this achievement
]

#cv_section([Leadership])
#leadership_item(
  [Leadership Role A],
  [Organization/Institution Name],
  [Month Year - Month Year],
  url: "https://organization-a-link.com",
)[
- Key responsibility or achievement in this role
- Quantifiable impact or improvement made during tenure
- Initiative taken or project led
]

#leadership_item(
  [Leadership Role B],
  [Organization/Institution Name],
  [Month Year - Month Year],
  url: "https://organization-b-link.com",
)[
- Key responsibility or achievement in this role
- Quantifiable impact or improvement made during tenure
- Initiative taken or project led
]

#cv_section([Volunteer])
#volunteer_item(
  [Volunteer Role A],
  [Organization Name],
  [Month Year - Month Year],
  url: "https://volunteer-org-a-link.com",
)[
- Key responsibility or contribution in this role
- Impact of your volunteer work
- Skills developed or applied during this experience
]

#volunteer_item(
  [Volunteer Role B],
  [Organization Name],
  [Month Year - Present],
  url: "https://volunteer-org-b-link.com",
)[
- Key responsibility or contribution in this role
- Impact of your volunteer work
- Skills developed or applied during this experience
]

#cv_section([Memberships])
#membership_item(
  [Professional Organization A],
  [Membership ID: XXXXXXXX],
  [Month Year - Present],
)

#membership_item(
  [Professional Organization B],
  [Membership ID: XXXXXXXX],
  [Month Year - Present],
  url: "https://membership-certificate-link.com",
)

#membership_item(
  [Professional Organization C],
  [Membership ID: XXXXXXXX],
  [Month Year - Present],
  url: "https://membership-certificate-link.com",
)

#cv_section([Certifications])
#certification_item(
  [Certification A],
  [Month Year],
  url: "https://certification-link-a.com",
)
#certification_item(
  [Certification B],
  [Month Year],
  org: [Certifying Body],
  url: "https://certification-link-b.com",
)
#certification_item(
  [Certification C],
  [Month Year],
  org: [Certifying Body],
  url: "https://certification-link-c.com",
)
#certification_item(
  [Certification D],
  [Month Year],
  url: "https://certification-link-d.com",
)

#cv_section([Additional Information])
#additional_info_block(
  [Language A (Proficiency level), Language B (Proficiency level), Language C (Proficiency level)],
  [Interest 1, Interest 2, Interest 3, Interest 4],
)

#cv_section([References])
#reference_list[
+ #reference_item(
    [Reference Person 1],
    [Job Title, Department],
    [Organization/Institution Name],
    [email1\@example.com],
    [+X-XXX-XXX-XXXX],
    [e.g., Thesis Advisor, Manager, etc.],
  )
+ #reference_item(
    [Reference Person 2],
    [Job Title, Department],
    [Organization/Institution Name],
    [email2\@example.com],
    [+X-XXX-XXX-XXXX],
    [e.g., Project Supervisor, Colleague, etc.],
  )
+ #reference_item(
    [Reference Person 3],
    [Job Title, Department],
    [Organization/Institution Name],
    [email3\@example.com],
    [+X-XXX-XXX-XXXX],
    [e.g., Mentor, Collaborator, etc.],
  )
]

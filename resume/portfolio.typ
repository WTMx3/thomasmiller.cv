#set document(
  title: "Thomas Miller III - Portfolio",
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
#set page(width: 8.5in, height: 11in, margin: (top: 0.62in, bottom: 0.56in, left: 0.67in, right: 0.67in), header: none)
#set text(size: 10.2pt)
#set par(leading: 4pt)
#set list(spacing: 6pt)
#grid(columns: (0.85fr, 1.55fr), column-gutter: 16pt, align: top,
  [#text(size: 17pt, weight: "bold", fill: ink)[Thomas Miller III]],
  [#align(right)[#text(size: 8.2pt, fill: body)[
    #link("mailto:mail@thomasmiller.cv")[mail\@thomasmiller.cv]  |  #link("tel:+12143991411")[214-399-1411] \
    #link("https://thomasmiller.cv")[thomasmiller.cv]  |  #link("https://github.com/WTMx3")[github.com/WTMx3]  |  #link("https://www.linkedin.com/in/wtmx3")[linkedin.com/in/wtmx3]
  ]]],
)
#v(14pt)
#rect(width: 100%, height: 1.5pt, fill: accent)
#v(18pt)
#text(size: 22pt, weight: "bold", fill: ink)[EazyHQ]
#v(19pt)
#text(size: 11.5pt, weight: "semibold", fill: ink)[A modular workspace operating system for projects, data, automation, content, and team workflows.]
#v(22pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[OVERVIEW]
#v(7pt)
#text(size: 10.2pt, fill: body)[EazyHQ is a cross-platform workspace platform built around a Flutter client and Go API. It combines project operations, configurable dashboards, automation flows, content tools, data management, and installable add-ons in a single workspace-aware product.]
#v(20pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[WHAT I BUILT]
#block(width: 100%, above: 6pt)[
#list(marker: "-", spacing: 6pt,
  [Designed a registry-first add-on architecture with build-time linking and workspace-level enablement.],
  [Built event-driven automation infrastructure covering subscriptions, queued steps, waits, execution logs, and run histories.],
  [Developed workspace dashboards with configurable tabs, permission-aware editing, and add-on-provided widgets.],
  [Implemented platform capabilities for forms, structured data, APIs, sites, email, calendars, storage, reports, directories, and wikis.],
  [Created a cross-platform Flutter interface backed by a Go service layer, PostgreSQL, Redis, and containerized deployment.],
  [Established GitHub Actions and Docker-based delivery workflows for the API and web application.],
)
]
#v(18pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[ENGINEERING FOCUS]
#v(7pt)
#text(size: 10.2pt, fill: body)[The project demonstrates full-stack platform design: authorization boundaries, stable extension contracts, event-driven execution, operational recovery, responsive interface systems, and deployment automation.]
#v(18pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[TECHNOLOGIES]
#v(7pt)
#text(size: 10pt, fill: body)[Flutter, Dart, Go, PostgreSQL, Redis, Docker, GitHub Actions, Caddy]
#v(18pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[SOURCE]
#v(7pt)
#link("https://github.com/WTMx3/eazyhq")[#text(size: 10pt, fill: accent)[https://github.com/WTMx3/eazyhq]]
#set page(width: 8.5in, height: 11in, margin: (top: 0.45in, bottom: 0.45in, left: 0.67in, right: 0.67in), header: none)
#text(size: 16pt, weight: "bold", fill: ink)[EazyHQ]
#v(2pt)
#text(size: 7.4pt, fill: muted)[Project screenshots - Select an image to open the full-size original]
#v(8pt)
#grid(columns: (1fr, 1fr), rows: 156pt, column-gutter: 8pt, row-gutter: 8pt,
  [#block(width: 100%, height: 137pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/eazyhq/workflow-canvas.png")[#image("../public/project-media/eazyhq/workflow-canvas.png", width: 100%, height: 137pt, fit: "contain", alt: "EazyHQ main interface")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[01. EazyHQ main interface]],
  [#block(width: 100%, height: 137pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/eazyhq/task-performance.png")[#image("../public/project-media/eazyhq/task-performance.png", width: 100%, height: 137pt, fit: "contain", alt: "Task performance and workload analytics")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[02. Task performance and workload analytics]],
  [#block(width: 100%, height: 137pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/eazyhq/campaign-performance.png")[#image("../public/project-media/eazyhq/campaign-performance.png", width: 100%, height: 137pt, fit: "contain", alt: "Campaign delivery and engagement analytics")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[03. Campaign delivery and engagement analytics]],
  [#block(width: 100%, height: 137pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/eazyhq/starter-library.png")[#image("../public/project-media/eazyhq/starter-library.png", width: 100%, height: 137pt, fit: "contain", alt: "Scenario-driven starter library")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[04. Scenario-driven starter library]],
  [#block(width: 100%, height: 137pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/eazyhq/starter-details.png")[#image("../public/project-media/eazyhq/starter-details.png", width: 100%, height: 137pt, fit: "contain", alt: "Starter requirements and generated outputs")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[05. Starter requirements and generated outputs]],
  [#block(width: 100%, height: 137pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/eazyhq/starter-execution.png")[#image("../public/project-media/eazyhq/starter-execution.png", width: 100%, height: 137pt, fit: "contain", alt: "Auditable multi-step starter execution")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[06. Auditable multi-step starter execution]],
  [#block(width: 100%, height: 137pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/eazyhq/event-inspector.png")[#image("../public/project-media/eazyhq/event-inspector.png", width: 100%, height: 137pt, fit: "contain", alt: "Event payload and metadata inspector")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[07. Event payload and metadata inspector]],
  [#block(width: 100%, height: 137pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/eazyhq/dashboard-builder.png")[#image("../public/project-media/eazyhq/dashboard-builder.png", width: 100%, height: 137pt, fit: "contain", alt: "Configurable operational dashboard builder")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[08. Configurable operational dashboard builder]],
)
#set page(width: 8.5in, height: 11in, margin: (top: 0.62in, bottom: 0.56in, left: 0.67in, right: 0.67in), header: none)
#set text(size: 10.2pt)
#set par(leading: 4pt)
#set list(spacing: 6pt)
#text(size: 22pt, weight: "bold", fill: ink)[Listings+]
#v(19pt)
#text(size: 11.5pt, weight: "semibold", fill: ink)[An AI-assisted real-estate platform that turns natural-language intent into structured searches, retrieves live listings, and enriches grounded property results.]
#v(22pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[OVERVIEW]
#v(7pt)
#text(size: 10.2pt, fill: body)[Listings+ is a full-stack property-discovery platform designed to make home search feel conversational. Its AI-assisted retrieval pipeline translates free-form buyer preferences into constrained search parameters, retrieves current listings from multiple property sources, and returns enriched, source-grounded results to a responsive web experience.]
#v(20pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[WHAT I BUILT]
#block(width: 100%, above: 6pt)[
#list(marker: "-", spacing: 6pt,
  [Designed a retrieval workflow that uses OpenAI structured output to turn natural-language home preferences into validated property filters, retrieves live inventory, and falls back gracefully when a model response or search fails.],
  [Built Go API endpoints for AI-assisted home finding, UUID-based result retrieval, and merged property-detail views across eXp Realty, Century 21, and enrichment sources.],
  [Persisted search summaries, generated filters, result sets, sources, and timestamps in PostgreSQL with JSONB for traceability and repeatable retrieval.],
  [Implemented Redis and in-memory caching, a PostgreSQL-backed property-detail cache, Typesense city lookup, listing normalization, enrichment, and image aggregation.],
  [Developed the Next.js interface with responsive listing cards, comparison tables, image carousels, accessible primitives, and server-action boundaries for search and lead workflows.],
  [Containerized PostgreSQL, Redis, Typesense, the Go API, and Caddy; prepared the front end for Cloudflare deployment with OpenNext.],
)
]
#v(18pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[ENGINEERING FOCUS]
#v(7pt)
#text(size: 10.2pt, fill: body)[The model structures buyer intent; the API retrieves current source data; and the interface presents grounded results with persisted provenance. The work spans AI orchestration, external data integration, resilient services, caching, deployment, and responsive information design.]
#v(18pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[TECHNOLOGIES]
#v(7pt)
#text(size: 10pt, fill: body)[Next.js, React, TypeScript, Go, OpenAI API, PostgreSQL, Redis, Typesense, Docker, Caddy, Cloudflare]
#v(18pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[SOURCE]
#v(7pt)
#link("https://github.com/WTMx3/listingsplus")[#text(size: 10pt, fill: accent)[https://github.com/WTMx3/listingsplus]]
#set page(width: 8.5in, height: 11in, margin: (top: 0.45in, bottom: 0.45in, left: 0.67in, right: 0.67in), header: none)
#text(size: 16pt, weight: "bold", fill: ink)[Listings+]
#v(2pt)
#text(size: 7.4pt, fill: muted)[Project screenshots - Select an image to open the full-size original]
#v(8pt)
#grid(columns: (1fr, 1fr), rows: 123pt, column-gutter: 8pt, row-gutter: 8pt,
  [#block(width: 100%, height: 104pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/listingsplus/property-discovery.png")[#image("../public/project-media/listingsplus/property-discovery.png", width: 100%, height: 104pt, fit: "contain", alt: "Listings+ main interface")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[01. Listings+ main interface]],
  [#block(width: 100%, height: 104pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/listingsplus/property-and-call-workspace.png")[#image("../public/project-media/listingsplus/property-and-call-workspace.png", width: 100%, height: 104pt, fit: "contain", alt: "Property detail, guided matching, and call context")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[02. Property detail, guided matching, and call context]],
  [#block(width: 100%, height: 104pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/listingsplus/guided-property-match.png")[#image("../public/project-media/listingsplus/guided-property-match.png", width: 100%, height: 104pt, fit: "contain", alt: "Guided buyer match on a property page")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[03. Guided buyer match on a property page]],
  [#block(width: 100%, height: 104pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/listingsplus/listing-grid.jpg")[#image("../public/project-media/listingsplus/listing-grid.jpg", width: 100%, height: 104pt, fit: "contain", alt: "Searchable inventory grid with normalized listing cards")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[04. Searchable inventory grid with normalized listing cards]],
  [#block(width: 100%, height: 104pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/listingsplus/property-page-full.jpg")[#image("../public/project-media/listingsplus/property-page-full.jpg", width: 100%, height: 104pt, fit: "contain", alt: "Full property listing and details")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[05. Full property listing and details]],
  [#block(width: 100%, height: 104pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/listingsplus/service-area-map.png")[#image("../public/project-media/listingsplus/service-area-map.png", width: 100%, height: 104pt, fit: "contain", alt: "Geographic service-area visualization")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[06. Geographic service-area visualization]],
  [#block(width: 100%, height: 104pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/listingsplus/campaign-list.png")[#image("../public/project-media/listingsplus/campaign-list.png", width: 100%, height: 104pt, fit: "contain", alt: "Campaign management and status")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[07. Campaign management and status]],
  [#block(width: 100%, height: 104pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/listingsplus/campaign-creation.png")[#image("../public/project-media/listingsplus/campaign-creation.png", width: 100%, height: 104pt, fit: "contain", alt: "Campaign creation workflow")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[08. Campaign creation workflow]],
  [#block(width: 100%, height: 104pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/listingsplus/campaign-flow.png")[#image("../public/project-media/listingsplus/campaign-flow.png", width: 100%, height: 104pt, fit: "contain", alt: "Visual buyer nurture flow builder")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[09. Visual buyer nurture flow builder]],
  [#block(width: 100%, height: 104pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/listingsplus/sales-dashboard.png")[#image("../public/project-media/listingsplus/sales-dashboard.png", width: 100%, height: 104pt, fit: "contain", alt: "Sales and payment analytics dashboard")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[10. Sales and payment analytics dashboard]],
)
#set page(width: 8.5in, height: 11in, margin: (top: 0.62in, bottom: 0.56in, left: 0.67in, right: 0.67in), header: none)
#set text(size: 10.2pt)
#set par(leading: 4pt)
#set list(spacing: 6pt)
#text(size: 22pt, weight: "bold", fill: ink)[DOCHUB - Secure Document Sharing Platform]
#v(19pt)
#text(size: 11.5pt, weight: "semibold", fill: ink)[A secure workspace for creating, organizing, versioning, and sharing connected documents and proposals.]
#v(22pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[OVERVIEW]
#v(7pt)
#text(size: 10.2pt, fill: body)[DOCHUB brings proposals, documentation, plans, and decisions into one focused document workspace. Readers can sign in with a passwordless email code or open a shared document using a collection code. Workspace access and document-level sharing are kept distinct, while a connected document tree helps people move through related information with context.]
#v(20pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[WHAT I BUILT]
#block(width: 100%, above: 6pt)[
#list(marker: "-", spacing: 6pt,
  [Designed workspace-scoped access and a document access code flow for sharing individual documents with external readers.],
  [Built a passwordless sign-in flow using a six-digit email code for workspace access.],
  [Organized documents into a navigable tree so proposals, plans, and decisions retain their relationships.],
  [Developed an authoring experience with Markdown editing, preview, media selection, and document publishing states.],
  [Added version-aware document workflows so teams can revise content while preserving a clear publishing path.],
  [Created a responsive reading experience for long-form documents and shared collections.],
)
]
#v(18pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[ENGINEERING FOCUS]
#v(7pt)
#text(size: 10.2pt, fill: body)[DOCHUB demonstrates access boundaries, thoughtful document organization, a clear author-to-reader workflow, and secure sharing across internal workspaces and external recipients. The interface is designed to keep related information together while making the current document easy to read and act on.]
#v(18pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[TECHNOLOGIES]
#v(7pt)
#text(size: 10pt, fill: body)[Next.js, React, TypeScript, Markdown, Cloud Storage]
#v(18pt)
#text(size: 8.7pt, weight: "bold", fill: accent)[SOURCE]
#v(7pt)
#link("https://github.com/WTMx3/dochub")[#text(size: 10pt, fill: accent)[https://github.com/WTMx3/dochub]]
#set page(width: 8.5in, height: 11in, margin: (top: 0.45in, bottom: 0.45in, left: 0.67in, right: 0.67in), header: none)
#text(size: 16pt, weight: "bold", fill: ink)[DOCHUB - Secure Document Sharing Platform]
#v(2pt)
#text(size: 7.4pt, fill: muted)[Project screenshots - Select an image to open the full-size original]
#v(8pt)
#grid(columns: (1fr, 1fr), rows: 211pt, column-gutter: 8pt, row-gutter: 8pt,
  [#block(width: 100%, height: 192pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/dochub/document-access.png")[#image("../public/project-media/dochub/document-access.png", width: 100%, height: 192pt, fit: "contain", alt: "DOCHUB - Secure Document Sharing Platform main interface")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[01. DOCHUB - Secure Document Sharing Platform main interface]],
  [#block(width: 100%, height: 192pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/dochub/document-library.png")[#image("../public/project-media/dochub/document-library.png", width: 100%, height: 192pt, fit: "contain", alt: "Workspace document library and publishing status")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[02. Workspace document library and publishing status]],
  [#block(width: 100%, height: 192pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/dochub/document-reader.png")[#image("../public/project-media/dochub/document-reader.png", width: 100%, height: 192pt, fit: "contain", alt: "Connected long-form document reader")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[03. Connected long-form document reader]],
  [#block(width: 100%, height: 192pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/dochub/workspace-documents.png")[#image("../public/project-media/dochub/workspace-documents.png", width: 100%, height: 192pt, fit: "contain", alt: "Document organization and storage operations")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[04. Document organization and storage operations]],
  [#block(width: 100%, height: 192pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/dochub/document-editor.png")[#image("../public/project-media/dochub/document-editor.png", width: 100%, height: 192pt, fit: "contain", alt: "Markdown editor with live preview")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[05. Markdown editor with live preview]],
  [#block(width: 100%, height: 192pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[
    #link("https://thomasmiller.cv/project-media/dochub/media-picker.png")[#image("../public/project-media/dochub/media-picker.png", width: 100%, height: 192pt, fit: "contain", alt: "Media selection within the document workflow")]
   ]
   #v(3pt)
   #text(size: 7pt, fill: muted)[06. Media selection within the document workflow]],
)

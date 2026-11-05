#set document(
  title: "Thomas Miller - Portfolio Resume",
  author: ("Thomas Miller",),
  description: "Platform-focused engineer with more than 10 years of experience building full-stack products and the systems that keep them reliable: cloud infrastructure, CI/CD, observability, identity and access management, scalable architecture, incident response, and technical leadership.",
)
#set page(
  paper: "us-letter",
  margin: (top: 0.62in, bottom: 0.62in, left: 0.72in, right: 0.72in),
  numbering: "1",
  number-align: right,
)
#let ink = rgb("#18191b")
#let body = rgb("#42454a")
#let muted = rgb("#70747a")
#let rule = rgb("#d7d7d4")
#let accent = rgb("#2d2f32")
#set text(font: ("Segoe UI", "Arial"), size: 10pt, fill: body)
#set par(leading: 1em)
#set list(indent: 12pt, body-indent: 6pt, spacing: 6pt, tight: false)
#show link: set text(fill: accent)
#let section(title) = {
  v(11pt)
  grid(columns: (auto, 1fr), gutter: 9pt, align: horizon,
    text(size: 11.4pt, weight: "bold", fill: ink, tracking: 0.55pt, upper(title)),
    line(length: 100%, stroke: 0.55pt + rule),
  )
  v(6.5pt)
}
#grid(columns: (1fr, auto), gutter: 18pt, align: top,
  [#text(size: 17pt, weight: "bold", fill: ink)[Thomas Miller]
   #v(3pt)
   #text(size: 9.5pt, fill: muted)[Software engineer | Product and platform development]],
  [#align(right)[#text(size: 8.5pt)[
    #link("mailto:mail@thomasmiller.cv")[mail\@thomasmiller.cv] |
    #link("tel:+12143991411")[214-399-1411] \
    #link("https://thomasmiller.cv")[thomasmiller.cv] |
    #link("https://github.com/WTMx3")[GitHub]  |  #link("https://www.linkedin.com/in/wtmx3")[LinkedIn]
  ]]],
)
#v(40pt)
#grid(columns: (1fr, auto), gutter: 18pt, align: bottom,
  [#text(size: 22pt, weight: "bold", fill: ink)[Cover letter]],
  [#text(size: 9.6pt, fill: muted)[November 5, 2026]],
)
#v(9pt)
#line(length: 100%, stroke: 0.8pt + accent)
#v(28pt)
#text(size: 11pt, weight: "semibold", fill: ink)[Dear Hiring Team,]
#v(14pt)
#block(width: 100%)[#set text(size: 10.5pt); #set par(leading: 1.15em); I am a senior software engineer who turns ambiguous product needs into dependable systems. My work spans product and platform engineering: customer-facing applications, APIs, cloud infrastructure, delivery automation, observability, and the operating practices that keep software healthy after launch.]
#v(14pt)
#block(width: 100%)[#set text(size: 10.5pt); #set par(leading: 1.15em); At BAAS Software, I own the complete software product lifecycle across web, mobile, cloud, DevOps, reliability, and security. I lead work from early planning and architecture through implementation, release, monitoring, support, and continuous improvement.]
#v(14pt)
#block(width: 100%)[#set text(size: 10.5pt); #set par(leading: 1.15em); Earlier roles strengthened my experience in enterprise reliability, incident response, quality engineering, accessible interfaces, and client-focused delivery. I am most valuable where a team needs both breadth and follow-through: someone who can shape the architecture, write the software, improve the path to production, and remain accountable for the result in operation.]
#v(14pt)
#block(width: 100%)[#set text(size: 10.5pt); #set par(leading: 1.15em); I would welcome the opportunity to discuss how that combination could support your products, engineering organization, and customers. Thank you for your consideration.]
#v(18pt)
#text(size: 10.5pt)[Sincerely,]
#v(6pt)
#text(size: 11pt, weight: "semibold", fill: ink)[Thomas Miller]
#pagebreak()
#grid(columns: (1fr, auto), gutter: 18pt, align: top,
  [#text(size: 26pt, weight: "bold", fill: ink)[Thomas Miller]],
  [#align(right)[#text(size: 8.5pt)[
    #link("mailto:mail@thomasmiller.cv")[mail\@thomasmiller.cv] |
    #link("tel:+12143991411")[214-399-1411] \
    #link("https://thomasmiller.cv")[thomasmiller.cv] |
    #link("https://github.com/WTMx3")[GitHub]  |  #link("https://www.linkedin.com/in/wtmx3")[LinkedIn]
  ]]],
)
#v(14pt)
#section("Summary")
Platform-focused engineer with more than 10 years of experience building full-stack products and the systems that keep them reliable: cloud infrastructure, CI/CD, observability, identity and access management, scalable architecture, incident response, and technical leadership.
#section("Skills")
#grid(columns: (1fr, 1fr), column-gutter: 18pt, row-gutter: 7pt,
  [#block(breakable: false)[
    #set par(leading: 0.72em)
    #text(size: 9pt, weight: "bold", fill: ink)[Languages]
    #v(2pt)
    #text(size: 8.55pt, fill: body)[HTML, CSS, Sass, Less, JavaScript, TypeScript, Java, Go, Python, C\#]
  ]],
  [#block(breakable: false)[
    #set par(leading: 0.72em)
    #text(size: 9pt, weight: "bold", fill: ink)[Web Development]
    #v(2pt)
    #text(size: 8.55pt, fill: body)[React, Next.js, Tailwind CSS, Bootstrap, Context API, Redux, Zustand, Jest, Vite, Selenium, Storybook]
  ]],
  [#block(breakable: false)[
    #set par(leading: 0.72em)
    #text(size: 9pt, weight: "bold", fill: ink)[API Development]
    #v(2pt)
    #text(size: 8.55pt, fill: body)[Node.js, Express, Fiber, Gin, Django, Spring Boot, GraphQL, Headless CMS]
  ]],
  [#block(breakable: false)[
    #set par(leading: 0.72em)
    #text(size: 9pt, weight: "bold", fill: ink)[App Development]
    #v(2pt)
    #text(size: 8.55pt, fill: body)[Flutter, Ionic, .NET, React Native, Three.js, Unity, Unreal Engine]
  ]],
  [#block(breakable: false)[
    #set par(leading: 0.72em)
    #text(size: 9pt, weight: "bold", fill: ink)[Infrastructure]
    #v(2pt)
    #text(size: 8.55pt, fill: body)[AWS, Docker, Docker Swarm, Kubernetes, Serverless, Terraform, Layer 4 and 7 Networking, HAProxy, NGINX, Load Balancing]
  ]],
  [#block(breakable: false)[
    #set par(leading: 0.72em)
    #text(size: 9pt, weight: "bold", fill: ink)[Security, Authentication, and Authorization]
    #v(2pt)
    #text(size: 8.55pt, fill: body)[IAM, JWT, Session Management, Cookies, CORS, CSRF, RBAC, PBAC, Keycloak, Okta, Active Directory, LDAP]
  ]],
  [#block(breakable: false)[
    #set par(leading: 0.72em)
    #text(size: 9pt, weight: "bold", fill: ink)[DevOps]
    #v(2pt)
    #text(size: 8.55pt, fill: body)[CI/CD, GitOps, Git, GitHub, GitLab, ECR, Artifactory, Docker Hub, GitHub Actions, GitLab CI/CD, Jenkins, CircleCI, Fleet, Helm, Prometheus, Grafana, ELK, Datadog, Splunk]
  ]],
  [#block(breakable: false)[
    #set par(leading: 0.72em)
    #text(size: 9pt, weight: "bold", fill: ink)[Site Reliability Engineering]
    #v(2pt)
    #text(size: 8.55pt, fill: body)[High Availability, Latency Optimization, Auto Scaling, Monitoring, Incident Response, Post-Incident Review]
  ]],
  [#block(breakable: false)[
    #set par(leading: 0.72em)
    #text(size: 9pt, weight: "bold", fill: ink)[Testing]
    #v(2pt)
    #text(size: 8.55pt, fill: body)[Unit Testing, Integration Testing, End-to-End Testing, Performance Testing, Security Testing]
  ]],
  [#block(breakable: false)[
    #set par(leading: 0.72em)
    #text(size: 9pt, weight: "bold", fill: ink)[Data and Databases]
    #v(2pt)
    #text(size: 8.55pt, fill: body)[Data Modeling, Normalization, ER Diagrams, Data Integrity, PostgreSQL, MySQL, MongoDB, DynamoDB, Cassandra, Redis, RabbitMQ, Kafka]
  ]],
  [#block(breakable: false)[
    #set par(leading: 0.72em)
    #text(size: 9pt, weight: "bold", fill: ink)[Software Architecture]
    #v(2pt)
    #text(size: 8.55pt, fill: body)[Monoliths, Microservices, Domain-Driven Design, Test-Driven Development, Event-Driven Architecture, System Design]
  ]],
  [#block(breakable: false)[
    #set par(leading: 0.72em)
    #text(size: 9pt, weight: "bold", fill: ink)[Technical Documentation]
    #v(2pt)
    #text(size: 8.55pt, fill: body)[API Documentation, Code Documentation, Architecture, Requirements, System Design, Deployment, User Manuals, Swagger, Postman, UML, Lucidchart, Docusaurus]
  ]],
  [#block(breakable: false)[
    #set par(leading: 0.72em)
    #text(size: 9pt, weight: "bold", fill: ink)[Project Management]
    #v(2pt)
    #text(size: 8.55pt, fill: body)[Agile, Scrum, Cross-Functional Collaboration, Mentoring]
  ]],
)
#v(11pt)
#line(length: 100%, stroke: 0.55pt + rule)
#v(8pt)
#grid(columns: (1fr, 1fr), gutter: 22pt,
  [#text(size: 8.1pt, weight: "semibold", fill: muted, tracking: 0.75pt)[EDUCATION]
   #v(3pt)
   #text(size: 9.6pt, weight: "bold", fill: ink)[Bachelor of Business Administration (BBA)]
   #v(1.5pt)
   #text(size: 8.7pt, fill: body)[Texas Tech University | Information Technology - Emphasis in Application Development]
   #v(1.5pt)
   #text(size: 8.4pt, fill: muted)[Fall 2015 - Spring 2020]],
  [#text(size: 8.1pt, weight: "semibold", fill: muted, tracking: 0.75pt)[ACCOLADE]
   #v(3pt)
   #text(size: 9.6pt, weight: "bold", fill: ink)[Vice President]
   #v(1.5pt)
   #text(size: 8.7pt, fill: body)[Quality Engineering Society, USAA]
   #v(1.5pt)
   #text(size: 8.4pt, fill: muted)[March 2021 - July 2022]],
)
#pagebreak()
#set page(header: none)
#set text(size: 10pt)
#set list(spacing: 5pt)
#section("Employment History")
#block(above: 11pt, below: 16pt, breakable: false)[
#grid(columns: (1fr, auto), gutter: 12pt, align: top,
  [#text(size: 13pt, weight: "bold", fill: ink)[Senior Software Engineer]
   #v(3pt)
   #text(size: 10pt, weight: "semibold", fill: accent)[BAAS Software | Remote]],
  [#text(size: 9.3pt, fill: muted)[June 2022 - Present]],
)
#v(9pt)
#text(size: 8pt, weight: "semibold", fill: muted, tracking: 0.7pt)[POSITION SUMMARY]
#v(3pt)
#text(size: 9.6pt, fill: body)[Own the complete software product lifecycle across web, mobile, cloud, DevOps, reliability, and security.]
#v(9pt)
#text(size: 8pt, weight: "semibold", fill: muted, tracking: 0.7pt)[SELECTED ACCOMPLISHMENTS]
#set text(size: 9.25pt)
#block(width: 100%, above: 6pt)[
#list(
  [Led products from concept and client discovery through architecture, full-stack implementation, launch, monitoring, and ongoing support.],
  [Built customer-facing web and mobile applications, APIs, automation systems, and internal platforms across cloud and containerized environments.],
  [Created GitHub Actions release pipelines for AWS, Cloudflare, Docker, web, and mobile targets; reduced release time by 40% while helping maintain 99.9% uptime.],
  [Established production monitoring, alerting, and incident workflows with Prometheus, Grafana, and Kibana, carrying corrective work through deployment.],
  [Strengthened platform security with least-privilege AWS IAM policies, access-risk remediation, and OAuth 2.0, SSO, 2FA, and secure session flows.],
  [Turned ambiguous business requests into executable roadmaps and production systems while coordinating engineering, product, operations, and customers.],
)
]
#v(12pt)
#line(length: 100%, stroke: 0.5pt + rule)
]
#block(above: 11pt, below: 16pt, breakable: false)[
#grid(columns: (1fr, auto), gutter: 12pt, align: top,
  [#text(size: 13pt, weight: "bold", fill: ink)[Software Engineer III]
   #v(3pt)
   #text(size: 10pt, weight: "semibold", fill: accent)[USAA | Remote]],
  [#text(size: 9.3pt, fill: muted)[June 2020 - July 2022]],
)
#v(9pt)
#text(size: 8pt, weight: "semibold", fill: muted, tracking: 0.7pt)[POSITION SUMMARY]
#v(3pt)
#text(size: 9.6pt, fill: body)[Strengthened enterprise reliability, delivery automation, quality engineering, and incident response.]
#v(9pt)
#text(size: 8pt, weight: "semibold", fill: muted, tracking: 0.7pt)[SELECTED ACCOMPLISHMENTS]
#set text(size: 9.25pt)
#block(width: 100%, above: 6pt)[
#list(
  [Automated deployment and development workflows to improve release consistency, service stability, and recovery from failed changes.],
  [Implemented real-time monitoring and alerting, supported production incidents, and turned post-incident findings into reliability improvements.],
  [Partnered with engineering, security, and operations to address performance bottlenecks, vulnerabilities, and recurring operational risks.],
  [Advanced automated integration, regression, and performance testing across teams as Vice President of the Quality Engineering Society.],
  [Mentored engineers in site reliability, troubleshooting, and quality practices while contributing to resilient service designs.],
)
]
#v(12pt)
#line(length: 100%, stroke: 0.5pt + rule)
]
#pagebreak()
#section("Employment History (continued)")
#block(above: 11pt, below: 16pt, breakable: false)[
#grid(columns: (1fr, auto), gutter: 12pt, align: top,
  [#text(size: 13pt, weight: "bold", fill: ink)[Software Engineer]
   #v(3pt)
   #text(size: 10pt, weight: "semibold", fill: accent)[Web Plant Media | Remote]],
  [#text(size: 9.3pt, fill: muted)[July 2018 - May 2020]],
)
#v(9pt)
#text(size: 8pt, weight: "semibold", fill: muted, tracking: 0.7pt)[POSITION SUMMARY]
#v(3pt)
#text(size: 9.6pt, fill: body)[Built custom WordPress and React experiences while modernizing client platforms, cloud infrastructure, and delivery practices.]
#v(9pt)
#text(size: 8pt, weight: "semibold", fill: muted, tracking: 0.7pt)[SELECTED ACCOMPLISHMENTS]
#set text(size: 9.25pt)
#block(width: 100%, above: 6pt)[
#list(
  [Built reusable React components and custom WordPress themes that standardized responsive navigation, content, forms, and interactive experiences.],
  [Led client UI/UX work from requirements and user flows through design, accessible implementation, and iterative delivery.],
  [Migrated client websites to AWS to improve performance, availability, security, and hosting efficiency.],
  [Added monitoring, alerting, logging, backups, and disaster-recovery procedures to reduce operational risk and speed restoration.],
  [Improved page speed, search visibility, accessibility, and data protection across a portfolio of client sites.],
)
]
#v(12pt)
#line(length: 100%, stroke: 0.5pt + rule)
]
#block(above: 11pt, below: 16pt, breakable: false)[
#grid(columns: (1fr, auto), gutter: 12pt, align: top,
  [#text(size: 13pt, weight: "bold", fill: ink)[Software Engineer]
   #v(3pt)
   #text(size: 10pt, weight: "semibold", fill: accent)[Caprock Custom Apps]],
  [#text(size: 9.3pt, fill: muted)[February 2017 - July 2018]],
)
#v(9pt)
#text(size: 8pt, weight: "semibold", fill: muted, tracking: 0.7pt)[POSITION SUMMARY]
#v(3pt)
#text(size: 9.6pt, fill: body)[Delivered custom web and mobile products from discovery and architecture through app-store release and support.]
#v(9pt)
#text(size: 8pt, weight: "semibold", fill: muted, tracking: 0.7pt)[SELECTED ACCOMPLISHMENTS]
#set text(size: 9.25pt)
#block(width: 100%, above: 6pt)[
#list(
  [Defined product scope and technical plans directly with clients and cross-functional teams, then delivered web and mobile applications through launch.],
  [Built front-end experiences, Node.js and Express services, APIs, integrations, and data workflows for custom products.],
  [Improved service architecture and request handling, reducing response times by up to 30% for key features.],
  [Released multiple applications through mobile app stores and managed updates and post-launch support.],
  [Introduced reusable patterns that reduced technical debt and shortened debugging time.],
)
]
#v(12pt)
#line(length: 100%, stroke: 0.5pt + rule)
]
#block(above: 11pt, below: 16pt, breakable: false)[
#grid(columns: (1fr, auto), gutter: 12pt, align: top,
  [#text(size: 13pt, weight: "bold", fill: ink)[IT Support Technician / Supervisor]
   #v(3pt)
   #text(size: 10pt, weight: "semibold", fill: accent)[IT Help Central]],
  [#text(size: 9.3pt, fill: muted)[November 2015 - August 2017]],
)
#v(9pt)
#text(size: 8pt, weight: "semibold", fill: muted, tracking: 0.7pt)[POSITION SUMMARY]
#v(3pt)
#text(size: 9.6pt, fill: body)[Resolved complex technology issues, led support operations, and created knowledge resources for a large university community.]
#v(9pt)
#text(size: 8pt, weight: "semibold", fill: muted, tracking: 0.7pt)[SELECTED ACCOMPLISHMENTS]
#set text(size: 9.25pt)
#block(width: 100%, above: 6pt)[
#list(
  [Earned promotion to Lead Technician, coordinated daily support operations, and led technical projects for a large university community.],
  [Resolved software, hardware, account, network, and endpoint issues for students, faculty, and staff across walk-up, phone, and on-site channels.],
  [Created searchable troubleshooting documentation used by thousands of Texas Tech University users and support technicians.],
  [Investigated root causes, coordinated escalations with specialized IT teams, and communicated solutions clearly to people with varied technical experience.],
)
]
#v(12pt)
#line(length: 100%, stroke: 0.5pt + rule)
]
#pagebreak()
#set page(header: none)
#set text(size: 9.2pt)
#set list(spacing: 4.2pt)
#text(size: 20pt, weight: "bold", fill: ink)[EazyHQ]
#v(4pt)
#text(size: 9.2pt, weight: "semibold", fill: accent)[Lead Software Engineer | 2026]
#v(8pt)
#line(length: 100%, stroke: 0.7pt + accent)
#v(12pt)
#block(width: 100%, height: 110pt, clip: true, radius: 5pt, fill: rgb("#f1f2f3"))[
  #image("../public/project-media/eazyhq/workflow-canvas.png", width: 100%, height: 110pt, fit: "cover", alt: "EazyHQ product interface")
]
#v(12pt)
#grid(columns: (1.58fr, 1fr), gutter: 22pt, align: top,
  [#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[OVERVIEW]
   #v(4pt)
   #text(size: 9.15pt, fill: body)[A modular workspace operating system for projects, data, automation, content, and team workflows.]
   #v(11pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[WHAT I BUILT]
   #set text(size: 8.65pt)
   #set list(spacing: 3.8pt)
   #block(width: 100%, above: 6pt)[
   #list(
     [Designed a registry-first add-on architecture with build-time linking and workspace-level enablement.],
     [Built event-driven automation infrastructure covering subscriptions, queued steps, waits, execution logs, and run histories.],
     [Developed workspace dashboards with configurable tabs, permission-aware editing, and add-on-provided widgets.],
     [Implemented platform capabilities for forms, structured data, APIs, sites, email, calendars, storage, reports, directories, and wikis.],
     [Created a cross-platform Flutter interface backed by a Go service layer, PostgreSQL, Redis, and containerized deployment.],
     [Established GitHub Actions and Docker-based delivery workflows for the API and web application.],
   )
   ]
  ],
  [#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[TECHNOLOGIES]
   #v(4pt)
   #text(size: 8.75pt, fill: body)[Flutter, Dart, Go, PostgreSQL, Redis, Docker, GitHub Actions, Caddy]
   #v(9pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[ENGINEERING FOCUS]
   #v(4pt)
   #text(size: 8.75pt, fill: body)[The project demonstrates full-stack platform design: authorization boundaries, stable extension contracts, event-driven execution, operational recovery, responsive interface systems, and deployment automation.]
   #v(9pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[SOURCE]
   #v(4pt)
   #link("https://github.com/WTMx3/eazyhq")[#text(size: 8.1pt, fill: accent)[https://github.com/WTMx3/eazyhq]]
  ],
)
#v(11pt)
#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[PRODUCT VIEWS]
#v(6pt)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  [#block(width: 100%, height: 88pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/eazyhq/task-performance.png", width: 100%, height: 88pt, fit: "cover", alt: "Task performance and workload analytics")
  ]],
  [#block(width: 100%, height: 88pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/eazyhq/campaign-performance.png", width: 100%, height: 88pt, fit: "cover", alt: "Campaign delivery and engagement analytics")
  ]],
)
#pagebreak()
#set page(header: none)
#set text(size: 9.2pt)
#set list(spacing: 4.2pt)
#text(size: 20pt, weight: "bold", fill: ink)[Listings+]
#v(4pt)
#text(size: 9.2pt, weight: "semibold", fill: accent)[Full-Stack Software Engineer | 2026]
#v(8pt)
#line(length: 100%, stroke: 0.7pt + accent)
#v(12pt)
#block(width: 100%, height: 110pt, clip: true, radius: 5pt, fill: rgb("#f1f2f3"))[
  #image("../public/project-media/listingsplus/property-discovery.png", width: 100%, height: 110pt, fit: "cover", alt: "Listings+ product interface")
]
#v(12pt)
#grid(columns: (1.58fr, 1fr), gutter: 22pt, align: top,
  [#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[OVERVIEW]
   #v(4pt)
   #text(size: 9.15pt, fill: body)[An AI-assisted real-estate platform that turns natural-language intent into structured searches, retrieves live listings, and enriches grounded property results.]
   #v(11pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[WHAT I BUILT]
   #set text(size: 8.65pt)
   #set list(spacing: 3.8pt)
   #block(width: 100%, above: 6pt)[
   #list(
     [Designed a retrieval workflow that uses OpenAI structured output to turn natural-language home preferences into validated property filters, retrieves live inventory, and falls back gracefully when a model response or search fails.],
     [Built Go API endpoints for AI-assisted home finding, UUID-based result retrieval, and merged property-detail views across eXp Realty, Century 21, and enrichment sources.],
     [Persisted search summaries, generated filters, result sets, sources, and timestamps in PostgreSQL with JSONB for traceability and repeatable retrieval.],
     [Implemented Redis and in-memory caching, a PostgreSQL-backed property-detail cache, Typesense city lookup, listing normalization, enrichment, and image aggregation.],
     [Developed the Next.js interface with responsive listing cards, comparison tables, image carousels, accessible primitives, and server-action boundaries for search and lead workflows.],
     [Containerized PostgreSQL, Redis, Typesense, the Go API, and Caddy; prepared the front end for Cloudflare deployment with OpenNext.],
   )
   ]
  ],
  [#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[TECHNOLOGIES]
   #v(4pt)
   #text(size: 8.75pt, fill: body)[Next.js, React, TypeScript, Go, OpenAI API, PostgreSQL, Redis, Typesense, Docker, Caddy, Cloudflare]
   #v(9pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[ENGINEERING FOCUS]
   #v(4pt)
   #text(size: 8.75pt, fill: body)[The model structures buyer intent; the API retrieves current source data; and the interface presents grounded results with persisted provenance. The work spans AI orchestration, external data integration, resilient services, caching, deployment, and responsive information design.]
   #v(9pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[SOURCE]
   #v(4pt)
   #link("https://github.com/WTMx3/listingsplus")[#text(size: 8.1pt, fill: accent)[https://github.com/WTMx3/listingsplus]]
  ],
)
#v(11pt)
#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[PRODUCT VIEWS]
#v(6pt)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  [#block(width: 100%, height: 88pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/listingsplus/property-and-call-workspace.png", width: 100%, height: 88pt, fit: "cover", alt: "Property detail, guided matching, and call context")
  ]],
  [#block(width: 100%, height: 88pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/listingsplus/service-area-map.png", width: 100%, height: 88pt, fit: "cover", alt: "Geographic service-area visualization")
  ]],
)
#pagebreak()
#set page(header: none)
#set text(size: 9.2pt)
#set list(spacing: 4.2pt)
#text(size: 20pt, weight: "bold", fill: ink)[DOCHUB - Secure Document Sharing Platform]
#v(4pt)
#text(size: 9.2pt, weight: "semibold", fill: accent)[Lead Software Engineer | 2026]
#v(8pt)
#line(length: 100%, stroke: 0.7pt + accent)
#v(12pt)
#block(width: 100%, height: 110pt, clip: true, radius: 5pt, fill: rgb("#f1f2f3"))[
  #image("../public/project-media/dochub/document-access.png", width: 100%, height: 110pt, fit: "cover", alt: "DOCHUB - Secure Document Sharing Platform product interface")
]
#v(12pt)
#grid(columns: (1.58fr, 1fr), gutter: 22pt, align: top,
  [#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[OVERVIEW]
   #v(4pt)
   #text(size: 9.15pt, fill: body)[A secure workspace for creating, organizing, versioning, and sharing connected documents and proposals.]
   #v(11pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[WHAT I BUILT]
   #set text(size: 8.65pt)
   #set list(spacing: 3.8pt)
   #block(width: 100%, above: 6pt)[
   #list(
     [Designed workspace-scoped access and a document-code path for sharing individual documents with external readers.],
     [Built a passwordless sign-in flow using a six-digit email code for workspace access.],
     [Organized documents into a navigable tree so proposals, plans, and decisions retain their relationships.],
     [Developed an authoring experience with Markdown editing, preview, media selection, and document publishing states.],
     [Added version-aware document workflows so teams can revise content while preserving a clear publishing path.],
     [Created a responsive reading experience for long-form documents and shared collections.],
   )
   ]
  ],
  [#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[TECHNOLOGIES]
   #v(4pt)
   #text(size: 8.75pt, fill: body)[Next.js, React, TypeScript, Markdown, Cloud Storage]
   #v(9pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[ENGINEERING FOCUS]
   #v(4pt)
   #text(size: 8.75pt, fill: body)[DOCHUB demonstrates access boundaries, thoughtful document organization, a clear author-to-reader workflow, and secure sharing across internal workspaces and external recipients. The interface is designed to keep related information together while making the current document easy to read and act on.]
   #v(9pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[SOURCE]
   #v(4pt)
   #link("https://github.com/WTMx3/dochub")[#text(size: 8.1pt, fill: accent)[https://github.com/WTMx3/dochub]]
  ],
)
#v(11pt)
#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[PRODUCT VIEWS]
#v(6pt)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  [#block(width: 100%, height: 88pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/dochub/document-library.png", width: 100%, height: 88pt, fit: "cover", alt: "Workspace document library and publishing status")
  ]],
  [#block(width: 100%, height: 88pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/dochub/document-reader.png", width: 100%, height: 88pt, fit: "cover", alt: "Connected long-form document reader")
  ]],
)

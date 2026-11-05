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
#grid(columns: (1fr, auto), gutter: 20pt, align: top,
  [#text(size: 14pt, weight: "bold", fill: ink)[Thomas Miller]
   #v(2pt)
   #text(size: 9.8pt, fill: muted)[Senior Software Engineer]],
  [#align(right)[#text(size: 9.2pt)[
    #link("mailto:mail\@thomasmiller.cv")[mail\@thomasmiller.cv] \
    #link("tel:+12143991411")[214-399-1411] \
    #link("https://thomasmiller.cv")[thomasmiller.cv]
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
#grid(columns: (1fr, auto), gutter: 20pt, align: top,
  [#text(size: 26.5pt, weight: "bold", fill: ink)[Thomas Miller]
   #v(2.5pt)
   #text(size: 11.6pt, weight: "semibold", fill: accent)[Senior Software Engineer]
   #v(2.5pt)
   #text(size: 9.4pt, fill: muted)[Platform Engineering  |  DevOps  |  Site Reliability  |  Secure Systems]],
  [#align(right)[#text(size: 9.4pt)[
    #link("mailto:mail\@thomasmiller.cv")[mail\@thomasmiller.cv] \
    #link("tel:+12143991411")[214-399-1411] \
    #link("https://thomasmiller.cv")[thomasmiller.cv]
  ]]],
)
#v(7pt)
#line(length: 100%, stroke: 0.9pt + accent)
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
   #text(size: 8.4pt, fill: muted)[November 2020 - July 2022]],
)
#pagebreak()
#set page(header: align(right)[#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.7pt)[THOMAS MILLER | EXPERIENCE]])
#set text(size: 10pt)
#set list(spacing: 4.8pt)
#section("Employment History")
#block(above: 8pt, below: 16pt, breakable: true)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.8pt, weight: "bold", fill: ink)[Senior Software Engineer]],
  [#text(size: 9.5pt, fill: muted)[June 2022 - Present]],
)

#block(width: 100%, above: 4pt)[#text(size: 9.9pt, weight: "semibold", fill: accent)[BAAS Software | Remote]]

#block(width: 100%, above: 5pt, below: 3pt)[#text(size: 9.9pt, fill: body)[Own the complete software product lifecycle across web, mobile, cloud, DevOps, reliability, and security.]]

#block(width: 100%, above: 6pt)[
#list(
  [Lead products from initial idea and concept validation through requirements, planning, architecture, implementation, testing, production launch, monitoring, support, and continuous improvement.],
  [Design and build customer-facing web applications, mobile applications, backend services, APIs, data models, automation systems, and internal platforms across the complete software development lifecycle.],
  [Prepare and release production web and mobile applications, manage versioning and app-store submissions, issue updates, support users, and operate products after launch.],
  [Build GitHub Actions pipelines and repeatable release workflows for cloud, containerized, serverless, static, web, and mobile targets across AWS, Cloudflare, Docker-based platforms, and application stores.],
  [Improve deployment pipelines, operational readiness, and site reliability, helping maintain 99.9% uptime while reducing release time by 40%.],
  [Implement monitoring, logging, dashboards, alerting, and production diagnostics with Prometheus, Grafana, and Kibana; investigate incidents and carry corrective work through deployment.],
  [Design, deploy, and maintain AWS infrastructure, improving application performance and release efficiency while controlling infrastructure costs.],
  [Create least-privilege AWS IAM policies, remediate unauthorized-access risks, and support a 100% security-audit compliance rate; deliver OAuth 2.0, SSO, 2FA, magic links, temporary codes, and secure session workflows.],
  [Translate ambiguous business ideas into executable roadmaps, architecture decisions, delivery plans, and production systems while coordinating stakeholders across engineering, product, operations, and customers.],
)
]
]
#block(above: 8pt, below: 16pt, breakable: true)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.8pt, weight: "bold", fill: ink)[Software Engineer III]],
  [#text(size: 9.5pt, fill: muted)[June 2020 - July 2022]],
)

#block(width: 100%, above: 4pt)[#text(size: 9.9pt, weight: "semibold", fill: accent)[USAA | Remote]]

#block(width: 100%, above: 5pt, below: 3pt)[#text(size: 9.9pt, fill: body)[Strengthened enterprise reliability, delivery automation, quality engineering, and incident response.]]

#block(width: 100%, above: 6pt)[
#list(
  [Served as Vice President of the Quality Engineering Society and advanced automated, integration, regression, and performance-testing practices across engineering teams.],
  [Automated deployment pipelines and repeatable development workflows, improving release consistency, service stability, and recovery from change-related failures.],
  [Partnered across engineering, security, and operations to analyze performance, remediate vulnerabilities, reduce operational risk, and prevent recurring failures.],
  [Implemented real-time monitoring and alerting, supported production incidents, led post-incident reviews, and converted findings into durable reliability improvements.],
  [Contributed to resilient application and service designs aligned with availability, capacity, performance, and maintainability requirements.],
  [Guided engineers in SRE, testing, troubleshooting, and quality practices while helping teams adopt stronger engineering standards.],
)
]
]
#block(above: 8pt, below: 16pt, breakable: true)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.8pt, weight: "bold", fill: ink)[Software Engineer]],
  [#text(size: 9.5pt, fill: muted)[July 2018 - May 2020]],
)

#block(width: 100%, above: 4pt)[#text(size: 9.9pt, weight: "semibold", fill: accent)[Web Plant Media | Remote]]

#block(width: 100%, above: 5pt, below: 3pt)[#text(size: 9.9pt, fill: body)[Built custom WordPress and React experiences while modernizing client platforms, cloud infrastructure, and delivery practices.]]

#block(width: 100%, above: 6pt)[
#list(
  [Developed reusable React component libraries for WordPress themes, giving teams a consistent foundation for navigation, content modules, forms, media, and interactive page experiences.],
)
]
]
#pagebreak()
#block(above: 4pt, below: 16pt, breakable: true)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.2pt, weight: "bold", fill: ink)[Software Engineer (continued)]],
  [#text(size: 9.5pt, fill: muted)[July 2018 - May 2020]],
)
#block(width: 100%, above: 4pt)[#text(size: 9.9pt, weight: "semibold", fill: accent)[Web Plant Media | Remote]]
#block(width: 100%, above: 6pt)[
#list(
  [Designed and built independent WordPress themes with custom templates, responsive layouts, configurable content patterns, and maintainable front-end architecture.],
  [Led UI/UX work from information architecture and user flows through wireframes, visual design, responsive implementation, and iterative refinement with clients and stakeholders.],
  [Created accessible, mobile-first interfaces and reusable design patterns that improved consistency across client sites and reduced repeated implementation work.],
  [Planned and executed client website migrations to AWS, improving performance, availability, security, scalability, and hosting efficiency.],
  [Introduced application monitoring, alerting, and actionable logging to accelerate issue detection, troubleshooting, and performance analysis.],
  [Developed and tested backup and disaster-recovery procedures that reduced operational risk and supported faster service restoration.],
  [Improved page speed, search visibility, accessibility, and data protection across a portfolio of client websites.],
  [Translated business requirements into practical technical solutions, managed expectations, and supported client systems through launch and ongoing maintenance.],
)
]
]
#block(above: 8pt, below: 16pt, breakable: true)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.8pt, weight: "bold", fill: ink)[Software Engineer]],
  [#text(size: 9.5pt, fill: muted)[February 2017 - July 2018]],
)

#block(width: 100%, above: 4pt)[#text(size: 9.9pt, weight: "semibold", fill: accent)[Caprock Custom Apps]]

#block(width: 100%, above: 5pt, below: 3pt)[#text(size: 9.9pt, fill: body)[Delivered custom web and mobile products from discovery and architecture through app-store release and support.]]

#block(width: 100%, above: 6pt)[
#list(
  [Worked directly with clients and cross-functional teams to define requirements, evaluate constraints, shape product scope, and prepare solution plans tied to business outcomes.],
  [Built custom web and mobile applications across front-end interfaces, Node.js and Express services, APIs, integrations, and data workflows.],
  [Optimized service architecture and request handling, reducing response times by up to 30% for key application features.],
  [Carried products from discovery and planning through development, testing, deployment, documentation, launch, and post-production support.],
  [Prepared and released multiple applications through mobile app stores, managed updates, and resolved post-launch technical issues.],
  [Introduced reusable patterns and scalable codebase practices that reduced technical debt and shortened debugging time.],
)
]
]
#block(above: 8pt, below: 16pt, breakable: true)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.8pt, weight: "bold", fill: ink)[IT Support Technician / Supervisor]],
  [#text(size: 9.5pt, fill: muted)[November 2015 - August 2017]],
)

#block(width: 100%, above: 4pt)[#text(size: 9.9pt, weight: "semibold", fill: accent)[IT Help Central]]

#block(width: 100%, above: 5pt, below: 3pt)[#text(size: 9.9pt, fill: body)[Resolved complex technology issues, led support operations, and created knowledge resources for a large university community.]]

#block(width: 100%, above: 6pt)[
#list(
  [Diagnosed and resolved software, hardware, account, network, and endpoint issues for students, faculty, and staff through walk-up, phone, and on-site support.],
  [Created and maintained searchable troubleshooting documentation used by thousands of Texas Tech University users and support technicians.],
  [Earned promotion to Lead Technician, coordinated day-to-day support work, assumed additional operational responsibilities, and led technical projects.],
  [Triaged requests, investigated root causes, escalated effectively, and collaborated with specialized IT teams through resolution.],
  [Explained technical issues and solutions clearly to people with varied experience while maintaining a service-focused support experience.],
)
]
]
#pagebreak()
#set page(header: align(right)[#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.7pt)[PORTFOLIO 01 / 03]])
#set text(size: 9.2pt)
#set list(spacing: 4.2pt)
#grid(columns: (1fr, auto), gutter: 14pt, align: bottom,
  [#text(size: 22pt, weight: "bold", fill: ink)[EazyHQ]],
  [#text(size: 8.8pt, weight: "semibold", fill: muted)[Active development]],
)
#v(4pt)
#text(size: 9.2pt, weight: "semibold", fill: accent)[Lead Software Engineer | June 2026]
#v(8pt)
#line(length: 100%, stroke: 0.7pt + accent)
#v(12pt)
#block(width: 100%, height: 124pt, clip: true, radius: 5pt, fill: rgb("#f1f2f3"))[
  #image("../public/project-media/eazyhq/workflow-canvas.png", width: 100%, height: 124pt, fit: "cover", alt: "EazyHQ product interface")
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
   #v(14pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[ENGINEERING FOCUS]
   #v(4pt)
   #text(size: 8.75pt, fill: body)[The project demonstrates full-stack platform design: authorization boundaries, stable extension contracts, event-driven execution, operational recovery, responsive interface systems, and deployment automation.]
   #v(14pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[SOURCE]
   #v(4pt)
   #link("https://github.com/WTMx3/eazyhq")[#text(size: 8.6pt, fill: accent)[View the sanitized repository]]
  ],
)
#v(14pt)
#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[PRODUCT VIEWS]
#v(5pt)
#grid(columns: (1fr, 1fr, 1fr), gutter: 8pt,
  [#block(width: 100%, height: 54pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/eazyhq/task-performance.png", width: 100%, height: 54pt, fit: "cover", alt: "Task performance and workload analytics")
  ]],
  [#block(width: 100%, height: 54pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/eazyhq/campaign-performance.png", width: 100%, height: 54pt, fit: "cover", alt: "Campaign delivery and engagement analytics")
  ]],
  [#block(width: 100%, height: 54pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/eazyhq/starter-library.png", width: 100%, height: 54pt, fit: "cover", alt: "Scenario-driven starter library")
  ]],
)
#pagebreak()
#set page(header: align(right)[#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.7pt)[PORTFOLIO 02 / 03]])
#set text(size: 9.2pt)
#set list(spacing: 4.2pt)
#grid(columns: (1fr, auto), gutter: 14pt, align: bottom,
  [#text(size: 22pt, weight: "bold", fill: ink)[Listings+]],
  [#text(size: 8.8pt, weight: "semibold", fill: muted)[Portfolio snapshot]],
)
#v(4pt)
#text(size: 9.2pt, weight: "semibold", fill: accent)[Full-Stack Software Engineer | 2025]
#v(8pt)
#line(length: 100%, stroke: 0.7pt + accent)
#v(12pt)
#block(width: 100%, height: 124pt, clip: true, radius: 5pt, fill: rgb("#f1f2f3"))[
  #image("../public/project-media/listingsplus/property-discovery.png", width: 100%, height: 124pt, fit: "cover", alt: "Listings+ product interface")
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
     [Designed a RAG-style retrieval workflow that converts natural-language home preferences into validated filters, retrieves live inventory, and grounds the user experience in source property data.],
     [Integrated OpenAI chat completions with strict JSON output for bedrooms, bathrooms, price, square footage, amenities, and property types, including graceful fallback when model output or filtered retrieval fails.],
     [Built Go API endpoints for AI-assisted home finding, UUID-based result retrieval, and merged property-detail views across eXp Realty, Century 21, and enrichment sources.],
     [Persisted search summaries, generated filters, result sets, sources, and timestamps in PostgreSQL with JSONB for traceability and repeatable retrieval.],
     [Implemented layered performance controls with Redis caching, in-memory TTL caches, and a PostgreSQL-backed property-detail cache.],
     [Added Typesense-powered city lookup, listing normalization, property-detail enrichment, and image aggregation.],
     [Developed the Next.js interface with responsive listing cards, comparison tables, image carousels, accessible primitives, and server-action boundaries for search and lead workflows.],
     [Containerized PostgreSQL, Redis, Typesense, the Go API, and Caddy; prepared the front end for Cloudflare deployment with OpenNext.],
   )
   ]
  ],
  [#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[TECHNOLOGIES]
   #v(4pt)
   #text(size: 8.75pt, fill: body)[Next.js, React, TypeScript, Go, OpenAI API, PostgreSQL, Redis, Typesense, Docker, Caddy, Cloudflare]
   #v(14pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[ENGINEERING FOCUS]
   #v(4pt)
   #text(size: 8.75pt, fill: body)[This is a retrieval-augmented workflow rather than a vector-embedding RAG implementation: the model structures user intent, the API retrieves current source data, and the interface presents grounded results with persisted provenance. The project demonstrates end-to-end product engineering across AI orchestration, external data integration, resilient backend services, caching, deployment, and responsive information design.]
   #v(14pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[SOURCE]
   #v(4pt)
   #link("https://github.com/WTMx3/listingsplus")[#text(size: 8.6pt, fill: accent)[View the sanitized repository]]
  ],
)
#v(14pt)
#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[PRODUCT VIEWS]
#v(5pt)
#grid(columns: (1fr, 1fr, 1fr), gutter: 8pt,
  [#block(width: 100%, height: 54pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/listingsplus/property-and-call-workspace.png", width: 100%, height: 54pt, fit: "cover", alt: "Property detail, guided matching, and call context")
  ]],
  [#block(width: 100%, height: 54pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/listingsplus/service-area-map.png", width: 100%, height: 54pt, fit: "cover", alt: "Geographic service-area visualization")
  ]],
  [#block(width: 100%, height: 54pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/listingsplus/listing-grid.jpg", width: 100%, height: 54pt, fit: "cover", alt: "Searchable inventory grid with normalized listing cards")
  ]],
)
#pagebreak()
#set page(header: align(right)[#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.7pt)[PORTFOLIO 03 / 03]])
#set text(size: 9.2pt)
#set list(spacing: 4.2pt)
#grid(columns: (1fr, auto), gutter: 14pt, align: bottom,
  [#text(size: 22pt, weight: "bold", fill: ink)[PDF Generator Service]],
  [#text(size: 8.8pt, weight: "semibold", fill: muted)[Portfolio snapshot]],
)
#v(4pt)
#text(size: 9.2pt, weight: "semibold", fill: accent)[Backend Software Engineer | 2024]
#v(8pt)
#line(length: 100%, stroke: 0.7pt + accent)
#v(12pt)
#block(width: 100%, height: 124pt, clip: true, radius: 5pt, fill: rgb("#f1f2f3"))[
  #image("../public/project-media/baas-pdf-generator/document-access.png", width: 100%, height: 124pt, fit: "cover", alt: "PDF Generator Service product interface")
]
#v(12pt)
#grid(columns: (1.58fr, 1fr), gutter: 22pt, align: top,
  [#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[OVERVIEW]
   #v(4pt)
   #text(size: 9.15pt, fill: body)[A TypeScript service that renders structured content into polished PDFs and publishes them to S3-compatible storage.]
   #v(11pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[WHAT I BUILT]
   #set text(size: 8.65pt)
   #set list(spacing: 3.8pt)
   #block(width: 100%, above: 6pt)[
   #list(
     [Designed a small Express API for document-generation requests.],
     [Implemented reusable cover and content-page layouts for structured project data.],
     [Integrated Puppeteer and Chromium for predictable server-side PDF rendering.],
     [Added S3-compatible object storage and public file URL responses.],
     [Containerized the service for repeatable builds and deployment.],
     [Added temporary-file cleanup and environment-driven configuration.],
   )
   ]
  ],
  [#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[TECHNOLOGIES]
   #v(4pt)
   #text(size: 8.75pt, fill: body)[TypeScript, Express, Puppeteer, AWS SDK, Docker]
   #v(14pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[ENGINEERING FOCUS]
   #v(4pt)
   #text(size: 8.75pt, fill: body)[The service demonstrates document rendering, cloud storage integration, short-lived file management, container packaging, and the operational concerns involved in exposing a rendering endpoint safely.]
   #v(14pt)
   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[SOURCE]
   #v(4pt)
   #link("https://github.com/WTMx3/baas-pdf-generator")[#text(size: 8.6pt, fill: accent)[View the sanitized repository]]
  ],
)
#v(14pt)
#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[PRODUCT VIEWS]
#v(5pt)
#grid(columns: (1fr, 1fr, 1fr), gutter: 8pt,
  [#block(width: 100%, height: 54pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/baas-pdf-generator/document-library.png", width: 100%, height: 54pt, fit: "cover", alt: "Document library and publishing status")
  ]],
  [#block(width: 100%, height: 54pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/baas-pdf-generator/document-reader.png", width: 100%, height: 54pt, fit: "cover", alt: "Structured long-form document reader")
  ]],
  [#block(width: 100%, height: 54pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[
    #image("../public/project-media/baas-pdf-generator/workspace-documents.png", width: 100%, height: 54pt, fit: "cover", alt: "Workspace document and storage operations")
  ]],
)

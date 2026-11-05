#set document(
  title: "Thomas Miller - Portfolio Resume",
  author: ("Thomas Miller",),
  description: "Platform-focused engineer with more than 10 years of experience building full-stack products and the systems that keep them reliable: cloud infrastructure, CI/CD, observability, identity and access management, scalable architecture, incident response, and technical leadership.",
)
#set page(
  paper: "us-letter",
  margin: (top: 0.58in, bottom: 0.58in, left: 0.7in, right: 0.7in),
  numbering: "1",
  number-align: right,
)
#let ink = rgb("#18191b")
#let body = rgb("#42454a")
#let muted = rgb("#70747a")
#let rule = rgb("#d7d7d4")
#let accent = rgb("#2d2f32")
#set text(font: ("Segoe UI", "Arial"), size: 9.8pt, fill: body)
#set par(leading: 0.9em)
#set list(indent: 11pt, body-indent: 5.5pt, spacing: 5.2pt, tight: false)
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
    #link("mailto:wthomasmiii\@gmail.com")[wthomasmiii\@gmail.com] \
    #link("tel:+19727959884")[(972) 795-9884] \
    #link("https://thomasmiller.cv")[thomasmiller.cv]
  ]]],
)
#v(34pt)
#text(size: 10.2pt, weight: "semibold", fill: muted, tracking: 1.2pt)[COVER LETTER]
#v(18pt)
#text(size: 30pt, weight: "bold", fill: ink)[Reliable products.]
#v(2pt)
#text(size: 30pt, weight: "bold", fill: accent)[Dependable systems.]
#v(22pt)
#text(size: 9.6pt, fill: muted)[November 5, 2026]
#v(17pt)
#text(size: 10.4pt, weight: "semibold", fill: ink)[Dear Hiring Team,]
#v(10pt)
#block(width: 100%)[#set par(leading: 1.05em); I am a senior software engineer who turns ambiguous product needs into dependable systems. My work spans product and platform engineering: customer-facing applications, APIs, cloud infrastructure, delivery automation, observability, and the operating practices that keep software healthy after launch.]
#v(10pt)
#block(width: 100%)[#set par(leading: 1.05em); At BAAS Software, I own the complete software product lifecycle across web, mobile, cloud, DevOps, reliability, and security. I lead work from early planning and architecture through implementation, release, monitoring, support, and continuous improvement.]
#v(10pt)
#block(width: 100%)[#set par(leading: 1.05em); Earlier roles strengthened my experience in enterprise reliability, incident response, quality engineering, accessible interfaces, and client-focused delivery. I am most valuable where a team needs both breadth and follow-through: someone who can shape the architecture, write the software, improve the path to production, and remain accountable for the result in operation.]
#v(10pt)
#block(width: 100%)[#set par(leading: 1.05em); I would welcome the opportunity to discuss how that combination could support your products, engineering organization, and customers. Thank you for your consideration.]
#v(13pt)
#text(size: 10.2pt)[Sincerely,]
#v(5pt)
#text(size: 10.5pt, weight: "semibold", fill: ink)[Thomas Miller]
#v(1fr)
#line(length: 100%, stroke: 0.55pt + rule)
#v(7pt)
#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.8pt)[PRODUCT ENGINEERING   PLATFORM RELIABILITY   SECURE SYSTEMS   TECHNICAL LEADERSHIP]
#pagebreak()
#grid(columns: (1fr, auto), gutter: 20pt, align: top,
  [#text(size: 26.5pt, weight: "bold", fill: ink)[Thomas Miller]
   #v(2.5pt)
   #text(size: 11.6pt, weight: "semibold", fill: accent)[Senior Software Engineer]
   #v(2.5pt)
   #text(size: 9.4pt, fill: muted)[Platform Engineering  |  DevOps  |  Site Reliability  |  Secure Systems]],
  [#align(right)[#text(size: 9.4pt)[
    #link("mailto:wthomasmiii\@gmail.com")[wthomasmiii\@gmail.com] \
    #link("tel:+19727959884")[(972) 795-9884] \
    #link("https://thomasmiller.cv")[thomasmiller.cv]
  ]]],
)
#v(7pt)
#line(length: 100%, stroke: 0.9pt + accent)
#section("Summary")
Platform-focused engineer with more than 10 years of experience building full-stack products and the systems that keep them reliable: cloud infrastructure, CI/CD, observability, identity and access management, scalable architecture, incident response, and technical leadership.
#section("Skills")
#grid(columns: (112pt, 1fr), column-gutter: 10pt, row-gutter: 3.2pt,
  [#set par(leading: 0.5em)
   #text(weight: "semibold", fill: ink)[Languages]],
  [#set par(leading: 0.5em)
   HTML, CSS, Sass, Less, JavaScript, TypeScript, Java, Go, Python, C\#],
  [#set par(leading: 0.5em)
   #text(weight: "semibold", fill: ink)[Web Development]],
  [#set par(leading: 0.5em)
   React, Next.js, Tailwind CSS, Bootstrap, Context API, Redux, Zustand, Jest, Vite, Selenium, Storybook],
  [#set par(leading: 0.5em)
   #text(weight: "semibold", fill: ink)[API Development]],
  [#set par(leading: 0.5em)
   Node.js, Express, Fiber, Gin, Django, Spring Boot, GraphQL, Headless CMS],
  [#set par(leading: 0.5em)
   #text(weight: "semibold", fill: ink)[App Development]],
  [#set par(leading: 0.5em)
   Flutter, Ionic, .NET, React Native, Three.js, Unity, Unreal Engine],
  [#set par(leading: 0.5em)
   #text(weight: "semibold", fill: ink)[Infrastructure]],
  [#set par(leading: 0.5em)
   AWS, Docker, Docker Swarm, Kubernetes, Serverless, Terraform, Layer 4 and 7 Networking, HAProxy, NGINX, Load Balancing],
  [#set par(leading: 0.5em)
   #text(weight: "semibold", fill: ink)[Security, Authentication, and Authorization]],
  [#set par(leading: 0.5em)
   IAM, JWT, Session Management, Cookies, CORS, CSRF, RBAC, PBAC, Keycloak, Okta, Active Directory, LDAP],
  [#set par(leading: 0.5em)
   #text(weight: "semibold", fill: ink)[DevOps]],
  [#set par(leading: 0.5em)
   CI/CD, GitOps, Git, GitHub, GitLab, ECR, Artifactory, Docker Hub, GitHub Actions, GitLab CI/CD, Jenkins, CircleCI, Fleet, Helm, Prometheus, Grafana, ELK, Datadog, Splunk],
  [#set par(leading: 0.5em)
   #text(weight: "semibold", fill: ink)[Site Reliability Engineering]],
  [#set par(leading: 0.5em)
   High Availability, Latency Optimization, Auto Scaling, Monitoring, Incident Response, Post-Incident Review],
  [#set par(leading: 0.5em)
   #text(weight: "semibold", fill: ink)[Testing]],
  [#set par(leading: 0.5em)
   Unit Testing, Integration Testing, End-to-End Testing, Performance Testing, Security Testing],
  [#set par(leading: 0.5em)
   #text(weight: "semibold", fill: ink)[Data and Databases]],
  [#set par(leading: 0.5em)
   Data Modeling, Normalization, ER Diagrams, Data Integrity, PostgreSQL, MySQL, MongoDB, DynamoDB, Cassandra, Redis, RabbitMQ, Kafka],
  [#set par(leading: 0.5em)
   #text(weight: "semibold", fill: ink)[Software Architecture]],
  [#set par(leading: 0.5em)
   Monoliths, Microservices, Domain-Driven Design, Test-Driven Development, Event-Driven Architecture, System Design],
  [#set par(leading: 0.5em)
   #text(weight: "semibold", fill: ink)[Technical Documentation]],
  [#set par(leading: 0.5em)
   API Documentation, Code Documentation, Architecture, Requirements, System Design, Deployment, User Manuals, Swagger, Postman, UML, Lucidchart, Docusaurus],
  [#set par(leading: 0.5em)
   #text(weight: "semibold", fill: ink)[Project Management]],
  [#set par(leading: 0.5em)
   Agile, Scrum, Cross-Functional Collaboration, Mentoring],
)
#section("Education")
#grid(columns: (1fr, auto), gutter: 10pt,
  [#text(size: 11.3pt, weight: "bold", fill: ink)[Bachelor of Business Administration (BBA)]],
  [#text(size: 9.5pt, fill: muted)[Fall 2015 - Spring 2020]],
)
#text(size: 9.7pt, weight: "semibold", fill: accent)[Texas Tech University]
#h(7pt)#text(size: 9.5pt, fill: muted)[Information Technology - Emphasis in Application Development]
#v(3pt)
Completed a business and technology curriculum focused on application development, information systems, and practical software delivery.
#section("Accolades")
#grid(columns: (1fr, auto), gutter: 10pt,
  [#text(size: 11.3pt, weight: "bold", fill: ink)[Vice President]],
  [#text(size: 9.5pt, fill: muted)[November 2020 - July 2022]],
)
#text(size: 9.7pt, weight: "semibold", fill: accent)[Quality Engineering Society, USAA]
#v(3pt)
Elected to help advance quality engineering practices, testing frameworks, mentorship, and operational excellence.
#pagebreak()
#set text(size: 10.1pt)
#section("Employment History")
#block(above: 6pt, below: 15pt, breakable: true)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.5pt, weight: "bold", fill: ink)[Senior Software Engineer]],
  [#text(size: 9.6pt, fill: muted)[June 2022 - Present]],
)

#block(width: 100%, above: 4pt)[#text(size: 9.8pt, weight: "semibold", fill: accent)[BAAS Software | Remote]]

#block(width: 100%, above: 4pt, below: 2pt)[#text(size: 9.8pt, fill: body)[Own the complete software product lifecycle across web, mobile, cloud, DevOps, reliability, and security.]]

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
#block(above: 6pt, below: 15pt, breakable: true)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.5pt, weight: "bold", fill: ink)[Software Engineer III]],
  [#text(size: 9.6pt, fill: muted)[June 2020 - July 2022]],
)

#block(width: 100%, above: 4pt)[#text(size: 9.8pt, weight: "semibold", fill: accent)[USAA | Remote]]

#block(width: 100%, above: 4pt, below: 2pt)[#text(size: 9.8pt, fill: body)[Strengthened enterprise reliability, delivery automation, quality engineering, and incident response.]]

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
#block(above: 6pt, below: 15pt, breakable: true)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.5pt, weight: "bold", fill: ink)[Software Engineer]],
  [#text(size: 9.6pt, fill: muted)[July 2018 - May 2020]],
)

#block(width: 100%, above: 4pt)[#text(size: 9.8pt, weight: "semibold", fill: accent)[Web Plant Media | Remote]]

#block(width: 100%, above: 4pt, below: 2pt)[#text(size: 9.8pt, fill: body)[Built custom WordPress and React experiences while modernizing client platforms, cloud infrastructure, and delivery practices.]]

#block(width: 100%, above: 6pt)[
#list(
  [Developed reusable React component libraries for WordPress themes, giving teams a consistent foundation for navigation, content modules, forms, media, and interactive page experiences.],
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
#block(above: 6pt, below: 15pt, breakable: true)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.5pt, weight: "bold", fill: ink)[Software Engineer]],
  [#text(size: 9.6pt, fill: muted)[February 2017 - July 2018]],
)

#block(width: 100%, above: 4pt)[#text(size: 9.8pt, weight: "semibold", fill: accent)[Caprock Custom Apps]]

#block(width: 100%, above: 4pt, below: 2pt)[#text(size: 9.8pt, fill: body)[Delivered custom web and mobile products from discovery and architecture through app-store release and support.]]

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
#block(above: 6pt, below: 15pt, breakable: true)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.5pt, weight: "bold", fill: ink)[IT Support Technician / Supervisor]],
  [#text(size: 9.6pt, fill: muted)[November 2015 - August 2017]],
)

#block(width: 100%, above: 4pt)[#text(size: 9.8pt, weight: "semibold", fill: accent)[IT Help Central]]

#block(width: 100%, above: 4pt, below: 2pt)[#text(size: 9.8pt, fill: body)[Resolved complex technology issues, led support operations, and created knowledge resources for a large university community.]]

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
#set text(size: 10.2pt)
#section("Selected Portfolio")
#block(above: 6pt, below: 18pt, breakable: false)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.5pt, weight: "bold", fill: ink)[EazyHQ]],
  [#text(size: 9.6pt, fill: muted)[Active development]],
)

#block(width: 100%, above: 4pt)[#text(size: 9.8pt, weight: "semibold", fill: accent)[Lead Software Engineer | June 2026]]

#block(width: 100%, above: 5pt)[A modular workspace operating system for projects, data, automation, content, and team workflows.]

#block(width: 100%, above: 6pt)[#text(size: 9.4pt, fill: muted)[Tech: Flutter, Dart, Go, PostgreSQL, Redis, Docker, GitHub Actions, Caddy]]

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
]
#block(above: 6pt, below: 18pt, breakable: false)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.5pt, weight: "bold", fill: ink)[Listings+]],
  [#text(size: 9.6pt, fill: muted)[Portfolio snapshot]],
)

#block(width: 100%, above: 4pt)[#text(size: 9.8pt, weight: "semibold", fill: accent)[Full-Stack Software Engineer | 2025]]

#block(width: 100%, above: 5pt)[An AI-assisted real-estate platform that turns natural-language intent into structured searches, retrieves live listings, and enriches grounded property results.]

#block(width: 100%, above: 6pt)[#text(size: 9.4pt, fill: muted)[Tech: Next.js, React, TypeScript, Go, OpenAI API, PostgreSQL, Redis, Typesense, Docker, Caddy, Cloudflare]]

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
]
#block(above: 6pt, below: 18pt, breakable: false)[
#grid(columns: (1fr, auto), gutter: 8pt,
  [#text(size: 11.5pt, weight: "bold", fill: ink)[PDF Generator Service]],
  [#text(size: 9.6pt, fill: muted)[Portfolio snapshot]],
)

#block(width: 100%, above: 4pt)[#text(size: 9.8pt, weight: "semibold", fill: accent)[Backend Software Engineer | 2024]]

#block(width: 100%, above: 5pt)[A TypeScript service that renders structured content into polished PDFs and publishes them to S3-compatible storage.]

#block(width: 100%, above: 6pt)[#text(size: 9.4pt, fill: muted)[Tech: TypeScript, Express, Puppeteer, AWS SDK, Docker]]

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
]

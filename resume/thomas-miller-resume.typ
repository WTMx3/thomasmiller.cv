#set document(
  title: "Thomas Miller Resume",
  author: ("Thomas Miller",),
  description: "Professional resume for Thomas Miller.",
)

#set page(
  paper: "us-letter",
  margin: (top: 0.55in, bottom: 0.55in, left: 0.68in, right: 0.68in),
  numbering: "1",
  number-align: right,
)

#let ink = rgb("#17181a")
#let body = rgb("#3f4247")
#let muted = rgb("#6e7278")
#let rule = rgb("#d4d4d1")
#let accent = rgb("#292b2e")

#set text(font: ("Segoe UI", "Arial"), size: 9.7pt, fill: body)
#set par(leading: 0.8em)
#set list(indent: 11pt, body-indent: 5.5pt, spacing: 4.6pt, tight: false)
#show link: set text(fill: accent)

#let section(title) = {
  v(10pt)
  grid(
    columns: (auto, 1fr),
    gutter: 9pt,
    align: horizon,
    text(size: 11.2pt, weight: "bold", fill: ink, tracking: 0.5pt, upper(title)),
    line(length: 100%, stroke: 0.55pt + rule),
  )
  v(5.5pt)
}

#let role-line(role, dates) = grid(
  columns: (1fr, auto),
  gutter: 10pt,
  [#text(size: 11pt, weight: "bold", fill: ink)[#role]],
  [#text(size: 9.2pt, fill: muted)[#dates]],
)

#let company-line(company) = block(width: 100%, above: 2pt)[
  #text(size: 9.4pt, weight: "semibold", fill: accent)[#company]
]

#let job(role, dates, company, bullets) = block(above: 4pt, below: 10pt, breakable: true)[
  #role-line(role, dates)
  #company-line(company)
  #block(width: 100%, above: 4pt)[#list(..bullets)]
]

#grid(columns: (1fr, auto), gutter: 20pt, align: top,
  [#text(size: 25.5pt, weight: "bold", fill: ink)[Thomas Miller]
   #v(2pt)
   #text(size: 11.4pt, weight: "semibold", fill: accent)[Senior Software Engineer]
   #v(2pt)
   #text(size: 9.2pt, fill: muted)[Enterprise Platforms | Configuration Delivery | Reliability]],
  [#align(right)[#text(size: 9.2pt)[
    #link("mailto:mail@thomasmiller.cv")[mail\@thomasmiller.cv] \
    #link("tel:+12143991411")[214-399-1411] \
    #link("https://thomasmiller.cv")[thomasmiller.cv]
  ]]],
)

#v(7pt)
#line(length: 100%, stroke: 0.9pt + accent)

#section("Target Role")
#text(weight: "semibold", fill: ink)[Software Engineer Senior - Life ALIP | USAA | Job R0118533 | Plano, Texas]

#section("Professional Summary")
Former USAA Software Engineer III with more than 10 years of experience designing, delivering, and operating business-critical software across the complete development lifecycle. Translate complex business requirements into configurable workflows, services, integrations, data models, and production releases. Experienced in technical leadership, cross-functional delivery, design and code quality, production troubleshooting, secure cloud engineering, CI/CD, observability, and mentoring. Hands-on background spanning Java, JavaScript/TypeScript, SQL, Python, Go, AWS, Kubernetes, PostgreSQL, Redis, and enterprise delivery tooling.

#section("Core Qualifications")
#grid(columns: (125pt, 1fr), column-gutter: 10pt, row-gutter: 3.5pt,
  [#text(weight: "semibold", fill: ink)[Platform Delivery]],
  [Configurable systems, business rules, workflows, APIs, data models, system integrations, full SDLC],
  [#text(weight: "semibold", fill: ink)[Languages and Data]],
  [Java, JavaScript, TypeScript, SQL, Python, Go, PostgreSQL, Redis, RabbitMQ, Kafka],
  [#text(weight: "semibold", fill: ink)[Cloud and CI/CD]],
  [AWS, Kubernetes, Docker, Terraform, GitLab CI/CD, GitHub Actions, Jenkins, Helm],
  [#text(weight: "semibold", fill: ink)[Reliability and Security]],
  [Production support, root-cause analysis, incident response, monitoring, performance, IAM, OAuth 2.0, SSO],
  [#text(weight: "semibold", fill: ink)[Technical Leadership]],
  [Architecture, design reviews, code quality, mentoring, stakeholder alignment, cross-functional coordination],
)

#section("Professional Experience")

#job(
  "Senior Software Engineer",
  "June 2022 - Present",
  "BAAS Software | Remote",
  (
    [Own configurable web, mobile, backend, and platform products from idea validation and requirements through architecture, implementation, testing, production release, monitoring, and continuous improvement.],
    [Translate ambiguous business needs into delivery roadmaps, business workflows, data models, APIs, system boundaries, and implementation plans while aligning engineering, product, operations, and customers.],
    [Design and build integration-focused services and applications using JavaScript/TypeScript, Go, PostgreSQL, Redis, REST APIs, event-driven patterns, and containerized infrastructure.],
    [Establish engineering standards and repeatable review practices for architecture, implementation, testing, security, release readiness, and long-term maintainability.],
    [Build CI/CD pipelines and release workflows for cloud, containerized, serverless, web, and mobile targets across AWS, Cloudflare, Docker-based platforms, and application stores.],
    [Direct production troubleshooting across user interfaces, services, data, integrations, and infrastructure; maintain 99.9% uptime while reducing release time by 40%.],
    [Implement least-privilege AWS IAM, OAuth 2.0, SSO, 2FA, monitoring, logging, dashboards, and alerting; supported a 100% security-audit compliance rate.],
  ),
)

#pagebreak()

#job(
  "Software Engineer III",
  "June 2020 - July 2022",
  "USAA | Remote",
  (
    [Strengthened enterprise software delivery, reliability, quality engineering, and operational readiness for systems serving USAA members and internal teams.],
    [Automated deployment pipelines and repeatable development workflows, improving release consistency, service stability, and recovery from change-related failures.],
    [Partnered across engineering, security, and operations to investigate end-to-end application and system behavior, remediate vulnerabilities, reduce operational risk, and prevent recurring failures.],
    [Implemented real-time monitoring and alerting, supported complex production incidents, led post-incident reviews, and converted findings into durable reliability improvements.],
    [Served as Vice President of the Quality Engineering Society, advancing automated, integration, regression, and performance-testing practices across engineering teams.],
    [Guided engineers in SRE, testing, troubleshooting, and quality practices while communicating technical risks and solutions to cross-functional stakeholders.],
  ),
)

#job(
  "Software Engineer",
  "July 2018 - May 2020",
  "Web Plant Media | Remote",
  (
    [Built reusable React component libraries, configurable content systems, custom WordPress themes, APIs, and responsive application experiences.],
    [Translated business requirements and user workflows into maintainable technical solutions, coordinating design, development, client review, launch, and ongoing support.],
    [Migrated client platforms to AWS and introduced monitoring, alerting, logging, backup, and disaster-recovery practices that improved availability and issue resolution.],
  ),
)

#job(
  "Software Engineer",
  "February 2017 - July 2018",
  "Caprock Custom Apps",
  (
    [Delivered custom web and mobile applications across front-end interfaces, Node.js and Express services, APIs, integrations, and data workflows.],
    [Worked with clients and cross-functional teams to define requirements, evaluate constraints, shape scope, and carry products through testing, deployment, documentation, launch, and support.],
    [Optimized service architecture and request handling, reducing response times by up to 30% for key application features.],
  ),
)

#job(
  "IT Support Technician / Supervisor",
  "November 2015 - August 2017",
  "Texas Tech University - IT Help Central",
  (
    [Diagnosed complex software, account, network, hardware, and endpoint issues; investigated root causes and coordinated resolution with specialized technology teams.],
    [Promoted to Lead Technician, coordinated daily support operations, led technical projects, and created knowledge resources used by thousands of university users and technicians.],
  ),
)

#section("Education and Leadership")
#grid(columns: (1fr, auto), gutter: 10pt,
  [#text(size: 10.5pt, weight: "bold", fill: ink)[Bachelor of Business Administration]],
  [#text(size: 9.2pt, fill: muted)[Fall 2015 - Spring 2020]],
)
#text(weight: "semibold", fill: accent)[Texas Tech University]
#h(7pt)#text(fill: muted)[Information Technology - Emphasis in Application Development]

#v(7pt)
#grid(columns: (1fr, auto), gutter: 10pt,
  [#text(size: 10.5pt, weight: "bold", fill: ink)[Vice President, Quality Engineering Society]],
  [#text(size: 9.2pt, fill: muted)[November 2020 - July 2022]],
)
#text(weight: "semibold", fill: accent)[USAA]
#h(7pt)#text(fill: muted)[Engineering quality, testing practices, mentorship, and operational excellence]

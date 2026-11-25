#set document(
  title: "Thomas Miller III - Resume",
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
#v(18pt)
#section("Summary")
Platform-focused engineer with more than 10 years of experience building full-stack products and the systems that keep them reliable: cloud infrastructure, CI/CD, observability, identity and access management, scalable architecture, incident response, and technical leadership.
#section("Skills")
#grid(columns: (1fr, 1fr), column-gutter: 26pt, row-gutter: 10pt,
  [#block(breakable: false)[
    #set par(leading: 2.4pt)
    #text(size: 8.8pt, weight: "bold", fill: ink)[Languages]
    #v(1pt)
    #text(size: 8.25pt, fill: body)[HTML, CSS, Sass, Less, JavaScript, TypeScript, Java, Go, Python, C\#]
  ]],
  [#block(breakable: false)[
    #set par(leading: 2.4pt)
    #text(size: 8.8pt, weight: "bold", fill: ink)[Web Development]
    #v(1pt)
    #text(size: 8.25pt, fill: body)[React, Next.js, Tailwind CSS, Bootstrap, Context API, Redux, Zustand, Jest, Vite, Selenium, Storybook]
  ]],
  [#block(breakable: false)[
    #set par(leading: 2.4pt)
    #text(size: 8.8pt, weight: "bold", fill: ink)[API Development]
    #v(1pt)
    #text(size: 8.25pt, fill: body)[Node.js, Express, Fiber, Gin, Django, Spring Boot, GraphQL, Headless CMS]
  ]],
  [#block(breakable: false)[
    #set par(leading: 2.4pt)
    #text(size: 8.8pt, weight: "bold", fill: ink)[App Development]
    #v(1pt)
    #text(size: 8.25pt, fill: body)[Flutter, Ionic, .NET, React Native, Three.js, Unity, Unreal Engine]
  ]],
  [#block(breakable: false)[
    #set par(leading: 2.4pt)
    #text(size: 8.8pt, weight: "bold", fill: ink)[Infrastructure]
    #v(1pt)
    #text(size: 8.25pt, fill: body)[AWS, Docker, Docker Swarm, Kubernetes, Serverless, Terraform, Layer 4 and 7 Networking, HAProxy, NGINX, Load Balancing]
  ]],
  [#block(breakable: false)[
    #set par(leading: 2.4pt)
    #text(size: 8.8pt, weight: "bold", fill: ink)[Security, Authentication, and Authorization]
    #v(1pt)
    #text(size: 8.25pt, fill: body)[IAM, JWT, Session Management, Cookies, CORS, CSRF, RBAC, PBAC, Keycloak, Okta, Active Directory, LDAP]
  ]],
  [#block(breakable: false)[
    #set par(leading: 2.4pt)
    #text(size: 8.8pt, weight: "bold", fill: ink)[DevOps]
    #v(1pt)
    #text(size: 8.25pt, fill: body)[CI/CD, GitOps, Git, GitHub, GitLab, ECR, Artifactory, Docker Hub, GitHub Actions, GitLab CI/CD, Jenkins, CircleCI, Fleet, Helm, Prometheus, Grafana, ELK, Datadog, Splunk]
  ]],
  [#block(breakable: false)[
    #set par(leading: 2.4pt)
    #text(size: 8.8pt, weight: "bold", fill: ink)[Site Reliability Engineering]
    #v(1pt)
    #text(size: 8.25pt, fill: body)[High Availability, Latency Optimization, Auto Scaling, Monitoring, Incident Response, Post-Incident Review]
  ]],
  [#block(breakable: false)[
    #set par(leading: 2.4pt)
    #text(size: 8.8pt, weight: "bold", fill: ink)[Testing]
    #v(1pt)
    #text(size: 8.25pt, fill: body)[Unit Testing, Integration Testing, End-to-End Testing, Performance Testing, Security Testing]
  ]],
  [#block(breakable: false)[
    #set par(leading: 2.4pt)
    #text(size: 8.8pt, weight: "bold", fill: ink)[Data and Databases]
    #v(1pt)
    #text(size: 8.25pt, fill: body)[Data Modeling, Normalization, ER Diagrams, Data Integrity, PostgreSQL, MySQL, MongoDB, DynamoDB, Cassandra, Redis, RabbitMQ, Kafka]
  ]],
  [#block(breakable: false)[
    #set par(leading: 2.4pt)
    #text(size: 8.8pt, weight: "bold", fill: ink)[Software Architecture]
    #v(1pt)
    #text(size: 8.25pt, fill: body)[Monoliths, Microservices, Domain-Driven Design, Test-Driven Development, Event-Driven Architecture, System Design]
  ]],
  [#block(breakable: false)[
    #set par(leading: 2.4pt)
    #text(size: 8.8pt, weight: "bold", fill: ink)[Technical Documentation]
    #v(1pt)
    #text(size: 8.25pt, fill: body)[API Documentation, Code Documentation, Architecture, Requirements, System Design, Deployment, User Manuals, Swagger, Postman, UML, Lucidchart, Docusaurus]
  ]],
  [#block(breakable: false)[
    #set par(leading: 2.4pt)
    #text(size: 8.8pt, weight: "bold", fill: ink)[Project Management]
    #v(1pt)
    #text(size: 8.25pt, fill: body)[Agile, Scrum, Cross-Functional Collaboration, Mentoring]
  ]],
)
#v(16pt)
#grid(columns: (1fr, 1fr), gutter: 22pt,
  [#text(size: 8.1pt, weight: "bold", fill: accent)[EDUCATION]
   #v(3pt)
   #text(size: 9.6pt, weight: "bold", fill: ink)[Bachelor of Business Administration (BBA)]
   #v(1.5pt)
   #text(size: 8.7pt, fill: body)[Texas Tech University | Information Technology - Emphasis in Application Development]
   #v(1.5pt)
   #text(size: 8.4pt, fill: muted)[Fall 2015 - Spring 2020]],
  [#text(size: 8.1pt, weight: "bold", fill: accent)[ACCOLADE]
   #v(3pt)
   #text(size: 9.6pt, weight: "bold", fill: ink)[Vice President]
   #v(1.5pt)
   #text(size: 8.7pt, fill: body)[Quality Engineering Society, USAA]
   #v(1.5pt)
   #text(size: 8.4pt, fill: muted)[March 2021 - July 2022]],
)
#pagebreak()
#set page(header: none, margin: (top: 0.45in, bottom: 0.3in, left: 0.67in, right: 0.67in))
#set text(size: 9.5pt)
#set list(spacing: 3pt)
#text(size: 20pt, weight: "bold", fill: ink)[EXPERIENCE]
#v(8pt)
#text(size: 8.2pt, weight: "bold", fill: accent)[SELECTED ROLES / 01-03]
#v(8pt)
#block(breakable: false)[
#grid(columns: (3pt, 1fr), column-gutter: 10pt, align: top,
  [#rect(width: 3pt, height: 29pt, fill: accent)],
  [#grid(columns: (1fr, auto), gutter: 8pt, align: top,
    [#text(size: 12pt, weight: "bold", fill: ink)[Senior Software Engineer]
     #v(2pt)
     #text(size: 8.8pt, weight: "bold", fill: accent)[BAAS Software | Remote]],
    [#text(size: 8.5pt, fill: muted)[June 2022 - Present]],
  )],
)
#v(4pt)
#pad(left: 13pt)[
#block(width: 100%)[#set par(leading: 2.6pt); #text(size: 9.1pt, fill: ink)[Led a team of 8-12 developers and managed software projects from client requirements and planning through architecture, development, deployment, and monitoring.]]
#v(4pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Led products from concept and client discovery through architecture, full-stack implementation, launch, monitoring, and ongoing support.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Built customer-facing web and mobile applications, APIs, automation systems, and internal platforms across cloud and containerized environments.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Created GitHub Actions release pipelines for AWS, Cloudflare, Docker, web, and mobile targets; reduced release time by 40% while helping maintain 99.9% uptime.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Established production monitoring, alerting, and incident workflows with Prometheus, Grafana, and Kibana, carrying corrective work through deployment.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Strengthened platform security with least-privilege AWS IAM policies, access-risk remediation, and OAuth 2.0, SSO, 2FA, and secure session flows.]]],
)
#v(4pt)
#block(width: 100%)[#set par(leading: 2.2pt); #text(size: 8pt, weight: "bold", fill: accent)[Skills & technologies] #text(size: 8pt, fill: body)[Technical leadership  |  Full-stack architecture  |  AWS  |  Docker  |  CI/CD  |  Observability]]
]
]
#v(10pt)
#block(breakable: false)[
#grid(columns: (3pt, 1fr), column-gutter: 10pt, align: top,
  [#rect(width: 3pt, height: 29pt, fill: accent)],
  [#grid(columns: (1fr, auto), gutter: 8pt, align: top,
    [#text(size: 12pt, weight: "bold", fill: ink)[Software Engineer III]
     #v(2pt)
     #text(size: 8.8pt, weight: "bold", fill: accent)[USAA | Remote]],
    [#text(size: 8.5pt, fill: muted)[June 2020 - July 2022]],
  )],
)
#v(4pt)
#pad(left: 13pt)[
#block(width: 100%)[#set par(leading: 2.6pt); #text(size: 9.1pt, fill: ink)[Strengthened enterprise reliability, delivery automation, quality engineering, and incident response.]]
#v(4pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Automated deployment and development workflows to improve release consistency, service stability, and recovery from failed changes.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Implemented real-time monitoring and alerting, supported production incidents, and turned post-incident findings into reliability improvements.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Advanced automated integration, regression, and performance testing across teams as Vice President of the Quality Engineering Society.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Mentored engineers in site reliability, troubleshooting, and quality practices while contributing to resilient service designs.]]],
)
#v(4pt)
#block(width: 100%)[#set par(leading: 2.2pt); #text(size: 8pt, weight: "bold", fill: accent)[Skills & technologies] #text(size: 8pt, fill: body)[Site reliability  |  CI/CD  |  Monitoring and alerting  |  Automated testing  |  Incident response  |  Mentorship]]
]
]
#v(10pt)
#block(breakable: false)[
#grid(columns: (3pt, 1fr), column-gutter: 10pt, align: top,
  [#rect(width: 3pt, height: 29pt, fill: accent)],
  [#grid(columns: (1fr, auto), gutter: 8pt, align: top,
    [#text(size: 12pt, weight: "bold", fill: ink)[Software Engineer]
     #v(2pt)
     #text(size: 8.8pt, weight: "bold", fill: accent)[Web Plant Media | Remote]],
    [#text(size: 8.5pt, fill: muted)[July 2018 - May 2020]],
  )],
)
#v(4pt)
#pad(left: 13pt)[
#block(width: 100%)[#set par(leading: 2.6pt); #text(size: 9.1pt, fill: ink)[Built custom WordPress and React experiences while modernizing client platforms, cloud infrastructure, and delivery practices.]]
#v(4pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Built reusable React components and custom WordPress themes that standardized responsive navigation, content, forms, and interactive experiences.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Led client UI/UX work from requirements and user flows through design, accessible implementation, and iterative delivery.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Migrated client websites to AWS to improve performance, availability, security, and hosting efficiency.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Added monitoring, alerting, logging, backups, and disaster-recovery procedures to reduce operational risk and speed restoration.]]],
)
#v(4pt)
#block(width: 100%)[#set par(leading: 2.2pt); #text(size: 8pt, weight: "bold", fill: accent)[Skills & technologies] #text(size: 8pt, fill: body)[React  |  WordPress  |  AWS  |  UI/UX design  |  Accessibility  |  Monitoring and alerting]]
]
]
#pagebreak()
#text(size: 20pt, weight: "bold", fill: ink)[EXPERIENCE]
#v(8pt)
#text(size: 8.2pt, weight: "bold", fill: accent)[EARLIER ROLES / 04-05]
#v(8pt)
#block(breakable: false)[
#grid(columns: (3pt, 1fr), column-gutter: 10pt, align: top,
  [#rect(width: 3pt, height: 29pt, fill: accent)],
  [#grid(columns: (1fr, auto), gutter: 8pt, align: top,
    [#text(size: 12pt, weight: "bold", fill: ink)[Software Engineer]
     #v(2pt)
     #text(size: 8.8pt, weight: "bold", fill: accent)[Caprock Custom Apps]],
    [#text(size: 8.5pt, fill: muted)[February 2017 - July 2018]],
  )],
)
#v(4pt)
#pad(left: 13pt)[
#block(width: 100%)[#set par(leading: 2.6pt); #text(size: 9.1pt, fill: ink)[Delivered custom web and mobile products from discovery and architecture through app-store release and support.]]
#v(4pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Defined product scope and technical plans directly with clients and cross-functional teams, then delivered web and mobile applications through launch.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Built front-end experiences, Node.js and Express services, APIs, integrations, and data workflows for custom products.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Improved service architecture and request handling, reducing response times by up to 30% for key features.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Released multiple applications through mobile app stores and managed updates and post-launch support.]]],
)
#v(4pt)
#block(width: 100%)[#set par(leading: 2.2pt); #text(size: 8pt, weight: "bold", fill: accent)[Skills & technologies] #text(size: 8pt, fill: body)[Node.js  |  Express  |  API development  |  Mobile development  |  Application architecture  |  Client discovery]]
]
]
#v(32pt)
#block(breakable: false)[
#grid(columns: (3pt, 1fr), column-gutter: 10pt, align: top,
  [#rect(width: 3pt, height: 29pt, fill: accent)],
  [#grid(columns: (1fr, auto), gutter: 8pt, align: top,
    [#text(size: 12pt, weight: "bold", fill: ink)[IT Support Technician / Supervisor]
     #v(2pt)
     #text(size: 8.8pt, weight: "bold", fill: accent)[IT Help Central]],
    [#text(size: 8.5pt, fill: muted)[November 2015 - August 2017]],
  )],
)
#v(4pt)
#pad(left: 13pt)[
#block(width: 100%)[#set par(leading: 2.6pt); #text(size: 9.1pt, fill: ink)[Resolved complex technology issues, led support operations, and created knowledge resources for a large university community.]]
#v(4pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Earned promotion to Lead Technician, coordinated daily support operations, and led technical projects for a large university community.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Resolved software, hardware, account, network, and endpoint issues for students, faculty, and staff across walk-up, phone, and on-site channels.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Created searchable troubleshooting documentation used by thousands of Texas Tech University users and support technicians.]]],
)
#v(1.5pt)
#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,
  [#text(size: 8.5pt, fill: accent)[-]],
  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[Investigated root causes, coordinated escalations with specialized IT teams, and communicated solutions clearly to people with varied technical experience.]]],
)
#v(4pt)
#block(width: 100%)[#set par(leading: 2.2pt); #text(size: 8pt, weight: "bold", fill: accent)[Skills & technologies] #text(size: 8pt, fill: body)[Technical support  |  Networking  |  Troubleshooting  |  Knowledge management  |  Team supervision]]
]
]

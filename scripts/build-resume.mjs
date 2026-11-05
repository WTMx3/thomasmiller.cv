import fs from "node:fs";
import path from "node:path";

const root = process.cwd();

function parseValue(rawValue) {
  const value = rawValue.trim();
  if (value.startsWith("[") && value.endsWith("]")) {
    try {
      return JSON.parse(value);
    } catch {
      return value;
    }
  }
  if (value === "true") return true;
  if (value === "false") return false;
  if (/^-?\d+(\.\d+)?$/.test(value)) return Number(value);
  return value.replace(/^['"](.*)['"]$/, "$1");
}

function parseFrontmatter(fileContent) {
  const match = /^---\s*\r?\n([\s\S]*?)\r?\n---/.exec(fileContent);
  if (!match) return { metadata: {}, content: fileContent.trim() };

  const metadata = {};
  for (const line of match[1].split(/\r?\n/)) {
    if (!line.trim() || line.trimStart().startsWith("#")) continue;
    const separator = line.indexOf(":");
    if (separator === -1) continue;
    metadata[line.slice(0, separator).trim()] = parseValue(line.slice(separator + 1));
  }

  return {
    metadata,
    content: fileContent.replace(/^---\s*\r?\n([\s\S]*?)\r?\n---/, "").trim(),
  };
}

function collection(name) {
  const directory = path.join(root, "content", name);
  if (!fs.existsSync(directory)) return [];

  return fs
    .readdirSync(directory)
    .filter((file) => path.extname(file) === ".mdx")
    .map((file) => ({
      slug: path.basename(file, ".mdx"),
      ...parseFrontmatter(fs.readFileSync(path.join(directory, file), "utf8")),
    }))
    .filter((entry) => entry.metadata.draft !== true)
    .sort((a, b) => Number(a.metadata.order ?? 999) - Number(b.metadata.order ?? 999));
}

function typstText(input) {
  const replacements = new Map([
    ["\\", "\\\\"],
    ["#", "\\#"],
    ["$", "\\$"],
    ["@", "\\@"],
    ["[", "\\["],
    ["]", "\\]"],
    ["*", "\\*"],
    ["·", " | "],
  ]);
  return Array.from(String(input ?? ""), (character) => replacements.get(character) ?? character).join("");
}

function bulletList(markdown) {
  const items = markdown
    .split(/\r?\n/)
    .filter((line) => line.trimStart().startsWith("- "))
    .map((line) =>
      typstText(
        line
          .trim()
          .slice(2)
          .replace(/^\*\*.+?:\*\*\s*/, ""),
      ),
    );

  if (!items.length) return [];

  return ["#block(width: 100%, above: 6pt)[", "#list(", ...items.map((item) => "  [" + item + "],"), ")", "]"];
}

function sectionText(markdown, heading) {
  const escapedHeading = heading.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  const match = new RegExp(`## ${escapedHeading}\\s*\\r?\\n([\\s\\S]*?)(?=\\r?\\n## |$)`).exec(markdown);
  if (!match) return "";
  return match[1]
    .split(/\r?\n\r?\n/)[0]
    .replace(/^[-*]\s+/gm, "")
    .trim();
}

const profile = collection("profile")[0];
const experience = collection("experience");
const education = collection("education");
const skills = collection("skills");
const projects = collection("projects");
const leadership = collection("leadership");

if (!profile) throw new Error("A profile MDX file is required.");

const resumeDate = new Intl.DateTimeFormat("en-US", {
  day: "numeric",
  month: "long",
  year: "numeric",
}).format(new Date());
const latestRole = experience[0];
const coverParagraphs = [
  "I am a senior software engineer who turns ambiguous product needs into dependable systems. My work spans product and platform engineering: customer-facing applications, APIs, cloud infrastructure, delivery automation, observability, and the operating practices that keep software healthy after launch.",
  latestRole
    ? "At " +
      latestRole.metadata.company +
      ", I " +
      String(latestRole.metadata.summary)
        .replace(/^Own\b/, "own")
        .replace(/\.$/, "") +
      ". I lead work from early planning and architecture through implementation, release, monitoring, support, and continuous improvement."
    : "",
  "Earlier roles strengthened my experience in enterprise reliability, incident response, quality engineering, accessible interfaces, and client-focused delivery. I am most valuable where a team needs both breadth and follow-through: someone who can shape the architecture, write the software, improve the path to production, and remain accountable for the result in operation.",
  "I would welcome the opportunity to discuss how that combination could support your products, engineering organization, and customers. Thank you for your consideration.",
].filter(Boolean);

const lines = [
  "#set document(",
  '  title: "' + typstText(profile.metadata.name) + ' - Portfolio Resume",',
  '  author: ("' + typstText(profile.metadata.name) + '",),',
  '  description: "' + typstText(profile.content) + '",',
  ")",
  "#set page(",
  '  paper: "us-letter",',
  "  margin: (top: 0.62in, bottom: 0.62in, left: 0.72in, right: 0.72in),",
  '  numbering: "1",',
  "  number-align: right,",
  ")",
  '#let ink = rgb("#18191b")',
  '#let body = rgb("#42454a")',
  '#let muted = rgb("#70747a")',
  '#let rule = rgb("#d7d7d4")',
  '#let accent = rgb("#2d2f32")',
  '#set text(font: ("Segoe UI", "Arial"), size: 10pt, fill: body)',
  "#set par(leading: 1em)",
  "#set list(indent: 12pt, body-indent: 6pt, spacing: 6pt, tight: false)",
  "#show link: set text(fill: accent)",
  "#let section(title) = {",
  "  v(11pt)",
  "  grid(columns: (auto, 1fr), gutter: 9pt, align: horizon,",
  '    text(size: 11.4pt, weight: "bold", fill: ink, tracking: 0.55pt, upper(title)),',
  "    line(length: 100%, stroke: 0.55pt + rule),",
  "  )",
  "  v(6.5pt)",
  "}",
  "#grid(columns: (1fr, auto), gutter: 20pt, align: top,",
  '  [#text(size: 14pt, weight: "bold", fill: ink)[' + typstText(profile.metadata.name) + "]",
  "   #v(2pt)",
  "   #text(size: 9.8pt, fill: muted)[" + typstText(profile.metadata.role) + "]],",
  "  [#align(right)[#text(size: 9.2pt)[",
  '    #link("mailto:' + typstText(profile.metadata.email) + '")[' + typstText(profile.metadata.email) + "] \\",
  '    #link("tel:' + typstText(profile.metadata.phoneHref) + '")[' + typstText(profile.metadata.phone) + "] \\",
  '    #link("' + typstText(profile.metadata.website) + '")[' + typstText(profile.metadata.websiteLabel) + "]",
  "  ]]],",
  ")",
  "#v(40pt)",
  "#grid(columns: (1fr, auto), gutter: 18pt, align: bottom,",
  '  [#text(size: 22pt, weight: "bold", fill: ink)[Cover letter]],',
  "  [#text(size: 9.6pt, fill: muted)[" + typstText(resumeDate) + "]],",
  ")",
  "#v(9pt)",
  "#line(length: 100%, stroke: 0.8pt + accent)",
  "#v(28pt)",
  '#text(size: 11pt, weight: "semibold", fill: ink)[Dear Hiring Team,]',
  ...coverParagraphs.flatMap((paragraph) => [
    "#v(14pt)",
    "#block(width: 100%)[#set text(size: 10.5pt); #set par(leading: 1.15em); " + typstText(paragraph) + "]",
  ]),
  "#v(18pt)",
  "#text(size: 10.5pt)[Sincerely,]",
  "#v(6pt)",
  '#text(size: 11pt, weight: "semibold", fill: ink)[' + typstText(profile.metadata.name) + "]",
  "#pagebreak()",
  "#grid(columns: (1fr, auto), gutter: 20pt, align: top,",
  '  [#text(size: 26.5pt, weight: "bold", fill: ink)[' + typstText(profile.metadata.name) + "]",
  "   #v(2.5pt)",
  '   #text(size: 11.6pt, weight: "semibold", fill: accent)[' + typstText(profile.metadata.role) + "]",
  "   #v(2.5pt)",
  "   #text(size: 9.4pt, fill: muted)[" + typstText(profile.metadata.tagline) + "]],",
  "  [#align(right)[#text(size: 9.4pt)[",
  '    #link("mailto:' + typstText(profile.metadata.email) + '")[' + typstText(profile.metadata.email) + "] \\",
  '    #link("tel:' + typstText(profile.metadata.phoneHref) + '")[' + typstText(profile.metadata.phone) + "] \\",
  '    #link("' + typstText(profile.metadata.website) + '")[' + typstText(profile.metadata.websiteLabel) + "]",
  "  ]]],",
  ")",
  "#v(7pt)",
  "#line(length: 100%, stroke: 0.9pt + accent)",
  '#section("Summary")',
  typstText(profile.content),
  '#section("Skills")',
  "#grid(columns: (1fr, 1fr), column-gutter: 18pt, row-gutter: 7pt,",
];

for (const group of skills) {
  lines.push(
    "  [#block(breakable: false)[",
    "    #set par(leading: 0.72em)",
    '    #text(size: 9pt, weight: "bold", fill: ink)[' + typstText(group.metadata.category) + "]",
    "    #v(2pt)",
    "    #text(size: 8.55pt, fill: body)[" + group.metadata.items.map(typstText).join(", ") + "]",
    "  ]],",
  );
}

lines.push(")");

const educationEntry = education[0];
const leadershipEntry = leadership[0];

if (educationEntry || leadershipEntry) {
  lines.push(
    "#v(11pt)",
    "#line(length: 100%, stroke: 0.55pt + rule)",
    "#v(8pt)",
    "#grid(columns: (1fr, 1fr), gutter: 22pt,",
  );
  if (educationEntry) {
    lines.push(
      '  [#text(size: 8.1pt, weight: "semibold", fill: muted, tracking: 0.75pt)[EDUCATION]',
      "   #v(3pt)",
      '   #text(size: 9.6pt, weight: "bold", fill: ink)[' + typstText(educationEntry.metadata.degree) + "]",
      "   #v(1.5pt)",
      "   #text(size: 8.7pt, fill: body)[" +
        typstText(educationEntry.metadata.institution) +
        " | " +
        typstText(educationEntry.metadata.field) +
        "]",
      "   #v(1.5pt)",
      "   #text(size: 8.4pt, fill: muted)[" +
        typstText(educationEntry.metadata.startDate) +
        " - " +
        typstText(educationEntry.metadata.endDate) +
        "]],",
    );
  } else {
    lines.push("  [],");
  }
  if (leadershipEntry) {
    lines.push(
      '  [#text(size: 8.1pt, weight: "semibold", fill: muted, tracking: 0.75pt)[ACCOLADE]',
      "   #v(3pt)",
      '   #text(size: 9.6pt, weight: "bold", fill: ink)[' + typstText(leadershipEntry.metadata.role) + "]",
      "   #v(1.5pt)",
      "   #text(size: 8.7pt, fill: body)[" + typstText(leadershipEntry.metadata.organization) + "]",
      "   #v(1.5pt)",
      "   #text(size: 8.4pt, fill: muted)[" +
        typstText(leadershipEntry.metadata.startDate) +
        " - " +
        typstText(leadershipEntry.metadata.endDate) +
        "]],",
    );
  } else {
    lines.push("  [],");
  }
  lines.push(")");
}

lines.push(
  "#pagebreak()",
  '#set page(header: align(right)[#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.7pt)[THOMAS MILLER | EXPERIENCE]])',
  "#set text(size: 10pt)",
  "#set list(spacing: 4.8pt)",
  '#section("Employment History")',
);

for (const job of experience) {
  const jobBulletLines = job.content.split(/\r?\n/).filter((line) => line.trimStart().startsWith("- "));
  const splitsAcrossPages = job.slug === "web-plant-media";
  const firstPageContent = splitsAcrossPages ? jobBulletLines.slice(0, 1).join("\n") : job.content;

  lines.push(
    "#block(above: 8pt, below: 16pt, breakable: true)[",
    "#grid(columns: (1fr, auto), gutter: 8pt,",
    '  [#text(size: 11.8pt, weight: "bold", fill: ink)[' + typstText(job.metadata.role) + "]],",
    "  [#text(size: 9.5pt, fill: muted)[" +
      typstText(job.metadata.startDate) +
      " - " +
      typstText(job.metadata.endDate) +
      "]],",
    ")",
    "",
    '#block(width: 100%, above: 4pt)[#text(size: 9.9pt, weight: "semibold", fill: accent)[' +
      typstText(job.metadata.company) +
      (job.metadata.location ? " | " + typstText(job.metadata.location) : "") +
      "]]",
    "",
    "#block(width: 100%, above: 5pt, below: 3pt)[#text(size: 9.9pt, fill: body)[" +
      typstText(job.metadata.summary) +
      "]]",
    "",
    ...bulletList(firstPageContent),
    "]",
  );

  if (splitsAcrossPages) {
    lines.push(
      "#pagebreak()",
      "#block(above: 4pt, below: 16pt, breakable: true)[",
      "#grid(columns: (1fr, auto), gutter: 8pt,",
      '  [#text(size: 11.2pt, weight: "bold", fill: ink)[' + typstText(job.metadata.role) + " (continued)]],",
      "  [#text(size: 9.5pt, fill: muted)[" +
        typstText(job.metadata.startDate) +
        " - " +
        typstText(job.metadata.endDate) +
        "]],",
      ")",
      '#block(width: 100%, above: 4pt)[#text(size: 9.9pt, weight: "semibold", fill: accent)[' +
        typstText(job.metadata.company) +
        (job.metadata.location ? " | " + typstText(job.metadata.location) : "") +
        "]]",
      ...bulletList(jobBulletLines.slice(1).join("\n")),
      "]",
    );
  }
}

for (const [index, project] of projects.entries()) {
  const engineeringFocus = sectionText(project.content, "Engineering focus");
  const coverImage = String(project.metadata.coverImage ?? "").replace(/^\//, "");
  const portfolioLabel = `PORTFOLIO ${String(index + 1).padStart(2, "0")} / ${String(projects.length).padStart(2, "0")}`;

  lines.push(
    "#pagebreak()",
    '#set page(header: align(right)[#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.7pt)[' +
      portfolioLabel +
      "]])",
    "#set text(size: 9.2pt)",
    "#set list(spacing: 4.2pt)",
    "#grid(columns: (1fr, auto), gutter: 14pt, align: bottom,",
    '  [#text(size: 22pt, weight: "bold", fill: ink)[' + typstText(project.metadata.title) + "]],",
    '  [#text(size: 8.8pt, weight: "semibold", fill: muted)[' + typstText(project.metadata.status) + "]],",
    ")",
    "#v(4pt)",
    '#text(size: 9.2pt, weight: "semibold", fill: accent)[' +
      typstText(project.metadata.role) +
      " | " +
      typstText(project.metadata.startedAt) +
      "]",
    "#v(8pt)",
    "#line(length: 100%, stroke: 0.7pt + accent)",
    "#v(12pt)",
  );

  if (coverImage) {
    lines.push(
      '#block(width: 100%, height: 124pt, clip: true, radius: 5pt, fill: rgb("#f1f2f3"))[',
      '  #image("../public/' +
        typstText(coverImage) +
        '", width: 100%, height: 124pt, fit: "cover", alt: "' +
        typstText(project.metadata.title) +
        ' product interface")',
      "]",
      "#v(12pt)",
    );
  }

  lines.push(
    "#grid(columns: (1.58fr, 1fr), gutter: 22pt, align: top,",
    '  [#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[OVERVIEW]',
    "   #v(4pt)",
    "   #text(size: 9.15pt, fill: body)[" + typstText(project.metadata.summary) + "]",
    "   #v(11pt)",
    '   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[WHAT I BUILT]',
    "   #set text(size: 8.65pt)",
    "   #set list(spacing: 3.8pt)",
    ...bulletList(project.content).map((line) => "   " + line),
    "  ],",
    '  [#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[TECHNOLOGIES]',
    "   #v(4pt)",
    "   #text(size: 8.75pt, fill: body)[" + project.metadata.technologies.map(typstText).join(", ") + "]",
    "   #v(14pt)",
    '   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[ENGINEERING FOCUS]',
    "   #v(4pt)",
    "   #text(size: 8.75pt, fill: body)[" + typstText(engineeringFocus) + "]",
    "   #v(14pt)",
    '   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[SOURCE]',
    "   #v(4pt)",
    '   #link("' +
      typstText(project.metadata.repositoryUrl) +
      '")[#text(size: 8.6pt, fill: accent)[View the sanitized repository]]',
    "  ],",
    ")",
  );

  const galleryImages = Array.isArray(project.metadata.galleryImages) ? project.metadata.galleryImages.slice(0, 3) : [];
  const galleryCaptions = Array.isArray(project.metadata.galleryCaptions) ? project.metadata.galleryCaptions : [];

  if (galleryImages.length) {
    lines.push(
      "#v(14pt)",
      '#text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[PRODUCT VIEWS]',
      "#v(5pt)",
      "#grid(columns: (" + galleryImages.map(() => "1fr").join(", ") + "), gutter: 8pt,",
    );

    galleryImages.forEach((imagePath, galleryIndex) => {
      const normalizedPath = String(imagePath).replace(/^\//, "");
      const alt = galleryCaptions[galleryIndex] ?? `${project.metadata.title} product view ${galleryIndex + 1}`;
      lines.push(
        '  [#block(width: 100%, height: 54pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[',
        '    #image("../public/' +
          typstText(normalizedPath) +
          '", width: 100%, height: 54pt, fit: "cover", alt: "' +
          typstText(alt) +
          '")',
        "  ]],",
      );
    });

    lines.push(")");
  }
}

const outputDirectory = path.join(root, "resume");
fs.mkdirSync(outputDirectory, { recursive: true });
fs.mkdirSync(path.join(root, "output", "pdf"), { recursive: true });
const outputPath = path.join(outputDirectory, "thomas-miller-master.typ");
fs.writeFileSync(outputPath, lines.join("\n") + "\n", "utf8");
console.log(outputPath);

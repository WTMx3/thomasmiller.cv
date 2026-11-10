import fs from "node:fs";
import path from "node:path";
import YAML from "yaml";

const root = process.cwd();
const resumeConfig = YAML.parse(fs.readFileSync(path.join(root, "content", "resume.yaml"), "utf8"));

function collection(name) {
  const entries = resumeConfig?.[name];
  if (!Array.isArray(entries)) throw new Error(`Missing ${name} entries in content/resume.yaml`);
  return entries
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

function bulletList(markdown, spacing = "5pt") {
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

  return ["#block(width: 100%, above: 6pt)[", `#list(spacing: ${spacing},`, ...items.map((item) => "  [" + item + "],"), ")", "]"];
}

function accomplishmentList(markdown) {
  const items = markdown
    .split(/\r?\n/)
    .filter((line) => line.trimStart().startsWith("- "))
    .map((line) => typstText(line.trim().slice(2).replace(/^\*\*.+?:\*\*\s*/, "")));

  return items.flatMap((item, index) => [
    "#grid(columns: (8pt, 1fr), column-gutter: 6pt, align: top,",
    '  [#text(size: 8.5pt, fill: accent)[•]],',
    '  [#block[#set par(leading: 0.62em); #text(size: 9pt, fill: body)[' + item + "]]],",
    ")",
    ...(index < items.length - 1 ? ["#v(2.5pt)"] : []),
  ]);
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

const coverLetter = resumeConfig?.coverLetter;
if (!coverLetter || !Array.isArray(coverLetter.paragraphs) || !coverLetter.paragraphs.length) {
  throw new Error("content/resume.yaml must contain coverLetter.paragraphs");
}
const coverParagraphs = coverLetter.paragraphs;

const lines = [
  "#set document(",
  '  title: "WTM3 Resume",',
  '  author: ("' + typstText(profile.metadata.name) + '",),',
  '  description: "' + typstText(profile.content) + '",',
  ")",
  "#set page(",
  '  paper: "us-letter",',
  "  margin: (top: 0.56in, bottom: 0.56in, left: 0.64in, right: 0.64in),",
  '  numbering: "1",',
  "  number-align: right,",
  ")",
  '#let ink = rgb("#18191b")',
  '#let body = rgb("#42454a")',
  '#let muted = rgb("#70747a")',
  '#let accent = rgb("#2d2f32")',
  '#set text(font: "Roboto", size: 9.6pt, fill: body)',
  "#set par(leading: 0.72em)",
  "#set list(indent: 12pt, body-indent: 6pt, spacing: 6pt, tight: false)",
  "#show link: set text(fill: accent)",
  "#let section(title) = {",
  "  v(11pt)",
  '  text(size: 11.4pt, weight: "bold", fill: ink, tracking: 0.55pt, upper(title))',
  "  v(6.5pt)",
  "}",
  "#grid(columns: (1fr, auto), gutter: 18pt, align: top,",
  '  [#text(size: 17pt, weight: "bold", fill: ink)[' + typstText(profile.metadata.name) + "]],",
  "  [#align(right)[#text(size: 8.5pt)[",
  '    #link("mailto:' + profile.metadata.email + '")[' + typstText(profile.metadata.email) + "] |",
  '    #link("tel:' + typstText(profile.metadata.phoneHref) + '")[' + typstText(profile.metadata.phone) + "] \\",
  '    #link("' + typstText(profile.metadata.website) + '")[' + typstText(profile.metadata.websiteLabel) + "] |",
  '    #link("' + typstText(profile.metadata.github) + '")[github.com/WTMx3]  |  #link("' + typstText(profile.metadata.linkedin) + '")[linkedin.com/in/wtmx3]',
  "  ]]],",
  ")",
  "#v(54pt)",
  '#text(size: 11pt, weight: "semibold", fill: ink)[' + typstText(coverLetter.salutation) + "]",
  ...coverParagraphs.flatMap((paragraph) => [
    "#v(14pt)",
    "#block(width: 100%)[#set text(size: 10.5pt); #set par(leading: 1.15em); " + typstText(paragraph) + "]",
  ]),
  "#v(18pt)",
  "#text(size: 10.5pt)[" + typstText(coverLetter.closing) + "]",
  "#v(6pt)",
  '#text(size: 11pt, weight: "semibold", fill: ink)[' + typstText(profile.metadata.name) + "]",
  "#pagebreak()",
  "#grid(columns: (1fr, auto), gutter: 18pt, align: top,",
  '  [#text(size: 26pt, weight: "bold", fill: ink)[' + typstText(profile.metadata.name) + "]],",
  "  [#align(right)[#text(size: 8.5pt)[",
  '    #link("mailto:' + profile.metadata.email + '")[' + typstText(profile.metadata.email) + "] |",
  '    #link("tel:' + typstText(profile.metadata.phoneHref) + '")[' + typstText(profile.metadata.phone) + "] \\",
  '    #link("' + typstText(profile.metadata.website) + '")[' + typstText(profile.metadata.websiteLabel) + "] |",
  '    #link("' + typstText(profile.metadata.github) + '")[github.com/WTMx3]  |  #link("' + typstText(profile.metadata.linkedin) + '")[linkedin.com/in/wtmx3]',
  "  ]]],",
  ")",
  "#v(14pt)",
  '#section("Summary")',
  typstText(profile.content),
  '#section("Skills")',
  "#grid(columns: (1fr, 1fr), column-gutter: 18pt, row-gutter: 13pt,",
];

for (const group of skills) {
  lines.push(
    "  [#block(breakable: false)[",
    "    #set par(leading: 1.05em)",
    '    #text(size: 9pt, weight: "bold", fill: ink)[' + typstText(group.metadata.category) + "]",
    "    #v(0.5pt)",
    "    #text(size: 8.4pt, fill: body)[" + group.metadata.items.map(typstText).join(", ") + "]",
    "  ]],",
  );
}

lines.push(")");

const educationEntry = education[0];
const leadershipEntry = leadership[0];

if (educationEntry || leadershipEntry) {
  lines.push(
    "#v(18pt)",
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
  "#set page(header: none)",
  "#set text(size: 9.6pt)",
  "#set list(spacing: 3pt)",
  '#section("Employment History")',
);

for (const [index, job] of experience.entries()) {
  if (index === 2) lines.push("#pagebreak()", '#section("Employment History (continued)")');
  lines.push(
    "#block(above: 5pt, below: 8pt, breakable: false)[",
    "#grid(columns: (1fr, auto), gutter: 12pt, align: top,",
    '  [#text(size: 12.2pt, weight: "bold", fill: ink)[' + typstText(job.metadata.role) + "]",
    "   #v(1.5pt)",
    '   #text(size: 9.4pt, weight: "semibold", fill: accent)[' +
      typstText(job.metadata.company) +
      (job.metadata.location ? " | " + typstText(job.metadata.location) : "") +
      "]],",
    "  [#text(size: 8.9pt, fill: muted)[" +
      typstText(job.metadata.startDate) +
      " - " +
      typstText(job.metadata.endDate) +
      "]],",
    ")",
    "#v(5pt)",
    '#text(size: 7.6pt, weight: "semibold", fill: muted, tracking: 0.6pt)[POSITION SUMMARY]',
    "#v(2pt)",
    "#text(size: 9.2pt, fill: body)[" + typstText(job.metadata.summary) + "]",
    "#v(5pt)",
    '#text(size: 7.6pt, weight: "semibold", fill: muted, tracking: 0.6pt)[SELECTED ACCOMPLISHMENTS]',
    "#v(3pt)",
    ...accomplishmentList(job.content),
    "]",
  );
}

for (const [projectIndex, project] of projects.entries()) {
  const engineeringFocus = sectionText(project.content, "Engineering focus");
  const coverImage = String(project.metadata.coverImage ?? "").replace(/^\//, "");
  const galleryImages = Array.isArray(project.metadata.galleryImages) ? project.metadata.galleryImages : [];
  const galleryCaptions = Array.isArray(project.metadata.galleryCaptions) ? project.metadata.galleryCaptions : [];
  if (galleryImages.length !== galleryCaptions.length) {
    throw new Error(`${project.metadata.title}: galleryImages and galleryCaptions must have the same length`);
  }

  lines.push(
    ...(projectIndex === 0 ? ["#pagebreak()"] : []),
    '#set page(width: 8.5in, height: 11in, margin: (top: 0.56in, bottom: 0.56in, left: 0.64in, right: 0.64in), header: none)',
    "#set text(size: 9.2pt)",
    "#set list(spacing: 4.2pt)",
    '#text(size: 20pt, weight: "bold", fill: ink)[' + typstText(project.metadata.title) + "]",
    "#v(20pt)",
  );

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
    "   #v(9pt)",
    '   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[ENGINEERING FOCUS]',
    "   #v(4pt)",
    "   #text(size: 8.75pt, fill: body)[" + typstText(engineeringFocus) + "]",
    "   #v(9pt)",
    '   #text(size: 8.2pt, weight: "semibold", fill: muted, tracking: 0.75pt)[SOURCE]',
    "   #v(4pt)",
    '   #link("' + typstText(project.metadata.repositoryUrl) + '")[#text(size: 8.1pt, fill: accent)[' + typstText(project.metadata.repositoryUrl) + ']]',
    "  ],",
    ")",
  );

  const screenshots = [
    ...(coverImage ? [{ path: coverImage, caption: `${project.metadata.title} main interface` }] : []),
    ...galleryImages.map((imagePath, galleryIndex) => ({
      path: String(imagePath).replace(/^\//, ""),
      caption: galleryCaptions[galleryIndex] ?? `${project.metadata.title} product view ${galleryIndex + 1}`,
    })),
  ];
  for (const screenshot of screenshots) {
    if (!fs.existsSync(path.join(root, "public", screenshot.path))) {
      throw new Error(`${project.metadata.title}: missing screenshot ${screenshot.path}`);
    }
  }
  const rows = Math.ceil(screenshots.length / 2);
  const cellHeight = Math.floor((960 - (rows - 1) * 12) / rows);
  const imageHeight = cellHeight - 24;
  lines.push(
    '#set page(width: 11in, height: 17in, margin: (top: 0.48in, bottom: 0.48in, left: 0.48in, right: 0.48in), header: none)',
    '#text(size: 21pt, weight: "bold", fill: ink)[' + typstText(project.metadata.title) + "]",
    "#v(4pt)",
    '#text(size: 8.5pt, fill: muted)[Project screenshots · Select an image to open the full-size original]',
    "#v(14pt)",
    '#grid(columns: (1fr, 1fr), rows: ' + cellHeight + 'pt, column-gutter: 12pt, row-gutter: 12pt,',
  );
  screenshots.forEach(({ path: imagePath, caption: alt }, index) => {
    const imageUrl = new URL(`/${imagePath}`, profile.metadata.website).toString();
    lines.push(
      '  [#block(width: 100%, height: ' + imageHeight + 'pt, clip: true, radius: 4pt, fill: rgb("#f1f2f3"))[',
      '    #link("' + typstText(imageUrl) + '")[#image("../public/' + typstText(imagePath) + '", width: 100%, height: ' + imageHeight + 'pt, fit: "contain", alt: "' + typstText(alt) + '")]',
      "   ]",
      "   #v(4pt)",
      '   #text(size: 8pt, fill: muted)[' + String(index + 1).padStart(2, "0") + ". " + typstText(alt) + "]],",
    );
  });
  lines.push(")");
}

const outputDirectory = path.join(root, "resume");
fs.mkdirSync(outputDirectory, { recursive: true });
fs.mkdirSync(path.join(root, "output", "pdf"), { recursive: true });
const outputPath = path.join(outputDirectory, "thomas-miller-master.typ");
fs.writeFileSync(outputPath, lines.join("\n") + "\n", "utf8");
console.log(outputPath);

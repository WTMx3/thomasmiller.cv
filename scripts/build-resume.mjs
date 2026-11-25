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
    '  [#block[#set par(leading: 2.3pt); #text(size: 8.65pt, fill: body)[' + item + "]]],",
    ")",
    ...(index < items.length - 1 ? ["#v(3pt)"] : []),
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
  "  margin: (top: 0.62in, bottom: 0.56in, left: 0.67in, right: 0.67in),",
  '  numbering: "1",',
  "  number-align: right,",
  ")",
  '#let ink = rgb("#20272d")',
  '#let body = rgb("#3d474e")',
  '#let muted = rgb("#626b73")',
  '#let accent = rgb("#395a68")',
  '#set text(font: "Inter", size: 9.5pt, fill: body)',
  "#set par(leading: 3.3pt)",
  "#set list(indent: 12pt, body-indent: 6pt, spacing: 4pt, tight: false)",
  "#show link: set text(fill: accent)",
  "#let section(title) = {",
  "  v(10pt)",
  '  text(size: 10.2pt, weight: "bold", fill: accent, upper(title))',
  "  v(7pt)",
  "}",
  '#place(top + left, dx: -0.67in, dy: -0.62in)[#rect(width: 8.5in, height: 5pt, fill: accent)]',
  '#text(size: 16pt, weight: "bold", fill: ink)[' + typstText(profile.metadata.name) + "]",
  "#v(11pt)",
  '#text(size: 9pt, fill: muted)[#link("mailto:' + profile.metadata.email + '")[' + typstText(profile.metadata.email) + ']  |  #link("tel:' + typstText(profile.metadata.phoneHref) + '")[' + typstText(profile.metadata.phone) + ']]',
  "#v(3pt)",
  '#text(size: 9pt, fill: muted)[#link("' + typstText(profile.metadata.website) + '")[' + typstText(profile.metadata.websiteLabel) + ']  |  #link("' + typstText(profile.metadata.github) + '")[github.com/WTMx3]  |  #link("' + typstText(profile.metadata.linkedin) + '")[linkedin.com/in/wtmx3]]',
  "#v(62pt)",
  '#text(size: 14.5pt, weight: "bold", fill: ink)[' + typstText(coverLetter.salutation) + "]",
  ...coverParagraphs.flatMap((paragraph) => [
    "#v(19pt)",
    "#block(width: 100%)[#set text(size: 10.8pt); #set par(leading: 6.2pt); " + typstText(paragraph) + "]",
  ]),
  "#v(23pt)",
  "#text(size: 10.5pt)[" + typstText(coverLetter.closing) + "]",
  "#v(6pt)",
  '#text(size: 10.8pt, weight: "bold", fill: ink)[' + typstText(profile.metadata.name) + "]",
  "#pagebreak()",
  "#grid(columns: (1fr, auto), gutter: 18pt, align: top,",
  '  [#text(size: 24pt, weight: "bold", fill: ink)[' + typstText(profile.metadata.name) + "]],",
  "  [#align(right)[#text(size: 8.4pt, fill: muted)[",
  '    #link("mailto:' + profile.metadata.email + '")[' + typstText(profile.metadata.email) + "] |",
  '    #link("tel:' + typstText(profile.metadata.phoneHref) + '")[' + typstText(profile.metadata.phone) + "] \\",
  '    #link("' + typstText(profile.metadata.website) + '")[' + typstText(profile.metadata.websiteLabel) + "] |",
  '    #link("' + typstText(profile.metadata.github) + '")[github.com/WTMx3]  |  #link("' + typstText(profile.metadata.linkedin) + '")[linkedin.com/in/wtmx3]',
  "  ]]],",
  ")",
  "#v(18pt)",
  '#section("Summary")',
  typstText(profile.content),
  '#section("Skills")',
  "#grid(columns: (1fr, 1fr), column-gutter: 26pt, row-gutter: 10pt,",
];

for (const group of skills) {
  lines.push(
    "  [#block(breakable: false)[",
    "    #set par(leading: 2.4pt)",
    '    #text(size: 8.8pt, weight: "bold", fill: ink)[' + typstText(group.metadata.category) + "]",
    "    #v(1pt)",
    "    #text(size: 8.25pt, fill: body)[" + group.metadata.items.map(typstText).join(", ") + "]",
    "  ]],",
  );
}

lines.push(")");

const educationEntry = education[0];
const leadershipEntry = leadership[0];

if (educationEntry || leadershipEntry) {
  lines.push(
    "#v(16pt)",
    "#grid(columns: (1fr, 1fr), gutter: 22pt,",
  );
  if (educationEntry) {
    lines.push(
      '  [#text(size: 8.1pt, weight: "bold", fill: accent)[EDUCATION]',
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
      '  [#text(size: 8.1pt, weight: "bold", fill: accent)[ACCOLADE]',
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
  "#set text(size: 9.5pt)",
  "#set list(spacing: 3pt)",
  '#text(size: 20pt, weight: "bold", fill: ink)[EXPERIENCE]',
  "#v(8pt)",
  '#text(size: 8.2pt, weight: "bold", fill: accent)[SELECTED ROLES / 01-03]',
  "#v(20pt)",
);

for (const [index, job] of experience.entries()) {
  if (index === 3) {
    lines.push(
      "#pagebreak()",
      '#text(size: 20pt, weight: "bold", fill: ink)[EXPERIENCE]',
      "#v(8pt)",
      '#text(size: 8.2pt, weight: "bold", fill: accent)[EARLIER ROLES / 04-05]',
      "#v(20pt)",
    );
  }
  if (index !== 0 && index !== 3) lines.push(index < 3 ? "#v(18pt)" : "#v(42pt)");
  lines.push(
    "#block(breakable: false)[",
    "#grid(columns: (3pt, 1fr), column-gutter: 10pt, align: top,",
    "  [#rect(width: 3pt, height: 29pt, fill: accent)],",
    "  [#grid(columns: (1fr, auto), gutter: 8pt, align: top,",
    '    [#text(size: 12pt, weight: "bold", fill: ink)[' + typstText(job.metadata.role) + "]",
    "     #v(2pt)",
    '     #text(size: 8.8pt, weight: "bold", fill: accent)[' +
      typstText(job.metadata.company) +
      (job.metadata.location ? " | " + typstText(job.metadata.location) : "") +
      "]],",
    "    [#text(size: 8.5pt, fill: muted)[" +
      typstText(job.metadata.startDate) +
      " - " +
      typstText(job.metadata.endDate) +
      "]],",
    "  )],",
    ")",
    "#v(6pt)",
    "#pad(left: 13pt)[",
    "#block(width: 100%)[#set par(leading: 2.6pt); #text(size: 9.1pt, fill: ink)[" + typstText(job.metadata.summary) + "]]",
    "#v(6pt)",
    ...accomplishmentList(job.content),
    "]",
    "]",
  );
}

for (const [projectIndex, project] of projects.entries()) {
  const engineeringFocus = sectionText(project.content, "Engineering focus");
  const overview = project.content.split(/^## /m)[0].trim();
  const coverImage = String(project.metadata.coverImage ?? "").replace(/^\//, "");
  const galleryImages = Array.isArray(project.metadata.galleryImages) ? project.metadata.galleryImages : [];
  const galleryCaptions = Array.isArray(project.metadata.galleryCaptions) ? project.metadata.galleryCaptions : [];
  if (galleryImages.length !== galleryCaptions.length) {
    throw new Error(`${project.metadata.title}: galleryImages and galleryCaptions must have the same length`);
  }

  lines.push(
    ...(projectIndex === 0 ? ["#pagebreak()"] : []),
    '#set page(width: 8.5in, height: 11in, margin: (top: 0.62in, bottom: 0.56in, left: 0.67in, right: 0.67in), header: none)',
    "#set text(size: 10.2pt)",
    "#set par(leading: 4pt)",
    "#set list(spacing: 6pt)",
    '#text(size: 22pt, weight: "bold", fill: ink)[' + typstText(project.metadata.title) + "]",
    "#v(19pt)",
  );

  lines.push(
    '#text(size: 11.5pt, weight: "semibold", fill: ink)[' + typstText(project.metadata.summary) + "]",
    "#v(22pt)",
    '#text(size: 8.7pt, weight: "bold", fill: accent)[OVERVIEW]',
    "#v(7pt)",
    '#text(size: 10.2pt, fill: body)[' + typstText(overview) + "]",
    "#v(20pt)",
    '#text(size: 8.7pt, weight: "bold", fill: accent)[WHAT I BUILT]',
    ...bulletList(project.content, "6pt"),
    "#v(18pt)",
    '#text(size: 8.7pt, weight: "bold", fill: accent)[ENGINEERING FOCUS]',
    "#v(7pt)",
    '#text(size: 10.2pt, fill: body)[' + typstText(engineeringFocus) + "]",
    "#v(18pt)",
    '#text(size: 8.7pt, weight: "bold", fill: accent)[TECHNOLOGIES]',
    "#v(7pt)",
    '#text(size: 10pt, fill: body)[' + project.metadata.technologies.map(typstText).join(", ") + "]",
    "#v(18pt)",
    '#text(size: 8.7pt, weight: "bold", fill: accent)[SOURCE]',
    "#v(7pt)",
    '#link("' + typstText(project.metadata.repositoryUrl) + '")[#text(size: 10pt, fill: accent)[' + typstText(project.metadata.repositoryUrl) + ']]',
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
  const cellHeight = Math.floor((650 - (rows - 1) * 8) / rows);
  const imageHeight = cellHeight - 19;
  lines.push(
    '#set page(width: 8.5in, height: 11in, margin: (top: 0.45in, bottom: 0.45in, left: 0.67in, right: 0.67in), header: none)',
    '#text(size: 16pt, weight: "bold", fill: ink)[' + typstText(project.metadata.title) + "]",
    "#v(2pt)",
    '#text(size: 7.4pt, fill: muted)[Project screenshots · Select an image to open the full-size original]',
    "#v(8pt)",
    '#grid(columns: (1fr, 1fr), rows: ' + cellHeight + 'pt, column-gutter: 8pt, row-gutter: 8pt,',
  );
  screenshots.forEach(({ path: imagePath, caption: alt }, index) => {
    const imageUrl = new URL(`/${imagePath}`, profile.metadata.website).toString();
    lines.push(
      '  [#block(width: 100%, height: ' + imageHeight + 'pt, clip: true, radius: 3pt, fill: rgb("#f1f2f3"))[',
      '    #link("' + typstText(imageUrl) + '")[#image("../public/' + typstText(imagePath) + '", width: 100%, height: ' + imageHeight + 'pt, fit: "contain", alt: "' + typstText(alt) + '")]',
      "   ]",
      "   #v(3pt)",
      '   #text(size: 7pt, fill: muted)[' + String(index + 1).padStart(2, "0") + ". " + typstText(alt) + "]],",
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

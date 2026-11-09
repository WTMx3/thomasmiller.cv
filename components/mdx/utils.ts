import fs from "fs";
import path from "path";
import YAML from "yaml";

export type FrontmatterValue = string | number | boolean | string[];
export type Frontmatter = Record<string, FrontmatterValue>;

export type ContentEntry = {
  metadata: Frontmatter;
  slug: string;
  content: string;
};

function parseValue(rawValue: string): FrontmatterValue {
  const value = rawValue.trim();

  if (value.startsWith("[") && value.endsWith("]")) {
    try {
      const parsed = JSON.parse(value);
      if (Array.isArray(parsed) && parsed.every((item) => typeof item === "string")) return parsed;
    } catch {
      return value;
    }
  }

  if (value === "true") return true;
  if (value === "false") return false;
  if (/^-?\d+(\.\d+)?$/.test(value)) return Number(value);

  return value.replace(/^['"](.*)['"]$/, "$1");
}

export function parseFrontmatter(fileContent: string) {
  const frontmatterRegex = /^---\s*\r?\n([\s\S]*?)\r?\n---/;
  const match = frontmatterRegex.exec(fileContent);

  if (!match) return { metadata: {} as Frontmatter, content: fileContent.trim() };

  const metadata: Frontmatter = {};
  for (const line of match[1].split(/\r?\n/)) {
    if (!line.trim() || line.trimStart().startsWith("#")) continue;
    const separator = line.indexOf(":");
    if (separator === -1) continue;
    metadata[line.slice(0, separator).trim()] = parseValue(line.slice(separator + 1));
  }

  return {
    metadata,
    content: fileContent.replace(frontmatterRegex, "").trim(),
  };
}

function readMDXFile(filePath: string): Omit<ContentEntry, "slug"> {
  return parseFrontmatter(fs.readFileSync(filePath, "utf-8"));
}

export function getContentCollection(collection: string): ContentEntry[] {
  if (["profile", "education", "skills", "experience", "projects", "leadership"].includes(collection)) {
    const source = YAML.parse(fs.readFileSync(path.join(process.cwd(), "content", "resume.yaml"), "utf-8"));
    const entries = source?.[collection];
    if (!Array.isArray(entries)) throw new Error(`Missing ${collection} entries in content/resume.yaml`);
    return entries
      .map((entry: ContentEntry) => {
        if (typeof entry.slug !== "string" || typeof entry.content !== "string" || !entry.metadata) {
          throw new Error(`Invalid ${collection} entry in content/resume.yaml`);
        }
        return entry;
      })
      .filter((entry: ContentEntry) => entry.metadata.draft !== true)
      .sort((a: ContentEntry, b: ContentEntry) => Number(a.metadata.order ?? 999) - Number(b.metadata.order ?? 999));
  }
  const directory = path.join(process.cwd(), "content", collection);
  if (!fs.existsSync(directory)) return [];

  return fs
    .readdirSync(directory)
    .filter((file) => path.extname(file) === ".mdx")
    .map((file) => ({
      ...readMDXFile(path.join(directory, file)),
      slug: path.basename(file, path.extname(file)),
    }))
    .filter((entry) => entry.metadata.draft !== true)
    .sort((a, b) => Number(a.metadata.order ?? 999) - Number(b.metadata.order ?? 999));
}

export function getContentEntry(collection: string, slug: string) {
  return getContentCollection(collection).find((entry) => entry.slug === slug);
}

export function getBlogPosts() {
  return getContentCollection("blog");
}

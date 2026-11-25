import fs from "node:fs";
import path from "node:path";

import YAML from "yaml";

const contentDirectory = path.join(process.cwd(), "content", "resume");

function readRegistry() {
  const files = fs.readdirSync(contentDirectory).filter((name) => name.endsWith(".yaml"));
  const registry = new Map();
  const outputFiles = new Set();

  for (const filename of files) {
    const config = YAML.parse(fs.readFileSync(path.join(contentDirectory, filename), "utf8"));
    const document = config?.document;
    if (!document || !/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(document.id ?? "")) {
      throw new Error(`${filename}: document.id must be a lowercase slug`);
    }
    if (!document.label || !document.description || !/^wtm3-[a-z0-9-]+\.pdf$/.test(document.file ?? "")) {
      throw new Error(`${filename}: document requires label, description, and a wtm3-*.pdf filename`);
    }
    if (registry.has(document.id) || outputFiles.has(document.file)) {
      throw new Error(`${filename}: duplicate document id or PDF filename`);
    }
    if (document.includes && !Array.isArray(document.includes)) {
      throw new Error(`${filename}: document.includes must be a list of document ids`);
    }
    registry.set(document.id, { document, config, filename });
    outputFiles.add(document.file);
  }
  return registry;
}

function mergeSections(target, source, sourceName) {
  for (const [key, value] of Object.entries(source)) {
    if (key === "document") continue;
    if (key in target) throw new Error(`${sourceName}: section ${key} is included more than once`);
    target[key] = value;
  }
}

function resolveSections(id, registry, visiting = new Set()) {
  const entry = registry.get(id);
  if (!entry) throw new Error(`Unknown resume document: ${id}`);
  if (visiting.has(id)) throw new Error(`Circular resume document include: ${[...visiting, id].join(" -> ")}`);
  visiting.add(id);
  const sections = {};
  for (const includedId of entry.document.includes ?? []) {
    mergeSections(sections, resolveSections(includedId, registry, visiting), entry.filename);
  }
  mergeSections(sections, entry.config, entry.filename);
  visiting.delete(id);
  return sections;
}

export function getResumeDocuments() {
  return [...readRegistry().values()]
    .map(({ document }) => ({
      id: document.id,
      label: document.label,
      description: document.description,
      file: document.file,
      order: Number(document.order ?? 999),
    }))
    .sort((a, b) => a.order - b.order);
}

export function resolveResumeDocument(id) {
  const registry = readRegistry();
  const entry = registry.get(id);
  if (!entry) throw new Error(`Unknown resume document: ${id}`);
  return { document: entry.document, sections: resolveSections(id, registry) };
}

export function getResumeCollection(name) {
  const registry = readRegistry();
  const owners = [...registry.values()].filter(({ config }) => name in config);
  if (owners.length !== 1 || !Array.isArray(owners[0].config[name])) {
    throw new Error(`Expected one ${name} collection in content/resume/*.yaml`);
  }
  return owners[0].config[name]
    .filter((entry) => entry.metadata?.draft !== true)
    .sort((a, b) => Number(a.metadata?.order ?? 999) - Number(b.metadata?.order ?? 999));
}

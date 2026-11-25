import { spawnSync } from "node:child_process";
import fs from "node:fs";
import path from "node:path";

import { getResumeDocuments } from "../lib/resume-content.mjs";

const root = process.cwd();
const outputDirectory = path.join(root, "output", "pdf");
const publicDirectory = path.join(root, "public");
fs.mkdirSync(outputDirectory, { recursive: true });
fs.mkdirSync(publicDirectory, { recursive: true });

for (const document of getResumeDocuments()) {
  const source = path.join("resume", `${document.id}.typ`);
  const output = path.join("output", "pdf", document.file);
  const compile = spawnSync(
    "typst",
    ["compile", "--root", ".", "--font-path", "resume/fonts", source, output, "--pdf-standard", "ua-1"],
    { cwd: root, stdio: "inherit" },
  );
  if (compile.error) throw compile.error;
  if (compile.status !== 0) throw new Error(`Typst failed for ${document.id} (${compile.status})`);

  fs.copyFileSync(path.join(root, output), path.join(publicDirectory, document.file));
  console.log(`${document.label}: ${document.file}`);
  if (document.id === "all-in-one") {
    fs.copyFileSync(path.join(root, output), path.join(outputDirectory, "thomas-miller-master-resume.pdf"));
  }
  if (document.id === "portfolio") {
    fs.copyFileSync(path.join(root, output), path.join(outputDirectory, "thomas-miller-portfolio-resume.pdf"));
  }
}

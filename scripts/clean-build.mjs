import fs from "node:fs";
import path from "node:path";

const root = path.resolve(process.cwd());

for (const directory of [".next", "out"]) {
  const target = path.resolve(root, directory);
  if (!target.startsWith(root + path.sep)) throw new Error(`Refusing to remove path outside project: ${target}`);
  fs.rmSync(target, { recursive: true, force: true });
  console.log(`Removed ${directory}`);
}

import fs from 'node:fs';
import path from 'node:path';

const root = process.cwd();
const source = path.join(root, 'output', 'pdf', 'thomas-miller-master-resume.pdf');
const destinations = [
  path.join(root, 'output', 'pdf', 'thomas-miller-resume.pdf'),
  path.join(root, 'public', 'thomas-miller-resume.pdf'),
];

if (!fs.existsSync(source)) {
  throw new Error(`Compiled resume not found: ${source}`);
}

for (const destination of destinations) {
  fs.mkdirSync(path.dirname(destination), { recursive: true });
  fs.copyFileSync(source, destination);
  console.log(destination);
}

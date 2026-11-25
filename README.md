# Thomas Miller III resume

The interactive site and PDFs share content in [`content/resume/`](content/resume/).
Edit `cover-letter.yaml` for the letter, `resume.yaml` for the profile, skills, experience,
education, and accolade, and `portfolio.yaml` for projects. `all-in-one.yaml` includes the
three source documents in order without copying their content. Each file's `document` block
controls its label, description, PDF filename, and order in the `/resume` selector. See
[`resume/README.md`](resume/README.md) for the document configuration.

Resume and portfolio entries have a `metadata` section for short fields and a `content`
section for longer Markdown text. Experience `content` contains accomplishment bullets.
Project `content` contains the overview, “What I built” bullets, and engineering focus.

For a project, add every screenshot path to `metadata.galleryImages` and a caption at the same
position in `metadata.galleryCaptions`. The first image is `metadata.coverImage`.
The PDF places all project screenshots together on one letter-size gallery page after that
project's description page. Each screenshot links to its full-size image.
Image files belong in
`public/project-media/<project>/`.

## Local development

```bash
pnpm install
pnpm dev
```

Open [http://localhost:3000](http://localhost:3000).

## Build

```bash
pnpm build:fresh
```

`pnpm build` regenerates all four PDFs from the YAML files before building the site.
`pnpm build:fresh` also clears the previous Next.js output. The document selector is at
`/resume`; the scrollable web resume is at `/full-resume`.

```bash
pnpm resume:pdf
```

Run this command to rebuild just the PDFs while editing.

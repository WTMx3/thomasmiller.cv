# Thomas Miller III resume

The interactive site and PDF resume share one content source: [`content/resume.yaml`](content/resume.yaml).
Edit that file to update the cover letter, profile, skills, experience, education, accolade,
portfolio copy, image lists, and captions. Each entry has a `metadata` section for short fields
and a `content` section for longer Markdown text. Experience `content` contains the accomplishment
bullets. Project `content` contains the overview, “What I built” bullets, and engineering focus.

For a project, add every screenshot path to `metadata.galleryImages` and a caption at the same
position in `metadata.galleryCaptions`. The first image is `metadata.coverImage`.
Use `metadata.resumeSinglePageImages` for tall screenshots that need their own PDF page.
Image files belong in `public/project-media/<project>/`.

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

`pnpm build` regenerates `public/wtm3-resume.pdf` from the YAML before building the site.
`pnpm build:fresh` also clears the previous Next.js output. The PDF is served at `/resume`;
the scrollable web resume is at `/full-resume`.

```bash
pnpm resume:pdf
```

Run this command to rebuild just the PDF while editing.

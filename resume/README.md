# Master resume

The website and Typst resume share the MDX files under `content/` as their canonical data source.

- Update contact details and the professional summary in `content/profile/`.
- Add or edit jobs in `content/experience/`.
- Maintain skill groups in `content/skills/`.
- Add portfolio case studies in `content/projects/`.
- Add education in `content/education/`; entries with `draft: true` are excluded.
- Add leadership entries in `content/leadership/`.

Run `pnpm resume:source` to regenerate `thomas-miller-master.typ`. Run `pnpm resume:pdf` to regenerate the source-of-truth PDF, copy it to `public/thomas-miller-resume.pdf`, and update the output copies.

`thomas-miller-resume.typ` is retained as a concise, application-specific variant. It is not the PDF linked from the website; the public PDF is always generated from the shared MDX content above.

Tour narration source files live in `resume/audio-source/` and `resume/caption-source/`. Only compressed, content-hashed web assets belong under `public/audio/resume-tour/` and `public/captions/resume-tour/` so Cloudflare can cache them immutably.

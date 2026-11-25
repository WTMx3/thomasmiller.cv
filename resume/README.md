# Resume documents

The content and document settings live in `content/resume/`:

| File | Edit here for |
| --- | --- |
| `cover-letter.yaml` | Cover letter copy |
| `resume.yaml` | Profile, skills, experience, education, and accolade |
| `portfolio.yaml` | Project descriptions, technologies, screenshots, and captions |
| `all-in-one.yaml` | The ordered `document.includes` list for the combined PDF |

Each file has a `document` block with its selector label, description, output PDF filename, and display order. The loader discovers `.yaml` files in this directory; `document.includes` references other document IDs and rejects missing or circular includes. The website reads the collection that owns each section, so content is not duplicated in the combined PDF configuration.

Run `pnpm resume:pdf` to regenerate the Typst sources in `resume/` and four PDFs in both `output/pdf/` and `public/`. The bundled Inter font in `resume/fonts/` keeps local and Cloudflare layouts consistent. `pnpm build:fresh` regenerates the PDFs and static site. Cloudflare's connected Git build runs the same build command.

The site presents the documents at `/resume`; direct PDF URLs are `/wtm3-cover-letter.pdf`, `/wtm3-resume.pdf`, `/wtm3-portfolio.pdf`, and `/wtm3-all-in-one.pdf`. The scrollable web resume remains at `/full-resume`.

`thomas-miller-resume.typ` is a separate application-specific variant and is not used for these PDFs.

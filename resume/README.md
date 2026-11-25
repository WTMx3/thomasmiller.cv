# Generated resume

`content/resume.yaml` is the shared source for the website and PDF. Update the YAML to change the cover letter, profile, skills, experience, education, accolade, or portfolio entries.

Run `pnpm resume:pdf` to regenerate `resume/thomas-miller-master.typ` and the PDF copies in `output/pdf/` and `public/wtm3-resume.pdf`. The build uses the bundled Inter font in `resume/fonts/` so the layout is consistent locally and in Cloudflare.

Run `pnpm build:fresh` before a local deployment. Cloudflare's Git build also runs this command and serves the resulting PDF at `/resume`. The scrollable web resume remains at `/full-resume`.

`thomas-miller-resume.typ` is a separate, application-specific variant and is not used for the public PDF.

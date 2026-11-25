"use client";

import Link from "next/link";
import { useState } from "react";

type Document = { id: string; label: string; description: string; href: string };

export default function ResumeDocumentViewer({ documents }: { documents: Document[] }) {
  const [selectedId, setSelectedId] = useState(documents.some((document) => document.id === "resume") ? "resume" : documents[0]?.id);
  const selected = documents.find((document) => document.id === selectedId) ?? documents[0];
  if (!selected) return null;

  return (
    <main className="resume-library">
      <div className="resume-library__inner">
        <header className="resume-library__header">
          <div className="resume-library__identity">
            <Link className="resume-library__name" href="/">Thomas Miller III</Link>
            <span>Software engineer</span>
          </div>
          <Link className="resume-library__back" href="/">Back to tour</Link>
        </header>

        <div className="resume-library__intro">
          <p className="resume-library__eyebrow">Documents</p>
          <h1>Resume documents</h1>
          <p>Choose a document to read here, open separately, or download.</p>
        </div>

        <nav aria-label="Select a document" className="resume-library__selector">
          {documents.map((document) => (
            <button
              aria-controls="resume-pdf-viewport"
              aria-pressed={selected.id === document.id}
              className={selected.id === document.id ? "is-selected" : ""}
              key={document.id}
              onClick={() => setSelectedId(document.id)}
              type="button"
            >
              <strong>{document.label}</strong>
              <span>{document.description}</span>
            </button>
          ))}
        </nav>

        <section aria-label={`${selected.label} preview`} className="resume-library__document">
          <div className="resume-library__toolbar">
            <div className="resume-library__document-name">
              <strong>{selected.label}</strong>
              <span>PDF document</span>
            </div>
            <div className="resume-library__actions">
              <a href={selected.href} rel="noreferrer" target="_blank">Open PDF</a>
              <a download href={selected.href}>Download</a>
            </div>
          </div>
          <div className="resume-library__viewport" id="resume-pdf-viewport">
            <iframe key={selected.id} src={`${selected.href}#view=FitH`} title={`${selected.label} PDF`} />
            <p>
              If the preview is unavailable on your device, <a href={selected.href} rel="noreferrer" target="_blank">open the PDF directly</a>.
            </p>
          </div>
        </section>
      </div>
    </main>
  );
}

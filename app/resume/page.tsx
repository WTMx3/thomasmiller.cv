import ResumeDocumentViewer from "@/components/resume-document-viewer";
import { getResumeDocuments } from "@/lib/resume-content.mjs";

export const metadata = {
  title: "Resume documents",
  description: "Read or download Thomas Miller III's cover letter, resume, portfolio, and complete package.",
};

export default function ResumePage() {
  const documents = getResumeDocuments().map(({ id, label, description, file }) => ({
    id,
    label,
    description,
    href: `/${file}`,
  }));
  return <ResumeDocumentViewer documents={documents} />;
}

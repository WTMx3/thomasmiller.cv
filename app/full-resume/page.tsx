import Education from "@/components/education";
import Experience from "@/components/experience";
import Leadership from "@/components/leadership";
import { CustomMDX } from "@/components/mdx/mdx";
import { getContentCollection } from "@/components/mdx/utils";
import ProfessionalSkills from "@/components/professional-skills";

export const metadata = {
  title: "Resume",
  description: "Thomas Miller's professional experience, technical skills, education, and engineering leadership.",
};

export default function Resume() {
  const profile = getContentCollection("profile")[0];

  return (
    <div className="grow pt-12 pb-16 md:pt-16 md:pb-20">
      <div className="max-w-[920px]">
          <header className="mb-12">
            <p className="mb-2 text-sm font-medium text-sky-500">{String(profile.metadata.role)}</p>
            <h1 className="h1 font-aspekta mb-4">{String(profile.metadata.name)}</h1>
            <div className="prose prose-lg prose-p:leading-relaxed max-w-none text-slate-500 dark:text-slate-400">
              <CustomMDX source={profile.content} />
            </div>
            <address className="mt-5 flex flex-wrap gap-x-5 gap-y-2 text-sm not-italic">
              <a className="text-sky-500 hover:underline" href={`mailto:${String(profile.metadata.email)}`}>
                {String(profile.metadata.email)}
              </a>
              <a className="text-slate-500 hover:text-sky-500 dark:text-slate-400" href={`tel:${String(profile.metadata.phoneHref)}`}>
                {String(profile.metadata.phone)}
              </a>
              <a className="text-slate-500 hover:text-sky-500 dark:text-slate-400" href={String(profile.metadata.website)} target="_blank" rel="noreferrer">
                {String(profile.metadata.websiteLabel)}
              </a>
            </address>
          </header>
          <div className="text-slate-500 dark:text-slate-400">
            <Experience />
            <Education />
            <ProfessionalSkills />
            <Leadership />
          </div>
      </div>
    </div>
  );
}

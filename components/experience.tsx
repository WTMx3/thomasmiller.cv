import { CustomMDX } from "@/components/mdx/mdx";
import { getContentCollection } from "@/components/mdx/utils";
import ResumeSection from "@/components/resume-section";

export default function Experience({ limit, showDetails = true }: { limit?: number; showDetails?: boolean }) {
  const roles = getContentCollection("experience").slice(0, limit);

  return (
    <ResumeSection id="experience-heading" title="Job History">
      <ol className="divide-y divide-slate-200 dark:divide-slate-800">
        {roles.map((role) => (
          <li className="py-7 first:pt-0 last:pb-0" key={role.slug}>
            <article>
              <header className="grid gap-2 sm:grid-cols-[minmax(0,1fr)_auto] sm:items-start sm:gap-6">
                <div>
                  <h3 className="font-aspekta text-lg font-[650] text-slate-900 dark:text-white">
                    {String(role.metadata.role)}
                  </h3>
                  <p className="mt-1 text-sm font-medium text-slate-600 dark:text-slate-300">
                    {String(role.metadata.company)}
                    {role.metadata.location ? ` · ${String(role.metadata.location)}` : ""}
                  </p>
                </div>
                <p className="text-sm whitespace-nowrap text-slate-500 dark:text-slate-400">
                  {String(role.metadata.startDate)} <span className="text-slate-400 dark:text-slate-600">·</span>{" "}
                  {String(role.metadata.endDate)}
                </p>
              </header>
              <p className="mt-3 text-sm leading-relaxed text-slate-500 dark:text-slate-400">
                {String(role.metadata.summary)}
              </p>
              {showDetails && (
                <div className="prose prose-sm prose-li:my-1.5 prose-li:leading-relaxed prose-strong:font-medium prose-strong:text-slate-700 marker:text-sky-500 dark:prose-strong:text-slate-200 mt-4 max-w-none text-slate-600 dark:text-slate-400">
                  <CustomMDX source={role.content} />
                </div>
              )}
              {Array.isArray(role.metadata.skills) && role.metadata.skills.length > 0 && (
                <p className="mt-4 text-sm leading-relaxed text-slate-600 dark:text-slate-300">
                  <span className="font-semibold text-slate-900 dark:text-white">Skills & technologies: </span>
                  {role.metadata.skills.join(" · ")}
                </p>
              )}
            </article>
          </li>
        ))}
      </ol>
    </ResumeSection>
  );
}

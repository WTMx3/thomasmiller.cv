import Link from "next/link";

import Experience from "@/components/experience";
import { getContentCollection } from "@/components/mdx/utils";

export const metadata = {
  title: "About",
  description: "About Thomas Miller III, a senior software engineer focused on reliable platforms and secure systems.",
};

export default function About() {
  const profile = getContentCollection("profile")[0];
  const recentRole = getContentCollection("experience")[0];
  const featuredProject = getContentCollection("projects").find((project) => project.metadata.featured === true);

  return (
    <div className="grow pt-12 pb-16 md:pt-16 md:pb-20">
      <div className="max-w-[820px] space-y-12">
        <section>
          <p className="mb-2 text-sm font-medium text-sky-500">About</p>
          <h1 className="h1 font-aspekta mb-5">I turn complex systems into dependable products.</h1>
          <div className="space-y-6 text-lg text-slate-500 dark:text-slate-400">
            <p>{profile.content}</p>
            <div>
              <h2 className="mb-2 text-base font-semibold text-slate-800 dark:text-slate-100">
                Recent work at {String(recentRole.metadata.company)}
              </h2>
              <p>{String(recentRole.metadata.summary)}</p>
            </div>
            {featuredProject && (
              <p>
                Explore <Link className="font-medium text-sky-500 hover:underline" href={`/projects/${featuredProject.slug}`}>{String(featuredProject.metadata.title)}</Link>: {String(featuredProject.metadata.summary)}
              </p>
            )}
          </div>
        </section>
        <Experience limit={3} showDetails={false} />
      </div>
    </div>
  );
}

import Link from "next/link";

import Experience from "@/components/experience";

export const metadata = {
  title: "About",
  description: "About Thomas Miller III, a senior software engineer focused on reliable platforms and secure systems.",
};

export default function About() {
  return (
    <div className="grow pt-12 pb-16 md:pt-16 md:pb-20">
      <div className="max-w-[820px] space-y-12">
          <section>
            <p className="mb-2 text-sm font-medium text-sky-500">About</p>
            <h1 className="h1 font-aspekta mb-5">I turn complex systems into dependable products.</h1>
            <div className="space-y-4 text-lg text-slate-500 dark:text-slate-400">
              <p>
                I&apos;m Thomas Miller III, a senior software engineer working across platform engineering, cloud
                infrastructure, DevOps, site reliability, full-stack development, and application security.
              </p>
              <p>
                My work spans hands-on product development and the systems that keep products healthy: CI/CD,
                observability, identity and access management, incident response, scalable architecture, and clear
                technical documentation.
              </p>
              <p>
                I enjoy building extensible platforms such as <Link className="font-medium text-sky-500 hover:underline" href="/projects/eazyhq">EazyHQ</Link>, where product design, runtime architecture, and operations meet.
              </p>
            </div>
          </section>
          <Experience limit={3} showDetails={false} />
      </div>
    </div>
  );
}

import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";

import { CustomMDX } from "@/components/mdx/mdx";
import { getContentCollection, getContentEntry } from "@/components/mdx/utils";
import ProjectGallery from "@/components/project-gallery";

export function generateStaticParams() {
  return getContentCollection("projects").map((project) => ({ slug: project.slug }));
}

export async function generateMetadata({ params }: { params: Promise<{ slug: string }> }): Promise<Metadata> {
  const { slug } = await params;
  const project = getContentEntry("projects", slug);
  if (!project) return {};

  return {
    title: String(project.metadata.title),
    description: String(project.metadata.summary),
  };
}

export default async function ProjectDetail({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const project = getContentEntry("projects", slug);
  if (!project) notFound();

  const technologies = project.metadata.technologies as string[];
  const coverImage = String(project.metadata.coverImage);
  const galleryImages = (project.metadata.galleryImages ?? []) as string[];
  const galleryCaptions = (project.metadata.galleryCaptions ?? []) as string[];
  const galleryItems = galleryImages.map((src, index) => ({
    src,
    caption: galleryCaptions[index] ?? `Project interface ${index + 1}`,
  }));

  return (
    <div className="grow pt-12 pb-16 md:pt-16 md:pb-20">
      <div>
        <article className="max-w-[980px]">
          <Link className="mb-5 inline-flex text-sm font-medium text-sky-500 hover:underline" href="/projects">
            ← Back to portfolio
          </Link>
          <header className="mb-8 max-w-[820px]">
            <div className="mb-3 flex flex-wrap items-center gap-2 text-xs font-medium tracking-wide text-slate-500 uppercase">
              <span>{String(project.metadata.role)}</span>
              <span aria-hidden="true">·</span>
              <span>{String(project.metadata.startedAt)}</span>
              <span aria-hidden="true">·</span>
              <span className="text-green-600 dark:text-green-400">{String(project.metadata.status)}</span>
            </div>
            <h1 className="h1 font-aspekta mb-4">{String(project.metadata.title)}</h1>
            <p className="text-lg text-slate-500 dark:text-slate-400">{String(project.metadata.summary)}</p>
            <ul className="mt-5 flex flex-wrap gap-2" aria-label="Project technologies">
              {technologies.map((technology) => (
                <li
                  key={technology}
                  className="rounded-full bg-sky-50 px-3 py-1 text-xs font-medium text-sky-700 dark:bg-sky-500/10 dark:text-sky-300"
                >
                  {technology}
                </li>
              ))}
            </ul>
          </header>
          <div className="relative mb-10 aspect-[16/8] overflow-hidden rounded-2xl border border-slate-200 bg-slate-100 shadow-xl shadow-slate-200/30 dark:border-slate-800 dark:bg-slate-950 dark:shadow-black/20">
            <Image
              alt={`${String(project.metadata.title)} interface`}
              className="object-cover object-top"
              fill
              priority
              sizes="(min-width: 1024px) 980px, 100vw"
              src={coverImage}
            />
          </div>
          <div className="max-w-[820px]">
            <div className="prose prose-p:leading-relaxed prose-headings:text-slate-800 dark:prose-headings:text-slate-200 prose-a:font-medium prose-a:text-sky-500 prose-a:no-underline hover:prose-a:underline prose-strong:font-medium prose-strong:text-slate-800 dark:prose-strong:text-slate-100 max-w-none text-slate-500 dark:text-slate-400">
              <CustomMDX source={project.content} />
            </div>
            <a
              className="btn-sm mt-8 inline-flex bg-slate-900 text-white hover:bg-slate-700 dark:bg-slate-100 dark:text-slate-900 dark:hover:bg-white"
              href={String(project.metadata.repositoryUrl)}
              target="_blank"
              rel="noreferrer"
            >
              View repository
            </a>
          </div>
          <ProjectGallery items={galleryItems} projectTitle={String(project.metadata.title)} />
        </article>
      </div>
    </div>
  );
}

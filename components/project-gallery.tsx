"use client";

import Image from "next/image";
import { useEffect, useState } from "react";

export type ProjectGalleryItem = {
  src: string;
  caption: string;
};

export default function ProjectGallery({ items, projectTitle }: { items: ProjectGalleryItem[]; projectTitle: string }) {
  const [activeIndex, setActiveIndex] = useState<number | null>(null);

  useEffect(() => {
    if (activeIndex === null) return;

    const handleKeyDown = (event: KeyboardEvent) => {
      if (event.key === "Escape") setActiveIndex(null);
      if (event.key === "ArrowLeft")
        setActiveIndex((index) => (index === null ? null : (index - 1 + items.length) % items.length));
      if (event.key === "ArrowRight") setActiveIndex((index) => (index === null ? null : (index + 1) % items.length));
    };

    document.body.style.overflow = "hidden";
    window.addEventListener("keydown", handleKeyDown);
    return () => {
      document.body.style.overflow = "";
      window.removeEventListener("keydown", handleKeyDown);
    };
  }, [activeIndex, items.length]);

  if (!items.length) return null;

  return (
    <section
      className="mt-14 border-t border-slate-200 pt-10 dark:border-slate-800"
      aria-labelledby="project-gallery-heading"
    >
      <div className="mb-6 max-w-2xl">
        <p className="mb-2 text-sm font-medium text-sky-500">Product gallery</p>
        <h2 id="project-gallery-heading" className="font-aspekta text-2xl font-[650] text-slate-900 dark:text-white">
          A closer look at the work
        </h2>
        <p className="mt-2 text-slate-500 dark:text-slate-400">Open any image to inspect the interface at full size.</p>
      </div>

      <div className="grid gap-5 sm:grid-cols-2">
        {items.map((item, index) => (
          <button
            className={`group overflow-hidden rounded-xl border border-slate-200 bg-white text-left shadow-sm transition hover:-translate-y-0.5 hover:border-slate-300 hover:shadow-lg dark:border-slate-800 dark:bg-slate-900 dark:hover:border-slate-700 ${index === 0 ? "sm:col-span-2" : ""}`}
            key={item.src}
            onClick={() => setActiveIndex(index)}
            type="button"
          >
            <span className={`relative block overflow-hidden bg-slate-100 dark:bg-slate-950 ${index === 0 ? "aspect-[4/3] sm:aspect-[16/9]" : "aspect-[4/3]"}`}>
              <Image
                alt={`${projectTitle}: ${item.caption}`}
                className="object-cover object-top transition duration-500 group-hover:scale-[1.02]"
                fill
                sizes={index === 0 ? "(min-width: 1024px) 980px, 100vw" : "(min-width: 1024px) 470px, (min-width: 640px) 50vw, 100vw"}
                src={item.src}
              />
            </span>
            <span className="flex items-center justify-between gap-4 border-t border-slate-100 px-4 py-3 text-sm font-medium text-slate-700 dark:border-slate-800 dark:text-slate-200">
              {item.caption}
              <span className="shrink-0 text-sky-500" aria-hidden="true">
                ↗
              </span>
            </span>
          </button>
        ))}
      </div>

      {activeIndex !== null && (
        <div
          aria-label={`${projectTitle} image viewer`}
          aria-modal="true"
          className="fixed inset-0 z-[100] flex items-center justify-center bg-slate-950/90 p-4 backdrop-blur-sm md:p-10"
          onClick={() => setActiveIndex(null)}
          role="dialog"
        >
          <button
            aria-label="Close image viewer"
            className="absolute top-4 right-4 z-10 flex h-11 w-11 items-center justify-center rounded-full border border-white/20 bg-black/40 text-2xl text-white transition hover:bg-black/70 md:top-8 md:right-8"
            onClick={() => setActiveIndex(null)}
            type="button"
          >
            ×
          </button>
          <button
            aria-label="Previous image"
            className="absolute left-3 z-10 flex h-11 w-11 items-center justify-center rounded-full border border-white/20 bg-black/40 text-2xl text-white transition hover:bg-black/70 md:left-8"
            onClick={(event) => {
              event.stopPropagation();
              setActiveIndex((activeIndex - 1 + items.length) % items.length);
            }}
            type="button"
          >
            ‹
          </button>
          <figure
            className="flex h-full w-full max-w-7xl flex-col items-center justify-center"
            onClick={(event) => event.stopPropagation()}
          >
            <div className="relative min-h-0 w-full grow">
              <Image
                alt={`${projectTitle}: ${items[activeIndex].caption}`}
                className="object-contain"
                fill
                priority
                sizes="100vw"
                src={items[activeIndex].src}
              />
            </div>
            <figcaption className="mt-4 shrink-0 text-center text-sm font-medium text-white md:text-base">
              {items[activeIndex].caption}
              <span className="ml-3 text-white/50">
                {activeIndex + 1} / {items.length}
              </span>
            </figcaption>
          </figure>
          <button
            aria-label="Next image"
            className="absolute right-3 z-10 flex h-11 w-11 items-center justify-center rounded-full border border-white/20 bg-black/40 text-2xl text-white transition hover:bg-black/70 md:right-8"
            onClick={(event) => {
              event.stopPropagation();
              setActiveIndex((activeIndex + 1) % items.length);
            }}
            type="button"
          >
            ›
          </button>
        </div>
      )}
    </section>
  );
}

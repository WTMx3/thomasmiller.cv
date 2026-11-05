import ProjectCard from "@/app/project-card";
import { getContentCollection } from "@/components/mdx/utils";

export default function FeaturedProjects() {
  const projects = getContentCollection("projects").filter((project) => project.metadata.featured === true);

  return (
    <section aria-labelledby="featured-projects-heading">
      <h2 id="featured-projects-heading" className="font-aspekta mb-5 text-xl font-[650]">
        Featured Portfolio Work
      </h2>
      <div className="grid gap-5 sm:grid-cols-2 md:grid-cols-1 lg:grid-cols-2">
        {projects.map((project) => (
          <ProjectCard
            key={project.slug}
            item={{
              slug: project.slug,
              title: String(project.metadata.title),
              summary: String(project.metadata.summary),
              status: String(project.metadata.status),
              technologies: project.metadata.technologies as string[],
              coverImage: String(project.metadata.coverImage),
            }}
          />
        ))}
      </div>
    </section>
  );
}

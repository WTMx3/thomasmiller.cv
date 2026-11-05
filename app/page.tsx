import { getContentCollection } from "@/components/mdx/utils";
import ResumeJourney, { type ResumeJourneyData } from "@/components/resume-journey";

export const metadata = {
  title: "Interactive Resume",
  description: "Explore Thomas Miller's experience, skills, and portfolio through an interactive resume journey.",
};

function markdownText(value: string) {
  return value
    .replace(/^#+\s+/gm, "")
    .replace(/\*\*/g, "")
    .trim();
}

function markdownBullets(value: string) {
  return value
    .split(/\r?\n/)
    .filter((line) => /^-\s+/.test(line))
    .map((line) => markdownText(line.replace(/^-\s+/, "")));
}

export default function Home() {
  const profileEntry = getContentCollection("profile")[0];
  const educationEntry = getContentCollection("education")[0];
  const leadershipEntry = getContentCollection("leadership")[0];
  const roleEntries = getContentCollection("experience");
  const skillEntries = getContentCollection("skills");
  const projectEntries = getContentCollection("projects");

  const data: ResumeJourneyData = {
    profile: {
      name: String(profileEntry.metadata.name),
      role: String(profileEntry.metadata.role),
      tagline: String(profileEntry.metadata.tagline),
      email: String(profileEntry.metadata.email),
      phone: String(profileEntry.metadata.phone),
      phoneHref: String(profileEntry.metadata.phoneHref),
      websiteLabel: String(profileEntry.metadata.websiteLabel),
      yearsExperience: String(profileEntry.metadata.yearsExperience),
      bio: markdownText(profileEntry.content),
    },
    education: {
      degree: String(educationEntry.metadata.degree),
      institution: String(educationEntry.metadata.institution),
      field: String(educationEntry.metadata.field),
      dates: `${String(educationEntry.metadata.startDate)} — ${String(educationEntry.metadata.endDate)}`,
      summary: markdownText(educationEntry.content),
    },
    roles: roleEntries.map((entry) => ({
      company: String(entry.metadata.company),
      role: String(entry.metadata.role),
      location: entry.metadata.location ? String(entry.metadata.location) : "",
      dates: `${String(entry.metadata.startDate)} — ${String(entry.metadata.endDate)}`,
      summary: String(entry.metadata.summary),
      achievements: markdownBullets(entry.content),
    })),
    skills: skillEntries.map((entry) => ({
      category: String(entry.metadata.category),
      summary: markdownText(entry.content),
      items: entry.metadata.items as string[],
    })),
    projects: projectEntries.map((entry) => ({
      slug: entry.slug,
      title: String(entry.metadata.title),
      context: entry.metadata.status === "Active development" ? "Independent product" : "Portfolio project",
      date: String(entry.metadata.startedAt),
      status: String(entry.metadata.status),
      summary: String(entry.metadata.summary),
      technologies: entry.metadata.technologies as string[],
      repositoryUrl: String(entry.metadata.repositoryUrl),
    })),
    leadership: {
      role: String(leadershipEntry.metadata.role),
      organization: String(leadershipEntry.metadata.organization),
      dates: `${String(leadershipEntry.metadata.startDate)} — ${String(leadershipEntry.metadata.endDate)}`,
      summary: markdownText(leadershipEntry.content),
    },
  };

  return <ResumeJourney data={data} />;
}

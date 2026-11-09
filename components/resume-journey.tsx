"use client";

import Image from "next/image";
import { useCallback, useEffect, useMemo, useRef, useState } from "react";

type Profile = {
  name: string;
  role: string;
  tagline: string;
  email: string;
  phone: string;
  phoneHref: string;
  websiteLabel: string;
  yearsExperience: string;
  bio: string;
};

type Education = {
  degree: string;
  institution: string;
  field: string;
  dates: string;
  summary: string;
};

type Role = {
  company: string;
  role: string;
  location: string;
  dates: string;
  summary: string;
  achievements: string[];
};

type SkillGroup = {
  category: string;
  summary: string;
  items: string[];
};

type Project = {
  slug: string;
  title: string;
  context: string;
  date: string;
  status: string;
  summary: string;
  technologies: string[];
  repositoryUrl: string;
  coverImage: string;
  achievements: string[];
  engineeringFocus: string;
  galleryImages: { src: string; caption: string }[];
};

export type ResumeJourneyData = {
  profile: Profile;
  education: Education;
  roles: Role[];
  skills: SkillGroup[];
  projects: Project[];
  leadership: {
    role: string;
    organization: string;
    dates: string;
    summary: string;
  };
};

const stages = [
  { id: "intro", short: "Intro", label: "Introduction" },
  { id: "profile", short: "Profile", label: "Biography" },
  { id: "skills", short: "Skills", label: "Skills and tools" },
  { id: "experience", short: "Experience", label: "Work experience" },
  { id: "projects", short: "Projects", label: "Portfolio projects" },
  { id: "complete", short: "Complete", label: "Tour complete" },
] as const;

type NarrationTrack = {
  audio: string;
  captions: string;
  label: string;
};

type CaptionCue = {
  start: number;
  end: number;
  text: string;
};

const narrationTracks: Record<string, NarrationTrack> = {
  profile: {
    audio: "/audio/resume-tour/profile.3dacb077958c.mp3",
    captions: "/captions/resume-tour/profile.e71218c00364.vtt",
    label: "Profile introduction",
  },
  skills: {
    audio: "/audio/resume-tour/skills.ffce3375ca9f.mp3",
    captions: "/captions/resume-tour/skills.5f5e168924a7.vtt",
    label: "Skills and tools",
  },
  experience: {
    audio: "/audio/resume-tour/experience.516c7f4788f9.mp3",
    captions: "/captions/resume-tour/experience.0eaba9263b67.vtt",
    label: "Professional experience",
  },
  projects: {
    audio: "/audio/resume-tour/projects.77d898dd5f73.mp3",
    captions: "/captions/resume-tour/projects.046d3947b1af.vtt",
    label: "Portfolio projects",
  },
};

function parseVttTime(value: string) {
  const [hours, minutes, seconds] = value.split(":");
  return Number(hours) * 3600 + Number(minutes) * 60 + Number(seconds);
}

function parseWebVtt(value: string): CaptionCue[] {
  return value
    .trim()
    .split(/\r?\n\r?\n/)
    .slice(1)
    .map((block) => {
      const lines = block.split(/\r?\n/).filter(Boolean);
      const timingIndex = lines.findIndex((line) => line.includes(" --> "));
      if (timingIndex < 0) return null;
      const [start, end] = lines[timingIndex].split(" --> ");
      return {
        start: parseVttTime(start),
        end: parseVttTime(end),
        text: lines.slice(timingIndex + 1).join(" "),
      };
    })
    .filter((cue): cue is CaptionCue => cue !== null);
}

const ArrowIcon = ({ direction = "right" }: { direction?: "left" | "right" }) => (
  <svg
    aria-hidden="true"
    className={direction === "left" ? "journey-icon journey-icon--left" : "journey-icon"}
    viewBox="0 0 20 20"
  >
    <path d="M4 10h11M11 6l4 4-4 4" />
  </svg>
);

const DocumentIcon = () => (
  <svg aria-hidden="true" className="journey-icon" viewBox="0 0 20 20">
    <path d="M5 2.5h6l4 4v11H5zM11 2.5v4h4M7.5 10h5M7.5 13h5" />
  </svg>
);

const AudioIcon = ({ muted = false }: { muted?: boolean }) => (
  <svg aria-hidden="true" className="journey-icon" viewBox="0 0 20 20">
    <path d="M3.5 8h3l4-3.5v11L6.5 12h-3z" />
    {muted ? (
      <path className="audio-icon__mute" d="M13.2 7.2l4.2 5.6M17.4 7.2l-4.2 5.6" />
    ) : (
      <path d="M13.5 7.2c.8.8 1.2 1.7 1.2 2.8s-.4 2-1.2 2.8M15.8 5c1.4 1.4 2.1 3 2.1 5s-.7 3.6-2.1 5" />
    )}
  </svg>
);

const PlayPauseIcon = ({ paused }: { paused: boolean }) => (
  <svg aria-hidden="true" className="journey-icon" viewBox="0 0 20 20">
    {paused ? <path d="M7 5l8 5-8 5z" /> : <path d="M6.5 5v10M13.5 5v10" />}
  </svg>
);

const ExternalIcon = () => (
  <svg aria-hidden="true" className="journey-icon" viewBox="0 0 20 20">
    <path d="M8 5H4v11h11v-4M10 4h6v6M9 11l7-7" />
  </svg>
);

const RefreshIcon = () => (
  <svg aria-hidden="true" className="journey-icon" viewBox="0 0 20 20">
    <path d="M16.5 8A6.5 6.5 0 1 0 17 11M16.5 3.5V8H12" />
  </svg>
);

function StageEyebrow({ current, children }: { current: number; children: React.ReactNode }) {
  return (
    <p className="stage-eyebrow">
      <span>
        {String(current + 1).padStart(2, "0")} / {String(stages.length).padStart(2, "0")}
      </span>
      {children}
    </p>
  );
}

function IntroStage({
  audioEnabled,
  onNext,
  onToggleAudio,
}: {
  audioEnabled: boolean;
  onNext: () => void;
  onToggleAudio: () => void;
}) {
  return (
    <section className="journey-stage journey-stage--intro" aria-labelledby="intro-title">
      <div className="intro-copy">
        <StageEyebrow current={0}>Engineer · Builder · Systems thinker</StageEyebrow>
        <h1 id="intro-title">
          Hello, pleased to meet you.
          <br />
          My name is <span>Thomas Miller III.</span>
        </h1>
        <p className="intro-summary">I would love to introduce myself.</p>
        <div className="intro-actions">
          <div className="intro-tour-action">
            <button
              aria-label={audioEnabled ? "Turn tour audio off" : "Turn tour audio on"}
              aria-pressed={audioEnabled}
              className="intro-audio-toggle"
              onClick={onToggleAudio}
              type="button"
            >
              <AudioIcon muted={!audioEnabled} />
            </button>
            <a
              className="journey-button journey-button--primary"
              href="#profile"
              onClick={(event) => {
                event.preventDefault();
                onNext();
              }}
            >
              Take the tour <ArrowIcon />
            </a>
          </div>
          <div className="intro-or" aria-hidden="true">
            <span>Or</span>
          </div>
          <a
            className="journey-button journey-button--secondary"
            href="/resume"
            rel="noreferrer"
            target="_blank"
          >
            <DocumentIcon /> View résumé PDF
          </a>
        </div>
      </div>
    </section>
  );
}

function NarrationPlayer({
  audioRef,
  audioEnabled,
  onToggleAudio,
  onVolumeChange,
  track,
  volume,
}: {
  audioRef: React.RefObject<HTMLAudioElement | null>;
  audioEnabled: boolean;
  onToggleAudio: () => void;
  onVolumeChange: (volume: number) => void;
  track: NarrationTrack;
  volume: number;
}) {
  const [cues, setCues] = useState<CaptionCue[]>([]);
  const [caption, setCaption] = useState("");
  const [isPlaying, setIsPlaying] = useState(false);
  const [playbackBlocked, setPlaybackBlocked] = useState(false);
  const [progress, setProgress] = useState(0);

  const waveHeights = useMemo(() => {
    const source = caption || track.label;
    return Array.from({ length: 36 }, (_, index) => {
      const character = source.charCodeAt(index % source.length) || 20;
      return 8 + ((character + index * 7) % 24);
    });
  }, [caption, track.label]);

  useEffect(() => {
    let cancelled = false;
    fetch(track.captions)
      .then((response) => {
        if (!response.ok) throw new Error("Captions unavailable");
        return response.text();
      })
      .then((value) => {
        if (!cancelled) setCues(parseWebVtt(value));
      })
      .catch(() => {
        if (!cancelled) setCues([]);
      });
    return () => {
      cancelled = true;
    };
  }, [track.captions]);

  useEffect(() => {
    const audio = audioRef.current;
    if (!audio) return;
    if (new URL(audio.src, window.location.href).pathname !== track.audio) audio.src = track.audio;

    if (!audioEnabled) {
      audio.pause();
      return;
    }

    if (audio.paused) audio.play().then(() => setPlaybackBlocked(false)).catch(() => setPlaybackBlocked(true));
  }, [audioEnabled, audioRef, track.audio]);

  useEffect(() => {
    const audio = audioRef.current;
    if (audio) audio.volume = volume;
  }, [track.audio, volume]);

  const updatePlayback = () => {
    const audio = audioRef.current;
    if (!audio) return;
    const cue = cues.find((item) => audio.currentTime >= item.start && audio.currentTime <= item.end);
    setCaption(cue?.text ?? "");
    setProgress(audio.duration ? audio.currentTime / audio.duration : 0);
  };

  useEffect(() => {
    const audio = audioRef.current;
    if (!audio) return;
    const onPlay = () => { setIsPlaying(true); setPlaybackBlocked(false); };
    const onPause = () => setIsPlaying(false);
    const onEnded = () => { setIsPlaying(false); setProgress(1); };
    audio.addEventListener("play", onPlay);
    audio.addEventListener("pause", onPause);
    audio.addEventListener("ended", onEnded);
    audio.addEventListener("timeupdate", updatePlayback);
    setIsPlaying(!audio.paused);
    updatePlayback();
    return () => {
      audio.removeEventListener("play", onPlay);
      audio.removeEventListener("pause", onPause);
      audio.removeEventListener("ended", onEnded);
      audio.removeEventListener("timeupdate", updatePlayback);
    };
  }, [audioRef, cues]);

  const togglePlayback = () => {
    const audio = audioRef.current;
    if (!audio) return;
    if (audio.paused) {
      if (!audioEnabled) {
        onToggleAudio();
        return;
      }
      audio
        .play()
        .then(() => setPlaybackBlocked(false))
        .catch(() => setPlaybackBlocked(true));
    } else {
      audio.pause();
    }
  };

  const isMuted = !audioEnabled || volume === 0;

  const toggleMute = () => {
    if (isMuted) {
      if (!audioEnabled) onToggleAudio();
      if (volume === 0) onVolumeChange(0.75);
      return;
    }
    onToggleAudio();
  };

  return (
    <aside className="tour-narration" aria-label={`${track.label} narrated tour`}>
      <div className="tour-narration__identity">
        <span>Narrated tour</span>
        <strong>{track.label}</strong>
      </div>

      <div className={`tour-wave ${isPlaying ? "is-playing" : ""}`} key={caption || track.label} aria-hidden="true">
        {waveHeights.map((height, index) => (
          <i
            key={`${height}-${index}`}
            style={
              {
                "--wave-height": `${height}px`,
                "--wave-index": index,
              } as React.CSSProperties
            }
          />
        ))}
      </div>

      <div className="tour-caption" aria-live="polite">
        <p>{caption || (playbackBlocked ? "Press play to begin the narration." : track.label)}</p>
        <span style={{ "--tour-progress": progress } as React.CSSProperties} />
      </div>

      <div className="tour-narration__controls">
        <button aria-label={isPlaying ? "Pause narration" : "Play narration"} onClick={togglePlayback} type="button">
          <PlayPauseIcon paused={!isPlaying} />
        </button>
        <div className="tour-volume-control">
          <button
            aria-label={isMuted ? "Turn tour audio on" : "Turn tour audio off"}
            aria-pressed={!isMuted}
            onClick={toggleMute}
            type="button"
          >
            <AudioIcon muted={isMuted} />
          </button>
          <input
            aria-label="Narration volume"
            aria-valuetext={`${Math.round(volume * 100)} percent`}
            max="1"
            min="0"
            onChange={(event) => {
              const nextVolume = Number(event.target.value);
              onVolumeChange(nextVolume);
              if (!audioEnabled && nextVolume > 0) onToggleAudio();
            }}
            step="0.05"
            style={{ "--volume-percent": `${volume * 100}%` } as React.CSSProperties}
            title={`Narration volume: ${Math.round(volume * 100)}%`}
            type="range"
            value={volume}
          />
        </div>
      </div>
    </aside>
  );
}

function CompleteStage({ onRestart }: { onRestart: () => void }) {
  return (
    <section className="journey-stage journey-stage--complete" aria-labelledby="complete-title">
      <div className="complete-copy">
        <StageEyebrow current={stages.length - 1}>Tour complete</StageEyebrow>
        <h1 id="complete-title">
          <span>Thank you</span> for taking the time to get to know me.
        </h1>
        <p>I appreciate your time. If my experience could be a fit, I would be glad to continue the conversation.</p>
        <div className="complete-actions">
          <button className="journey-button journey-button--primary" onClick={onRestart} type="button">
            <ArrowIcon direction="left" /> Start over
          </button>
          <div className="intro-or" aria-hidden="true">
            <span>Or</span>
          </div>
          <a
            className="journey-button journey-button--secondary"
            href="/resume"
            rel="noreferrer"
            target="_blank"
          >
            <DocumentIcon /> View résumé PDF
          </a>
        </div>
      </div>
    </section>
  );
}

function ProfileStage({ data }: { data: ResumeJourneyData }) {
  const recent = data.roles[0];
  const highlights = recent.achievements.slice(0, 3);

  return (
    <section className="journey-stage journey-stage--profile" aria-labelledby="profile-title">
      <header className="stage-heading">
        <div>
          <StageEyebrow current={1}>At a glance</StageEyebrow>
          <h2 id="profile-title">
            A product mindset.
            <br />
            <span>A platform backbone.</span>
          </h2>
        </div>
        <p>A quick overview of where I am, how I work, and what I bring to an engineering team.</p>
      </header>

      <div className="profile-stack">
        <article className="profile-row profile-row--mission">
          <div className="profile-row__label">
            <span>01</span>
            <h3>Mission statement</h3>
          </div>
          <div className="profile-row__content">
            <blockquote>
              Build useful products, make them dependable, and leave the system better than I found it.
            </blockquote>
            <p>{data.profile.bio}</p>
          </div>
        </article>

        <article className="profile-row">
          <div className="profile-row__label">
            <span>02</span>
            <h3>Most recent position</h3>
          </div>
          <div className="profile-row__content">
            <div className="profile-row__heading">
              <div>
                <h4>{recent.role}</h4>
                <p className="card-meta">
                  {recent.company} · {recent.location}
                </p>
              </div>
              <p className="card-date">{recent.dates}</p>
            </div>
            <p>{recent.summary}</p>
          </div>
        </article>

        <article className="profile-row">
          <div className="profile-row__label">
            <span>03</span>
            <h3>Education</h3>
          </div>
          <div className="profile-row__content">
            <div className="profile-row__heading">
              <div>
                <h4>{data.education.degree}</h4>
                <p className="card-meta">{data.education.institution}</p>
              </div>
              <p className="card-date">{data.education.dates}</p>
            </div>
            <p>{data.education.field}</p>
          </div>
        </article>

        <article className="profile-row">
          <div className="profile-row__label">
            <span>04</span>
            <h3>Selected achievements</h3>
          </div>
          <div className="profile-row__content">
            <ul className="profile-achievements">
              {highlights.map((highlight) => (
                <li key={highlight}>{highlight}</li>
              ))}
            </ul>
          </div>
        </article>
      </div>
    </section>
  );
}

function SkillsStage({ data }: { data: ResumeJourneyData }) {
  const [activeCategory, setActiveCategory] = useState("All");
  const visibleGroups = useMemo(
    () => (activeCategory === "All" ? data.skills : data.skills.filter((group) => group.category === activeCategory)),
    [activeCategory, data.skills],
  );
  const visibleSkillCount = visibleGroups.reduce((count, group) => count + group.items.length, 0);

  return (
    <section className="journey-stage journey-stage--skills" aria-labelledby="skills-title">
      <header className="stage-heading stage-heading--inline">
        <div>
          <StageEyebrow current={2}>Technical range</StageEyebrow>
          <h2 id="skills-title">
            Skills <span>&amp; tools</span>
          </h2>
        </div>
        <p>
          {visibleSkillCount} capabilities across {visibleGroups.length}{" "}
          {visibleGroups.length === 1 ? "discipline" : "disciplines"}.
        </p>
      </header>

      <div className="skill-filters" aria-label="Filter skills by discipline" role="toolbar">
        {["All", ...data.skills.map((group) => group.category)].map((category) => (
          <button
            aria-pressed={activeCategory === category}
            className={activeCategory === category ? "is-active" : ""}
            key={category}
            onClick={() => setActiveCategory(category)}
            type="button"
          >
            {category}
          </button>
        ))}
      </div>

      <div className="skills-table-wrap">
        <table className="skills-table">
          <thead>
            <tr>
              <th scope="col">Discipline</th>
              <th scope="col">Working toolkit</th>
              <th scope="col">Focus</th>
            </tr>
          </thead>
          <tbody key={activeCategory}>
            {visibleGroups.map((group, index) => (
              <tr key={group.category} style={{ "--row-index": index } as React.CSSProperties}>
                <th scope="row">
                  <span className="skill-index">
                    {String(data.skills.findIndex((item) => item.category === group.category) + 1).padStart(2, "0")}
                  </span>
                  {group.category}
                </th>
                <td>
                  <ul className="skill-list" aria-label={`${group.category} skills`}>
                    {group.items.map((skill) => (
                      <li key={skill}>{skill}</li>
                    ))}
                  </ul>
                </td>
                <td>{group.summary}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </section>
  );
}

function ExperienceStage({ data }: { data: ResumeJourneyData }) {
  const [selected, setSelected] = useState(0);
  const role = data.roles[selected];

  return (
    <section className="journey-stage journey-stage--experience" aria-labelledby="experience-title">
      <header className="stage-heading stage-heading--inline">
        <div>
          <StageEyebrow current={3}>Career timeline</StageEyebrow>
          <h2 id="experience-title">
            Work <span>experience</span>
          </h2>
        </div>
        <p>Select a role to explore the work, responsibilities, and impact.</p>
      </header>

      <div className="experience-layout">
        <div className="role-timeline" role="tablist" aria-label="Employment history">
          {data.roles.map((item, index) => (
            <button
              aria-controls="role-detail"
              aria-selected={selected === index}
              className={selected === index ? "is-active" : ""}
              id={`role-tab-${index}`}
              key={`${item.company}-${item.role}`}
              onClick={() => setSelected(index)}
              role="tab"
              type="button"
            >
              <span className="role-timeline__dot" />
              <span className="role-timeline__copy">
                <strong>{item.role}</strong>
                <span>
                  {item.company}
                  {item.location ? ` · ${item.location}` : ""}
                </span>
                <small>{item.dates}</small>
              </span>
              <ArrowIcon />
            </button>
          ))}
        </div>

        <article
          aria-labelledby={`role-tab-${selected}`}
          className="role-detail"
          id="role-detail"
          key={`${role.company}-${role.role}`}
          role="tabpanel"
        >
          <header>
            <div>
              <span className="card-kicker">Role {String(selected + 1).padStart(2, "0")}</span>
              <h3>{role.role}</h3>
              <p className="card-meta">
                {role.company}
                {role.location ? ` · ${role.location}` : ""}
              </p>
            </div>
            <p className="role-detail__date">{role.dates}</p>
          </header>
          <div className="role-detail__section">
            <h4>Summary</h4>
            <p>{role.summary}</p>
          </div>
          <div className="role-detail__section">
            <h4>Key achievements</h4>
            <ul>
              {role.achievements.slice(0, 5).map((achievement) => (
                <li key={achievement}>{achievement}</li>
              ))}
            </ul>
          </div>
          <div className="role-detail__pager" aria-label="Role navigation">
            <span>
              {selected + 1} of {data.roles.length}
            </span>
            <div>
              <button
                aria-label="Previous role"
                disabled={selected === 0}
                onClick={() => setSelected((value) => value - 1)}
                type="button"
              >
                <ArrowIcon direction="left" />
              </button>
              <button
                aria-label="Next role"
                disabled={selected === data.roles.length - 1}
                onClick={() => setSelected((value) => value + 1)}
                type="button"
              >
                <ArrowIcon />
              </button>
            </div>
          </div>
        </article>
      </div>
    </section>
  );
}

function ProjectsStage({ data }: { data: ResumeJourneyData }) {
  const [selected, setSelected] = useState(0);
  const [selectedImage, setSelectedImage] = useState(0);
  const project = data.projects[selected];
  const images = [{ src: project.coverImage, caption: `${project.title} interface` }, ...project.galleryImages];

  const selectProject = (index: number) => {
    setSelected(index);
    setSelectedImage(0);
  };

  return (
    <section className="journey-stage journey-stage--projects" aria-labelledby="projects-title">
      <header className="stage-heading stage-heading--inline">
        <div>
          <StageEyebrow current={4}>Selected builds</StageEyebrow>
          <h2 id="projects-title">
            Portfolio <span>projects</span>
          </h2>
        </div>
        <p>Products and systems where architecture, reliability, and useful interfaces meet.</p>
      </header>

      <div className="project-layout">
        <div className="project-rail" role="tablist" aria-label="Portfolio projects">
          {data.projects.map((item, index) => (
            <button
              aria-controls="project-detail"
              aria-selected={selected === index}
              className={selected === index ? "is-active" : ""}
              id={`project-tab-${index}`}
              key={item.slug}
              onClick={() => selectProject(index)}
              role="tab"
              type="button"
            >
              <span className="project-rail__number">{String(index + 1).padStart(2, "0")}</span>
              <span>
                <strong>{item.title}</strong>
                <small>{item.context}</small>
              </span>
              <ArrowIcon />
            </button>
          ))}
        </div>

        <article
          aria-labelledby={`project-tab-${selected}`}
          className="project-detail"
          id="project-detail"
          key={project.slug}
          role="tabpanel"
        >
          <div className="project-detail__visual">
            <Image alt={images[selectedImage].caption} className="project-detail__image" fill priority sizes="(min-width: 900px) 70vw, 100vw" src={images[selectedImage].src} />
          </div>
          <div className="project-detail__media-strip">
            <div className="project-detail__gallery" aria-label={`${project.title} screenshots`}>
              {images.map((item, index) => (
                <button aria-label={`Show ${item.caption}`} aria-pressed={selectedImage === index} className={selectedImage === index ? "is-active" : ""} key={item.src} onClick={() => setSelectedImage(index)} type="button">
                  <Image alt="" fill sizes="120px" src={item.src} />
                </button>
              ))}
            </div>
            <p className="project-detail__caption">{images[selectedImage].caption}</p>
          </div>

          <div className="project-detail__content">
            <div className="project-detail__meta">
              <span>{project.context}</span>
              <span>{project.date}</span>
            </div>
            <h3>{project.title}</h3>
            <p>{project.summary}</p>
            <div className="project-detail__section">
              <h4>What I built</h4>
              <ul>{project.achievements.map((achievement) => <li key={achievement}>{achievement}</li>)}</ul>
            </div>
            <div className="project-detail__section">
              <h4>Engineering focus</h4>
              <p>{project.engineeringFocus}</p>
            </div>
            <div className="project-tech">
              <span className="card-kicker">Key skills &amp; technologies</span>
              <ul>
                {project.technologies.map((technology) => (
                  <li key={technology}>{technology}</li>
                ))}
              </ul>
            </div>
            <div className="project-links">
              <a className="journey-text-link" href={project.repositoryUrl} rel="noreferrer" target="_blank">
                View repository <ExternalIcon />
              </a>
            </div>
            <div className="role-detail__pager" aria-label="Project navigation">
              <span>{selected + 1} of {data.projects.length}</span>
              <div>
                <button aria-label="Previous project" disabled={selected === 0} onClick={() => selectProject(selected - 1)} type="button"><ArrowIcon direction="left" /></button>
                <button aria-label="Next project" disabled={selected === data.projects.length - 1} onClick={() => selectProject(selected + 1)} type="button"><ArrowIcon /></button>
              </div>
            </div>
          </div>
        </article>
      </div>
    </section>
  );
}

export default function ResumeJourney({ data }: { data: ResumeJourneyData }) {
  const [activeStage, setActiveStage] = useState(0);
  const [audioEnabled, setAudioEnabled] = useState(true);
  const [volume, setVolume] = useState(0.85);
  const audioRef = useRef<HTMLAudioElement>(null);
  const completeStageIndex = stages.length - 1;
  const showTourControls = activeStage > 0 && activeStage < completeStageIndex;

  const goToStage = useCallback((index: number) => {
    const nextIndex = Math.max(0, Math.min(stages.length - 1, index));
    const audio = audioRef.current;
    const nextTrack = narrationTracks[stages[nextIndex].id];
    if (audio) {
      audio.pause();
      if (nextTrack) {
        if (new URL(audio.src, window.location.href).pathname !== nextTrack.audio) audio.src = nextTrack.audio;
        audio.currentTime = 0;
        audio.volume = volume;
        if (audioEnabled) void audio.play().catch(() => {});
      }
    }
    setActiveStage(nextIndex);
    window.location.hash = stages[nextIndex].id;
  }, [audioEnabled, volume]);

  useEffect(() => {
    const syncStageToHash = () => {
      const hashIndex = stages.findIndex((stage) => `#${stage.id}` === window.location.hash);
      if (hashIndex >= 0) setActiveStage(hashIndex);
    };

    window.addEventListener("hashchange", syncStageToHash);
    queueMicrotask(syncStageToHash);
    return () => window.removeEventListener("hashchange", syncStageToHash);
  }, []);

  useEffect(() => {
    const onKeyDown = (event: KeyboardEvent) => {
      const target = event.target as HTMLElement;
      if (["INPUT", "TEXTAREA", "SELECT"].includes(target.tagName)) return;
      if (event.key === "ArrowRight" || event.key === "PageDown") {
        event.preventDefault();
        goToStage(activeStage + 1);
      }
      if (event.key === "ArrowLeft" || event.key === "PageUp") {
        event.preventDefault();
        goToStage(activeStage - 1);
      }
      if (event.key === "Home") goToStage(0);
      if (event.key === "End") goToStage(stages.length - 1);
    };
    window.addEventListener("keydown", onKeyDown);
    return () => window.removeEventListener("keydown", onKeyDown);
  }, [activeStage, goToStage]);

  const stageContent = [
    <IntroStage
      audioEnabled={audioEnabled}
      key="intro"
      onNext={() => goToStage(1)}
      onToggleAudio={() => setAudioEnabled((value) => !value)}
    />,
    <ProfileStage data={data} key="profile" />,
    <SkillsStage data={data} key="skills" />,
    <ExperienceStage data={data} key="experience" />,
    <ProjectsStage data={data} key="projects" />,
    <CompleteStage key="complete" onRestart={() => goToStage(1)} />,
  ];
  const previousStage = stages[activeStage - 1];
  const nextStage = stages[activeStage + 1];

  return (
    <div
      className={[
        "resume-journey",
        showTourControls ? "has-active-tour" : "",
        activeStage === completeStageIndex ? "is-complete" : "",
      ]
        .filter(Boolean)
        .join(" ")}
    >
      <audio aria-hidden="true" preload="auto" ref={audioRef} src={narrationTracks.profile.audio} />
      <div className="journey-backdrop" aria-hidden="true">
        <span />
        <span />
      </div>

      <div className="journey-viewport" key={stages[activeStage].id}>
        {stageContent[activeStage]}
      </div>

      {showTourControls ? (
        <div className="journey-control-dock">
          <div className="journey-direction-controls" aria-label="Tour direction controls">
            <button
              aria-label={`Previous stage: ${previousStage.label}`}
              className="journey-edge-button journey-edge-button--previous"
              onClick={() => goToStage(activeStage - 1)}
              type="button"
            >
              <ArrowIcon direction="left" />
              <span>
                <small>Previous</small>
                <strong>{previousStage.short}</strong>
              </span>
            </button>

            <button
              aria-label={nextStage ? `Next stage: ${nextStage.label}` : "Tour complete"}
              className="journey-edge-button journey-edge-button--next"
              disabled={!nextStage}
              onClick={() => goToStage(activeStage + 1)}
              type="button"
            >
              <span>
                <small>{nextStage ? "Next" : "Tour"}</small>
                <strong>{nextStage?.short ?? "Complete"}</strong>
              </span>
              <ArrowIcon />
            </button>
          </div>

          <nav aria-label="Résumé stages" className="journey-progress">
            {stages.map((stage, index) => (
              <button
                aria-label={`Go to ${stage.label}`}
                aria-current={activeStage === index ? "step" : undefined}
                className={activeStage === index ? "is-active" : activeStage > index ? "is-complete" : ""}
                key={stage.id}
                onClick={() => goToStage(index)}
                title={stage.short}
                type="button"
              >
                <span />
              </button>
            ))}
          </nav>

          <div className="journey-control-main">
            <NarrationPlayer
              audioRef={audioRef}
              audioEnabled={audioEnabled}
              key={`narration-${stages[activeStage].id}`}
              onToggleAudio={() => setAudioEnabled((value) => !value)}
              onVolumeChange={setVolume}
              track={narrationTracks[stages[activeStage].id]}
              volume={volume}
            />
          </div>
        </div>
      ) : null}

      <footer className="journey-meta-footer">
        <p>{data.profile.name}</p>
        <address className="journey-meta-contact">
          <a href={`mailto:${data.profile.email}`}>{data.profile.email}</a>
          <a href={`tel:${data.profile.phoneHref}`}>{data.profile.phone}</a>
        </address>
        <nav aria-label="Résumé download">
          <a className="journey-pdf-button" href="/resume" rel="noreferrer" target="_blank">
            <DocumentIcon /> PDF résumé
          </a>
          <button
            aria-label="Load the latest site version"
            className="journey-refresh-button"
            onClick={() => {
              const url = new URL(window.location.href);
              url.searchParams.set("refresh", Date.now().toString(36));
              window.location.replace(url.toString());
            }}
            title="Load the latest site version"
            type="button"
          >
            <RefreshIcon /> <span>Get latest</span>
          </button>
        </nav>
      </footer>
    </div>
  );
}

import "./css/style.css";

import { Inter } from "next/font/google";
import localFont from "next/font/local";

import ContactCard from "@/components/contact-card";
import { getContentCollection } from "@/components/mdx/utils";
import RouteChrome from "@/components/route-chrome";
import Footer from "@/components/ui/footer";
import Header from "@/components/ui/header";

import Theme from "./theme-provider";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
  display: "swap",
});

const aspekta = localFont({
  src: [
    {
      path: "../public/fonts/Aspekta-500.woff2",
      weight: "500",
    },
    {
      path: "../public/fonts/Aspekta-650.woff2",
      weight: "650",
    },
  ],
  variable: "--font-aspekta",
  display: "swap",
});

const profile = getContentCollection("profile")[0];
const siteUrl = new URL(String(profile.metadata.website));

export const metadata = {
  metadataBase: siteUrl,
  title: {
    default: `${String(profile.metadata.name)} | ${String(profile.metadata.role)}`,
    template: `%s | ${String(profile.metadata.name)}`,
  },
  description: profile.content,
  authors: [{ name: String(profile.metadata.name), url: String(profile.metadata.website) }],
  creator: String(profile.metadata.name),
  keywords: [
    "Senior Software Engineer",
    "Platform Engineering",
    "DevOps",
    "Site Reliability Engineering",
    "AWS",
    "Go",
    "Flutter",
    "Cloud Infrastructure",
  ],
  icons: {
    icon: [
      { url: "/favicon/favicon-96x96.png", type: "image/png", sizes: "96x96" },
      { url: "/favicon/favicon.svg", type: "image/svg+xml" },
    ],
    shortcut: "/favicon/favicon.ico",
    apple: [{ url: "/favicon/apple-touch-icon.png", sizes: "180x180" }],
  },
  manifest: "/favicon/site.webmanifest",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  const personStructuredData = {
    "@context": "https://schema.org",
    "@type": "Person",
    name: String(profile.metadata.name),
    url: String(profile.metadata.website),
    email: `mailto:${String(profile.metadata.email)}`,
    telephone: String(profile.metadata.phoneHref),
    jobTitle: String(profile.metadata.role),
    worksFor: { "@type": "Organization", name: "BAAS Software" },
    knowsAbout: [
      "Platform Engineering",
      "DevOps",
      "Site Reliability Engineering",
      "Cloud Infrastructure",
      "Software Architecture",
      "Application Security",
      "Go",
      "Flutter",
      "React",
      "AWS",
      "Docker",
      "Kubernetes",
    ],
  };

  return (
    <html lang="en" suppressHydrationWarning>
      {/* suppressHydrationWarning: https://github.com/vercel/next.js/issues/44343 */}
      <body
        className={`${inter.variable} ${aspekta.variable} font-inter bg-white tracking-tight text-slate-800 antialiased dark:bg-slate-900 dark:text-slate-200`}
      >
        <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(personStructuredData) }} />
        <Theme>
          <RouteChrome sidebar={<ContactCard />} header={<Header />} footer={<Footer />}>
            {children}
          </RouteChrome>
        </Theme>
      </body>
    </html>
  );
}

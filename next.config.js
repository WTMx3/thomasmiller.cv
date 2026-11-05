/** @type {import('next').NextConfig} */
const nextConfig = {
  output: "export",
  images: { unoptimized: true },
  allowedDevOrigins: ["172.25.80.1"],
  // MDX content is loaded at runtime via `next-mdx-remote-client`
  // (see components/mdx), so no MDX webpack/turbopack loader is needed here.
};

module.exports = nextConfig;

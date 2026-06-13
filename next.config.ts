import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  allowedDevOrigins: ['vmgdev.fidaride.com', 'portaldev.fidaride.com', '127.0.0.1', 'localhost'],
  async redirects() {
    return [
      {
        source: '/app/:path*',
        destination: '/:path*',
        permanent: false,
      },
    ];
  },
};

export default nextConfig;

"use client";

import { usePathname } from "next/navigation";
import type { ReactNode } from "react";

export default function RouteChrome({
  children,
  sidebar,
  header,
  footer,
}: {
  children: ReactNode;
  sidebar: ReactNode;
  header: ReactNode;
  footer: ReactNode;
}) {
  const pathname = usePathname();

  if (pathname === "/") {
    return <main className="min-h-screen">{children}</main>;
  }

  return (
    <div className="mx-auto max-w-7xl">
      <div className="flex min-h-screen flex-col lg:flex-row">
        {sidebar}
        <main className="min-w-0 grow overflow-hidden px-6">
          <div className="mx-auto flex h-full w-full max-w-[1072px] flex-col">
            {header}
            {children}
            {footer}
          </div>
        </main>
      </div>
    </div>
  );
}

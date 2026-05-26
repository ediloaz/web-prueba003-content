# content-uploads/

Carpeta versionada en Git con multimedia del sitio (spec §17). Los archivos
referenciados por el contenido viven acá; el script `fetch-content.mjs` del
Repo A los replica al `public/content-uploads/` del Repo A durante el build.

**Convenciones:**

- Tope blando de tamaño por imagen: **500 KB** (configurable en
  `site.config.ts → images.maxUploadSizeKb`).
- Preferir WebP donde sea aceptable.
- Naming sugerido: `<contexto>-<descriptor>-<n>.ext`, p. ej. `service-1.jpg`,
  `post-1.jpg`, `team-1.jpg`.

# boilerplate-content (Repo B)

**Contenido editable** del sitio Next.js de [`boilerplate`](https://github.com/ediloaz/boilerplate)
(Repo A). Este repo es **público** por decisión de arquitectura (ver spec §8.5):
no contiene secretos y todo lo que aquí vive son textos, configuración del CMS y
multimedia.

## Estructura

```
pages/                        # singletons: home.md, about.md, contact.md
settings/                     # site-settings.md (subconjunto editable de site.config.ts)
services/                     # colección — servicios
products/                     # colección — productos (catálogo informativo)
posts/                        # colección — posts del blog
faqs/                         # colección — preguntas frecuentes
testimonials/                 # colección — testimonios de clientes
portfolio/                    # colección — casos/proyectos del portafolio
gallery/                      # colección — imágenes de galería
promotions/                   # colección — promociones activas
authors/                      # colección — autores
public/content-uploads/       # multimedia versionada en Git
admin/config.yml              # esquema de Sveltia (fuente alterna a /admin del Repo A)
.github/workflows/            # vercel-redeploy, storage-report, storage-alert, pr-media-comment, history-cleanup
STORAGE.md                    # informe semanal generado por la Action
```

## Cómo editar

1. **Desde el CMS (recomendado):** abrí `/admin` del sitio del Repo A, autenticate
   con GitHub (la cuenta que la agencia te dio en el onboarding) y editá.
2. **Por PR (avanzado):** cloná este repo, modificá los `.md` y abrí un PR.
   Cuando se mergee a `main`, Vercel reconstruye el sitio automáticamente
   (gracias al workflow `vercel-redeploy.yml`).

## Mantenimiento

- **`STORAGE.md`:** abrí este archivo para ver el tamaño del repo y el top 10
  de archivos pesados (informe semanal — domingos 06:00 UTC).
- **Limpieza de historial:** el workflow `history-cleanup.yml` se corre semanal
  y purga blobs de imágenes huérfanas (las que ya no están en `HEAD` pero pesan
  en `.git/objects`). Ver spec §17.6.
- **Tope blando recomendado:** mantener `public/content-uploads/` por debajo de
  500 MB y el repo total por debajo de 1 GB (spec §17.4).

## Licencia

UNLICENSED — uso interno de la agencia.

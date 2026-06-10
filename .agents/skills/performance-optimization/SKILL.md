---
name: Performance Optimization
category: Web Performance
description: Optimize ALSO site speed. Minimize bundles, lazy load images, compress assets, reduce CSS/JS bloat. Target Lighthouse score >90, FCP <1.5s, LCP <2.5s.
version: 1.0
---

# Performance Optimization Skill

Accelerate ALSO site. Kill bloat, boost load speed.

## When to invoke

- Page slow on mobile/slow network
- Lighthouse score <85
- Hero/critical content load >2s
- User complains about lag, animations stutter
- Before production deploy

## What this does

Audit site performance bottlenecks. Identify heavy resources, unused code, rendering blocks. Propose concrete fixes.

## Steps

### 1. Run Lighthouse audit
```powershell
# VS Code Inspect (DevTools → Lighthouse tab)
# Or npm global:
npm install -g lighthouse
lighthouse https://your-site --view
```

Check metrics:
- **FCP** (First Contentful Paint) — target <1.5s
- **LCP** (Largest Contentful Paint) — target <2.5s
- **CLS** (Cumulative Layout Shift) — target <0.1
- **TBT** (Total Blocking Time) — target <300ms

### 2. Identify heavy assets
- Uncompressed images (JPEG >200KB, PNG >100KB)
- Unused CSS/JS
- Synchronous scripts blocking render
- Large font files

### 3. Optimization checklist

**Images:**
- [ ] Convert to WebP format (Safari fallback JPEG)
- [ ] Add `srcset` for responsive sizes
- [ ] Lazy load via `loading="lazy"`
- [ ] Compress with imagemin/TinyPNG
- [ ] Use modern formats (AVIF for heroes)

**CSS:**
- [ ] Minify (remove comments, spaces)
- [ ] Defer non-critical styles (e.g., modal CSS)
- [ ] Remove unused rules (PurgeCSS)
- [ ] Inline critical CSS (<14KB) in `<head>`

**JavaScript:**
- [ ] Defer non-essential scripts (`defer` attribute)
- [ ] Code split large bundles
- [ ] Remove console.log, debugger statements
- [ ] Tree-shake unused functions

**Rendering:**
- [ ] Remove heavy backdrop-filter on mobile (costly blur)
- [ ] Batch animations, avoid forced reflows
- [ ] Use `will-change` sparingly (GPU hint)
- [ ] Preload critical fonts

### 4. Implement fixes
Edit `index.html` and `css/styles.css` per recommendations above.

### 5. Re-audit
Run Lighthouse again. Target: FCP <1.5s, LCP <2.5s, score >90.

## Example: Image optimization ALSO site

Current: `backup-images-q65-20260514-152430/images/tools.jpg` (500KB JPEG)

Fix:
```html
<!-- Before -->
<img src="images/tools.jpg" alt="...">

<!-- After: WebP + responsive -->
<img 
  srcset="images/tools-small.webp 480w, images/tools-large.webp 1200w"
  loading="lazy"
  alt="Strumenti di facilitazione"
  width="1200" height="750"
>
```

Use ImageMagick or online tool:
```powershell
magick convert tools.jpg -resize 1200x -quality 85 tools-large.webp
```

## Metrics tracking

| Metric | Before | Target | Status |
|--------|--------|--------|--------|
| FCP | ??? | <1.5s | — |
| LCP | ??? | <2.5s | — |
| CLS | ??? | <0.1 | — |
| Size (MB) | ??? | <2 | — |
| Lighthouse | ??? | >90 | — |

## Tools

- **Lighthouse** — Built in DevTools
- **WebPageTest** — webpagetest.org
- **GTmetrix** — gtmetrix.com
- **ImageOptim** / **TinyPNG** — image compression
- **PurgeCSS** — remove unused CSS
- **Webpack Bundle Analyzer** — if using bundler

## Notes

Caveman on. Keep going until metrics hit target. Iterate, measure, fix.

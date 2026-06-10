---
name: SEO Optimization
category: SEO & Discovery
description: Optimize ALSO site for search. Meta tags, semantic HTML, schema markup, sitemap, structured data. Improve SERP ranking, click-through rate, organic visibility.
version: 1.0
---

# SEO Optimization Skill

Boost ALSO in search. Meta tags, structured data, sitemap, backlinks, keywords. Top search results.

## When to invoke

- Site new or relaunch
- Want organic traffic growth
- Competitors rank higher
- Poor CTR in search results
- Localization needed (Italy-focused)

## What this does

Audit SEO gaps. Add meta, schema.org markup, sitemap, OG tags. Improve on-page, technical SEO. Higher SERP rank.

## Steps

### 1. Keyword research

ALSO targets:
- "Workshop facilitazione agile"
- "Team building esperienziale"
- "Agile coaching Italia"
- "Workshop innovazione aziendale"
- "Metodologie design thinking"

Use:
- Google Keyword Planner (free with Google Ads)
- Ubersuggest, SEMrush (freemium)
- Answer the Public — answerthePublic.com (trending questions)

### 2. On-page SEO

**Meta tags (head section):**

Current state:
```html
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ALSO | Agile Lab for Sensemaking & Outcomes</title>
<meta name="description" content="ALSO, Agile Lab for Sensemaking & Outcomes...">
```

✓ Title: Good (brand + keyword)
✓ Description: Good (compelling, <160 char)

**Add:**
```html
<!-- Open Graph (social share) -->
<meta property="og:title" content="ALSO | Agile Lab for Sensemaking & Outcomes">
<meta property="og:description" content="Workshop esperienziali e facilitazione per team e organizzazioni. 9 facilitatori, metodologie innovative.">
<meta property="og:type" content="website">
<meta property="og:url" content="https://also-agile-lab.com">
<meta property="og:image" content="https://also-agile-lab.com/images/hero-og.jpg">

<!-- Twitter Card -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="ALSO | Agile Lab">
<meta name="twitter:description" content="Workshop esperienziali...">
<meta name="twitter:image" content="...">

<!-- Canonical (prevent duplicate content) -->
<link rel="canonical" href="https://also-agile-lab.com">

<!-- Language hreflang -->
<link rel="alternate" hreflang="it" href="https://also-agile-lab.com">

<!-- Favicon -->
<link rel="icon" type="image/png" href="favicon.png">
```

### 3. Semantic HTML structure

Current:
```html
<h1>Facilitiamo i momenti che contano davvero.</h1>
<section id="value">...</section>
<section id="metodi">...</section>
```

✓ Good heading hierarchy
✓ Semantic `<section>`, `<article>`, `<header>`, `<nav>`

Verify:
- [ ] One `<h1>` per page (hero title)
- [ ] Heading hierarchy h1 → h2 → h3 (no skips)
- [ ] Content within proper semantic tags
- [ ] `<main>` wraps all page content

### 4. Schema.org structured data

Add JSON-LD markup in `<head>`:

```html
<!-- Organization schema -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "ALSO - Agile Lab for Sensemaking & Outcomes",
  "url": "https://also-agile-lab.com",
  "logo": "https://also-agile-lab.com/logo.png",
  "description": "Workshop esperienziali di facilitazione agile",
  "sameAs": [
    "https://linkedin.com/company/...",
    "https://twitter.com/..."
  ],
  "contactPoint": {
    "@type": "ContactPoint",
    "contactType": "Customer Service",
    "email": "contact@also-agile-lab.com"
  }
}
</script>

<!-- LocalBusiness schema (if Milan/Italy based) -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "ALSO Agile Lab",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "...",
    "addressLocality": "Milano",
    "addressCountry": "IT"
  },
  "telephone": "+39...",
  "priceRange": "€€€",
  "knowsAbout": ["Agile coaching", "Team building", "Facilitation"]
}
</script>

<!-- Service schema (for each workshop) -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Service",
  "name": "Team Building Workshop",
  "description": "Workshop esperienziale di team building...",
  "provider": {
    "@type": "Organization",
    "name": "ALSO"
  },
  "areaServed": "IT",
  "availableLanguage": "it",
  "priceRange": "€€€"
}
</script>
```

Test at: schema.org/validator or Google Rich Results Test

### 5. Technical SEO

**Sitemap:**
Create `sitemap.xml`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://also-agile-lab.com/</loc>
    <lastmod>2026-05-15</lastmod>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://also-agile-lab.com/indexfull.html</loc>
    <lastmod>2026-05-15</lastmod>
    <priority>0.8</priority>
  </url>
</urlset>
```

Place in root `/sitemap.xml`. Add to robots.txt:
```
User-agent: *
Allow: /
Sitemap: https://also-agile-lab.com/sitemap.xml
```

**Robots.txt:**
```
User-agent: *
Allow: /
Disallow: /admin
Disallow: /backup-images-q65-20260514-152430/

Sitemap: https://also-agile-lab.com/sitemap.xml
```

**URL structure:**
- ✓ Clean, readable: `also-agile-lab.com`
- ✓ No unnecessary params
- ✓ Mobile-friendly (responsive design)

**Page speed:**
- Already covered in Performance Optimization skill
- Google PageSpeed ≥85 for SEO ranking bump

### 6. Content optimization

Each section needs:
- **Primary keyword** in h2 title
- **Secondary keywords** naturally sprinkled (2-3%)
- **Internal links** to relevant sections
- **Descriptive image alt text** (keyword-rich)

Example:
```html
<!-- Before -->
<h2>Non intratteniamo il gruppo. Rendiamo il confronto utile.</h2>

<!-- After (SEO boost) -->
<h2>Workshop di facilitazione agile: come rendiamo il confronto utile</h2>
<img alt="Workshop facilitazione agile con team LEGO Serious Play" src="...">
```

### 7. Backlinks & local SEO

- [ ] List on Google Business Profile
- [ ] Get backlinks from Accenture site
- [ ] Publish content (blog posts on agile, facilitation)
- [ ] Submit to Italian directories (PagineGialle, LinkedIn)
- [ ] Press release on workshops

### 8. Monitor SEO

**Google Search Console:**
1. Verify site ownership
2. Submit sitemap
3. Monitor impressions, clicks, CTR
4. Fix crawl errors

**Google Analytics:**
- Track organic traffic
- Avg. session duration
- Conversion rate (booking rate)

**Tools:**
- SEMrush, Ahrefs — competitive analysis
- Screaming Frog — crawl audit
- Ubersuggest — keyword rank tracking

## Checklist

- [ ] Meta title, description, OG tags
- [ ] Schema.org JSON-LD (Organization, Service, LocalBusiness)
- [ ] Sitemap.xml created + robots.txt
- [ ] Internal links optimized
- [ ] Image alt text keyword-rich
- [ ] Heading hierarchy clean
- [ ] Mobile-friendly (responsive)
- [ ] Page speed >85
- [ ] Google Search Console connected
- [ ] Backlinks initiated
- [ ] Local business profile updated

## Expected results

| Metric | Before | Target |
|--------|--------|--------|
| Organic traffic | 0 | +50/month (3mo) |
| Keyword rank | N/A | Top 3 for primary keywords |
| SERP CTR | N/A | >5% |
| Domain authority | N/A | 30+ (6mo) |

## Tools

- **Google Search Console** — free
- **Google Analytics 4** — free
- **schema.org validator** — free
- **SEMrush** / **Ahrefs** — freemium
- **Ubersuggest** — freemium

## Notes

SEO = long game. 3-6 months for traction. Consistency wins.

Caveman on. Optimize, monitor, iterate.

---
name: Accessibility Audit (a11y)
category: Web Accessibility
description: Audit ALSO site for WCAG 2.1 AA compliance. Check contrast, keyboard nav, ARIA labels, semantic HTML, screen reader support. Ensure inclusive UX.
version: 1.0
---

# Accessibility Audit Skill

Make ALSO site accessible. Keyboard nav, screen readers, color contrast, semantic HTML. WCAG 2.1 AA standard.

## When to invoke

- Compliance requirement (legal, client mandate)
- Before public launch
- User reports screen reader issues
- Keyboard-only user feedback
- Contrast too low, hard to read
- Modal/dialog lacks focus trap

## What this does

Scan HTML/CSS for a11y gaps. Test keyboard nav, color contrast, ARIA completeness. Provide fixes.

## Steps

### 1. Run automated scan

Use axe DevTools or WAVE:
```
1. Open site in browser
2. Axe DevTools extension → Scan page
3. Review errors, warnings, best practices
```

Or Lighthouse audit (DevTools → Accessibility tab).

### 2. Check key areas

**Contrast:**
- [ ] Text on background ≥4.5:1 (normal text)
- [ ] Text on background ≥3:1 (large text 18pt+)
- [ ] Icons, buttons have sufficient contrast
- Check: Contrast Checker tool or browser inspector

**Keyboard Navigation:**
- [ ] All interactive elements reachable via Tab
- [ ] Focus visible (outline or highlight on focused element)
- [ ] Logical tab order (left→right, top→bottom)
- [ ] No keyboard trap (can escape via Esc/Tab)
- [ ] Modal has focus trap (Tab cycles within modal only)

**Semantic HTML:**
- [ ] Proper heading hierarchy (h1 → h2 → h3, no skips)
- [ ] `<button>` for buttons, not `<div>` with click
- [ ] `<nav>`, `<main>`, `<section>`, `<article>` tags used
- [ ] Form inputs have `<label>` associated via `for`
- [ ] Lists use `<ul>/<ol>/<li>`, not `<div>` styled as list

**ARIA labels:**
- [ ] Icon-only buttons have `aria-label` ("Chiudi", "Menu")
- [ ] Links have descriptive text (not "Click here")
- [ ] Modal has `role="dialog"`, `aria-modal="true"`, `aria-labelledby`
- [ ] Live regions use `aria-live` (updates, alerts)
- [ ] Form errors linked to input via `aria-describedby`

**Images:**
- [ ] All `<img>` have meaningful `alt` text (or `alt=""` if decorative + `aria-hidden="true"`)
- [ ] Complex images (charts, diagrams) have long description
- [ ] SVG icons have `role="img"` + `aria-label` if standalone

**Screen reader:**
- [ ] Test with NVDA (Windows free) or VoiceOver (Mac)
- [ ] Read page top-to-bottom sensibly
- [ ] No missing context or hidden elements announced
- [ ] Form labels read before inputs

### 3. ALSO site specific fixes

Current issues to check:

**Modal dialogs** (`template-modal`, `client-modal`):
```html
<!-- Before -->
<dialog class="template-modal">
  ...
</dialog>

<!-- After: Complete a11y -->
<dialog class="template-modal" role="dialog" aria-modal="true" aria-labelledby="modal-title">
  <div class="template-modal__backdrop" data-close-modal></div>
  <div class="template-modal__dialog">
    <h2 id="modal-title">Area Team Development - I template</h2>
    <button aria-label="Chiudi" data-close-modal>&times;</button>
    ...
  </div>
</dialog>
```

**Icon-only buttons:**
```html
<!-- Before -->
<button class="menu-toggle" type="button">&#9776;</button>

<!-- After -->
<button class="menu-toggle" type="button" aria-label="Apri menu" aria-expanded="false" aria-controls="site-menu">
  &#9776;
</button>
```

**Decorative icons:**
```html
<!-- Before -->
<span class="card-icon" aria-hidden="true">
  <svg viewBox="0 0 24 24" fill="none" role="img">
```

<!-- After: Already correct, but ensure role="img" only if meaningful, else remove -->
<span class="card-icon" aria-hidden="true">
  <svg viewBox="0 0 24 24" fill="none" role="presentation">
```

**Focus indicator:**
```css
/* Ensure visible on all interactive elements */
a:focus, button:focus, input:focus {
  outline: 2px solid var(--accent);
  outline-offset: 2px;
}
```

### 4. Check contrast (CSS)

Current palette: `--text: #f0ecfa` on `--bg: #07050e`

Calculate contrast ratio:
```
Text: #f0ecfa (L=95.5)
BG:   #07050e (L=0.2)
Contrast: ~570:1 ✓ (exceeds 4.5:1)
```

Check dimmed text:
```
--text-dim: rgba(240, 236, 250, 0.52) on #07050e
= ~55% opacity
Ratio ≈ 8:1 ✓ Still OK
```

But verify at actual zoom/brightness levels.

### 5. Test with screen reader

**NVDA (Windows):**
```powershell
# Download NVDA: nvaccess.org
# Run, load site in Firefox
# Test: keyboard nav, content read order, form labels
```

**VoiceOver (Mac):**
```
Cmd+F5 → VoiceOver on
VO+U → Rotor (web content navigator)
Tab through elements, check announcements
```

### 6. Documentation

Document findings:

| Issue | Component | Severity | Fix |
|-------|-----------|----------|-----|
| Missing modal title ID | `.template-modal` | High | Add `aria-labelledby="id"` |
| Button no aria-label | `.menu-toggle` | High | Add `aria-label="Apri menu"` |
| Low contrast text | `.text-dim` | Medium | Increase opacity or use higher L value |
| Heading skip h1→h3 | Hero section | Medium | Restructure headings h1→h2 |

## WCAG 2.1 Level AA Checklist

- [x] Color contrast ≥4.5:1 (normal)
- [ ] Keyboard accessible (all interactive reachable)
- [ ] Focus visible
- [ ] Semantic HTML
- [ ] ARIA labels complete
- [ ] Alt text on images
- [ ] Form labels + error messages
- [ ] No auto-play media >3s
- [ ] No flashing >3 times/sec
- [ ] No keyboard traps

## Tools

- **axe DevTools** — browser extension, detailed scan
- **WAVE** — wave.webaim.org
- **Lighthouse** (DevTools)
- **NVDA** — free screen reader
- **Contrast Checker** — webaim.org/resources/contrastchecker
- **Keyboard-only testing** — unplug mouse, navigate with Tab/Enter/Esc

## Resources

- WCAG 2.1: w3.org/WAI/WCAG21/quickref
- WebAIM: webaim.org
- MDN a11y: developer.mozilla.org/en-US/docs/Web/Accessibility

## Notes

Accessibility not optional. Legal + ethical + UX win. Test early, test often.

Caveman on. Make it accessible.

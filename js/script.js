const menuToggle = document.querySelector('.menu-toggle');
const siteMenu = document.querySelector('#site-menu');
const revealEls = document.querySelectorAll('.reveal');
const sectionLinks = document.querySelectorAll('[data-section-link]');
const sections = document.querySelectorAll('.scene');

/* ---- Mobile menu toggle ---- */
if (menuToggle && siteMenu) {
    menuToggle.addEventListener('click', () => {
        const isOpen = siteMenu.classList.toggle('is-open');
        menuToggle.setAttribute('aria-expanded', String(isOpen));
    });

    siteMenu.querySelectorAll('a').forEach((link) => {
        link.addEventListener('click', () => {
            siteMenu.classList.remove('is-open');
            menuToggle.setAttribute('aria-expanded', 'false');
        });
    });
}

/* ---- Scroll reveal: sections & reveal elements ---- */
const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
        if (entry.isIntersecting) {
            entry.target.classList.add('is-visible');
            revealObserver.unobserve(entry.target);
        }
    });
}, {
    threshold: 0.14,
});

revealEls.forEach((el) => revealObserver.observe(el));

/* ---- Active nav link highlighting ---- */
const sectionObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
        if (!entry.isIntersecting) return;

        const activeId = entry.target.id;
        sectionLinks.forEach((link) => {
            link.classList.toggle('is-active', link.getAttribute('href') === `#${activeId}`);
        });
    });
}, {
    // Activate when the section crosses the central viewport band,
    // so very tall sections can still become active.
    rootMargin: '-45% 0px -45% 0px',
    threshold: 0,
});

sections.forEach((section) => sectionObserver.observe(section));

/* ---- Template details modals ---- */
const modalOpenButtons = document.querySelectorAll('[data-modal-target]');
const closeModalEls = document.querySelectorAll('[data-close-modal]');
const templateModals = document.querySelectorAll('.template-modal');
const galleryImages = document.querySelectorAll('.client-gallery__item img');
const clientLightbox = document.getElementById('client-lightbox');
const clientLightboxImage = clientLightbox?.querySelector('.client-lightbox__image');
const clientLightboxTitle = clientLightbox?.querySelector('.client-lightbox__title');
const clientLightboxPrev = document.getElementById('client-lightbox-prev');
const clientLightboxNext = document.getElementById('client-lightbox-next');
let currentGalleryImages = [];
let currentGalleryIndex = -1;

const openLightboxAtIndex = (index) => {
    if (!clientLightbox || !clientLightboxImage || !currentGalleryImages.length) return;

    const normalizedIndex = (index + currentGalleryImages.length) % currentGalleryImages.length;
    const image = currentGalleryImages[normalizedIndex];

    currentGalleryIndex = normalizedIndex;
    clientLightboxImage.src = image.currentSrc;
    clientLightboxImage.alt = image.alt;

    if (clientLightboxTitle) {
        clientLightboxTitle.textContent = image.alt || 'Foto workshop';
    }

    closeAllModals();
    clientLightbox.showModal();
    document.body.classList.add('modal-open');
};

const closeAllModals = () => {
    templateModals.forEach((modal) => {
        if (modal.open) modal.close();
    });
    document.body.classList.remove('modal-open');
};

modalOpenButtons.forEach((triggerEl) => {
    triggerEl.addEventListener('click', () => {
        const targetId = triggerEl.dataset.modalTarget;
        const modal = document.getElementById(targetId);
        if (!modal) return;

        closeAllModals();
        modal.showModal();
        document.body.classList.add('modal-open');
    });

    triggerEl.addEventListener('keydown', (event) => {
        const isEnter = event.key === 'Enter';
        const isSpace = event.key === ' ' || event.key === 'Spacebar';
        if (!isEnter && !isSpace) return;

        // Native buttons/links already handle keyboard activation by default.
        if (triggerEl.tagName === 'BUTTON' || triggerEl.tagName === 'A') return;

        event.preventDefault();
        triggerEl.click();
    });
});

closeModalEls.forEach((el) => {
    el.addEventListener('click', closeAllModals);
});

galleryImages.forEach((image) => {
    image.addEventListener('click', () => {
        const gallery = image.closest('.client-gallery');
        if (!gallery) return;

        currentGalleryImages = Array.from(gallery.querySelectorAll('.client-gallery__item img'));
        const imageIndex = currentGalleryImages.indexOf(image);
        openLightboxAtIndex(imageIndex);
    });
});

clientLightboxPrev?.addEventListener('click', () => {
    openLightboxAtIndex(currentGalleryIndex - 1);
});

clientLightboxNext?.addEventListener('click', () => {
    openLightboxAtIndex(currentGalleryIndex + 1);
});

document.addEventListener('keydown', (event) => {
    if (clientLightbox?.open && event.key === 'ArrowLeft') {
        openLightboxAtIndex(currentGalleryIndex - 1);
        return;
    }

    if (clientLightbox?.open && event.key === 'ArrowRight') {
        openLightboxAtIndex(currentGalleryIndex + 1);
        return;
    }

    if (event.key === 'Escape') closeAllModals();
});

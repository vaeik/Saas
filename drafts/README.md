# drafts

Static test content for local development, per AGENTS.md ("Content" section).
Not authored content — these files let the site render before a CMS is connected.

Run:

    aem up --no-open --html-folder drafts --html-mount /

then open http://localhost:3000/

- `index.plain.html` — homepage (hero, cards, columns, buttons)
- `nav.plain.html`   — header fragment (3 sections: brand / sections / tools)
- `footer.plain.html`— footer fragment

`.plain.html` files are wrapped by the AEM CLI into a full document using `head.html`.

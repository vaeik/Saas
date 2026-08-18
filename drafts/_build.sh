#!/bin/bash
# Generates local demo content for development (see AGENTS.md > Key Concepts > Content).
# Run from repo root:  aem up --no-open --html-folder drafts --html-mount /
set -e
cd "$(dirname "$0")"
mkdir -p images products/women

shoe='<path d="M18,148 C44,126 66,136 96,124 L138,96 C160,84 178,90 190,108 L214,146 C220,157 214,168 202,168 L34,168 C20,168 12,158 18,148 Z" fill="rgba(255,255,255,.93)"/><path d="M44,152 C74,142 112,133 152,121" stroke="rgba(0,0,0,.18)" stroke-width="6" fill="none" stroke-linecap="round"/><circle cx="196" cy="140" r="7" fill="rgba(0,0,0,.15)"/>'

tile() {
  cat > "images/$1.svg" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 225" width="300" height="225">
<defs><linearGradient id="g" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="$2"/><stop offset="1" stop-color="$3"/></linearGradient></defs>
<rect width="300" height="225" fill="url(#g)"/>
<g transform="translate(28,14)">$shoe</g>
<text x="150" y="208" font-family="Helvetica,Arial,sans-serif" font-size="14" font-weight="700" fill="rgba(255,255,255,.95)" text-anchor="middle">$4</text>
</svg>
SVG
}

banner() {
  cat > "images/$1.svg" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1600 600" width="1600" height="600" preserveAspectRatio="none">
<defs><linearGradient id="g" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="$2"/><stop offset="1" stop-color="$3"/></linearGradient></defs>
<rect width="1600" height="600" fill="url(#g)"/>
</svg>
SVG
}

banner hero-home     '#262626' '#ff6200'
banner hero-products '#1f2937' '#e2571f'
banner hero-women    '#3b1f4e' '#e0518a'
banner hero-men      '#12283a' '#2f7fbf'
banner hero-kids     '#134e33' '#7bc24a'
banner hero-stores   '#2b2b2b' '#8a6a3a'
banner hero-about    '#1c1c1c' '#5a5a5a'

tile p-trail  '#1f3a5f' '#4f8fd6' 'Trail'
tile p-city   '#3d3d3d' '#8f8f8f' 'City'
tile p-court  '#123' '#2f8f6f' 'Court'
tile p-loafer '#4a2b1a' '#b07b4f' 'Loafer'
tile p-boot   '#232323' '#6b4a2f' 'Boot'
tile p-sandal '#1d4d4d' '#4fbfae' 'Sandal'
tile p-kids1  '#5a1f6b' '#c46fd6' 'Play'
tile p-kids2  '#1f5a4a' '#6fd6a8' 'School'
tile p-kids3  '#5a3a1f' '#d6a86f' 'First'
tile cat-women '#3b1f4e' '#e0518a' 'Women'
tile cat-men   '#12283a' '#2f7fbf' 'Men'
tile cat-kids  '#134e33' '#7bc24a' 'Kids'

hero() { printf '<div>\n  <div class="hero">\n    <div>\n      <div>\n        <picture><img src="/images/%s.svg" alt=""></picture>\n        <h1>%s</h1>\n      </div>\n    </div>\n  </div>\n</div>\n' "$1" "$2"; }

prod() { printf '      <div>\n        <picture><img src="/images/%s.svg" alt="%s"></picture>\n        <h3>%s</h3>\n        <p>%s</p>\n        <p><strong><a href="%s">View product</a></strong></p>\n      </div>\n' "$1" "$2" "$2" "$3" "$4"; }

# ---------- home ----------
{
hero hero-home 'Shoes for every step'
cat <<'HTML'
<div>
  <h2>New season, new arrivals</h2>
  <p>This is a fully working local demo of the Edge Delivery Services storefront. Every link in the navigation and footer resolves to a real page served from the <code>drafts</code> folder.</p>
  <p><strong><a href="/products">Shop all products</a></strong> <em><a href="/stores">Find a store</a></em></p>
</div>
<div>
  <h2>Featured</h2>
  <div class="columns">
    <div>
HTML
prod p-trail  'Trail Runner GTX' 'EUR 139.00' '/products/women/trail-runner'
prod p-city   'City Walker'      'EUR 99.00'  '/products/women'
prod p-court  'Court Classic'    'EUR 89.00'  '/products/men'
cat <<'HTML'
    </div>
  </div>
</div>
<div>
  <h2>Shop by category</h2>
  <div class="columns">
    <div>
HTML
prod cat-women 'Women' '38 styles' '/products/women'
prod cat-men   'Men'   '31 styles' '/products/men'
prod cat-kids  'Kids'  '22 styles' '/products/kids'
cat <<'HTML'
    </div>
  </div>
</div>
<div>
  <h2>Why shop with us</h2>
  <div class="cards">
    <div><div><h3>Free delivery</h3><p>On all orders over EUR 50 across Estonia, Latvia and Lithuania.</p></div></div>
    <div><div><h3>60-day returns</h3><p>Return in store or by parcel machine, no questions asked.</p></div></div>
    <div><div><h3>Pickup points</h3><p>Omniva, Venipak and DPD parcel machines at checkout.</p></div></div>
    <div><div><h3>Pay in parts</h3><p>Hire purchase available with Inbank and Esto.</p></div></div>
  </div>
</div>
HTML
} > index.plain.html

# ---------- products (PLP) ----------
{
hero hero-products 'All products'
cat <<'HTML'
<div>
  <p>91 styles. This page stands in for a product listing page. On Adobe Commerce as a Cloud Service this grid would be rendered by the product-list drop-in reading from Catalog Service and Live Search.</p>
</div>
<div>
  <div class="columns">
    <div>
HTML
prod p-trail  'Trail Runner GTX' 'EUR 139.00' '/products/women/trail-runner'
prod p-city   'City Walker'      'EUR 99.00'  '/products/women'
prod p-court  'Court Classic'    'EUR 89.00'  '/products/men'
cat <<'HTML'
    </div>
    <div>
HTML
prod p-loafer 'Suede Loafer'  'EUR 119.00' '/products/men'
prod p-boot   'Winter Boot'   'EUR 159.00' '/products/men'
prod p-sandal 'Summer Sandal' 'EUR 69.00'  '/products/women'
cat <<'HTML'
    </div>
  </div>
</div>
<div>
  <h2>Browse by category</h2>
  <div class="cards">
    <div><div><h3><a href="/products/women">Women</a></h3><p>38 styles</p></div></div>
    <div><div><h3><a href="/products/men">Men</a></h3><p>31 styles</p></div></div>
    <div><div><h3><a href="/products/kids">Kids</a></h3><p>22 styles</p></div></div>
  </div>
</div>
HTML
} > products.plain.html

# ---------- category pages ----------
{
hero hero-women 'Women'
cat <<'HTML'
<div>
  <p>38 styles for women. Sizes 36 to 42.</p>
</div>
<div>
  <div class="columns">
    <div>
HTML
prod p-trail  'Trail Runner GTX' 'EUR 139.00' '/products/women/trail-runner'
prod p-city   'City Walker'      'EUR 99.00'  '/products/women/trail-runner'
prod p-sandal 'Summer Sandal'    'EUR 69.00'  '/products/women/trail-runner'
cat <<'HTML'
    </div>
  </div>
</div>
HTML
} > products/women.plain.html

{
hero hero-men 'Men'
cat <<'HTML'
<div>
  <p>31 styles for men. Sizes 40 to 47.</p>
</div>
<div>
  <div class="columns">
    <div>
HTML
prod p-court  'Court Classic' 'EUR 89.00'  '/products/women/trail-runner'
prod p-loafer 'Suede Loafer'  'EUR 119.00' '/products/women/trail-runner'
prod p-boot   'Winter Boot'   'EUR 159.00' '/products/women/trail-runner'
cat <<'HTML'
    </div>
  </div>
</div>
HTML
} > products/men.plain.html

{
hero hero-kids 'Kids'
cat <<'HTML'
<div>
  <p>22 styles for kids. Sizes 20 to 35.</p>
</div>
<div>
  <div class="columns">
    <div>
HTML
prod p-kids1 'Playground Sneaker' 'EUR 49.00' '/products/women/trail-runner'
prod p-kids2 'School Shoe'        'EUR 59.00' '/products/women/trail-runner'
prod p-kids3 'First Steps'        'EUR 39.00' '/products/women/trail-runner'
cat <<'HTML'
    </div>
  </div>
</div>
HTML
} > products/kids.plain.html

# ---------- product detail ----------
cat > products/women/trail-runner.plain.html <<'HTML'
<div>
  <p><a href="/products">All products</a> | <a href="/products/women">Women</a></p>
  <div class="columns">
    <div>
      <div>
        <picture><img src="/images/p-trail.svg" alt="Trail Runner GTX"></picture>
      </div>
      <div>
        <h1>Trail Runner GTX</h1>
        <p>EUR 139.00</p>
        <p>Waterproof trail running shoe with a grippy outsole and a breathable membrane. Built for wet Baltic autumns.</p>
        <p>Colour: Blue | Sizes: 36, 37, 38, 39, 40, 41, 42</p>
        <p><strong><a href="/products">Add to cart</a></strong> <em><a href="/stores">Check store stock</a></em></p>
        <p>Free delivery over EUR 50. 60-day returns.</p>
      </div>
    </div>
  </div>
</div>
<div>
  <h2>Details</h2>
  <div class="cards">
    <div><div><h3>Upper</h3><p>Recycled mesh with waterproof membrane.</p></div></div>
    <div><div><h3>Midsole</h3><p>EVA foam, 8 mm drop.</p></div></div>
    <div><div><h3>Outsole</h3><p>4 mm lugs, rubber compound.</p></div></div>
    <div><div><h3>Weight</h3><p>268 g in size 38.</p></div></div>
  </div>
</div>
HTML

# ---------- stores ----------
{
hero hero-stores 'Our stores'
cat <<'HTML'
<div>
  <p>Twelve stores across the Baltics. Reserve online, try on in store.</p>
</div>
<div>
  <div class="cards">
    <div><div><h3>Tallinn, Ulemiste</h3><p>Suur-Sojamae 4<br>Mon-Sun 10:00-21:00</p></div></div>
    <div><div><h3>Tallinn, Kristiine</h3><p>Endla 45<br>Mon-Sun 10:00-21:00</p></div></div>
    <div><div><h3>Riga, Alfa</h3><p>Brivibas gatve 372<br>Mon-Sun 10:00-22:00</p></div></div>
    <div><div><h3>Riga, Spice</h3><p>Lielirbes 29<br>Mon-Sun 10:00-21:00</p></div></div>
    <div><div><h3>Vilnius, Akropolis</h3><p>Ozo 25<br>Mon-Sun 10:00-22:00</p></div></div>
    <div><div><h3>Kaunas, Mega</h3><p>Islandijos pl. 32<br>Mon-Sun 10:00-21:00</p></div></div>
  </div>
</div>
HTML
} > stores.plain.html

# ---------- about ----------
{
hero hero-about 'About us'
cat <<'HTML'
<div>
  <div class="columns">
    <div>
      <div>
        <h2>Our story</h2>
        <p>We have been fitting shoes in the Baltics since 1996, from a single store in Tallinn to twelve stores and an online shop serving Estonia, Latvia and Lithuania.</p>
      </div>
      <div>
        <h2>How we work</h2>
        <p>We stock brands we would wear ourselves, we keep stock visible per store, and we take returns without an argument.</p>
      </div>
    </div>
  </div>
</div>
<div>
  <h2>By the numbers</h2>
  <div class="cards">
    <div><div><h3>1996</h3><p>Founded in Tallinn.</p></div></div>
    <div><div><h3>12</h3><p>Stores across three countries.</p></div></div>
    <div><div><h3>91</h3><p>Styles online this season.</p></div></div>
    <div><div><h3>3</h3><p>Languages: ET, LV, LT.</p></div></div>
  </div>
</div>
HTML
} > about.plain.html

# ---------- simple pages ----------
cat > search.plain.html <<'HTML'
<div>
  <h1>Search</h1>
  <p>On Adobe Commerce as a Cloud Service this page is served by Live Search, with facets for size, colour, brand and gender.</p>
  <p>Popular searches: <a href="/products/women">women running</a>, <a href="/products/men">men boots</a>, <a href="/products/kids">kids sneakers</a>.</p>
</div>
HTML

cat > contact.plain.html <<'HTML'
<div>
  <h1>Contact</h1>
  <p>Customer service, Monday to Friday 09:00-17:00 EET.</p>
  <p>Email: info@example.com<br>Phone: +372 000 0000</p>
  <p><strong><a href="/stores">Visit a store instead</a></strong></p>
</div>
HTML

cat > privacy.plain.html <<'HTML'
<div>
  <h1>Privacy policy</h1>
  <p>Placeholder page for the local demo. Explains what data is collected, why, and how long it is kept.</p>
  <p><a href="/">Back to home</a></p>
</div>
HTML

cat > terms.plain.html <<'HTML'
<div>
  <h1>Terms and conditions</h1>
  <p>Placeholder page for the local demo. Covers ordering, delivery, returns and warranty.</p>
  <p><a href="/">Back to home</a></p>
</div>
HTML

# ---------- nav + footer ----------
cat > nav.plain.html <<'HTML'
<div>
  <p><a href="/">Weekend SaaS</a></p>
</div>
<div>
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/products">Products</a>
      <ul>
        <li><a href="/products/women">Women</a></li>
        <li><a href="/products/men">Men</a></li>
        <li><a href="/products/kids">Kids</a></li>
      </ul>
    </li>
    <li><a href="/stores">Stores</a></li>
    <li><a href="/about">About</a></li>
  </ul>
</div>
<div>
  <p><a href="/search">Search</a></p>
</div>
HTML

cat > footer.plain.html <<'HTML'
<div>
  <p>Weekend Shoes - Adobe Commerce as a Cloud Service evaluation sandbox (EVO-217)</p>
  <p><a href="/privacy">Privacy</a> | <a href="/terms">Terms</a> | <a href="/contact">Contact</a></p>
</div>
HTML
echo "generated:"; ls -1 *.plain.html products/*.plain.html products/women/*.plain.html | sed 's/^/  /'; echo "images: $(ls images | wc -l)"

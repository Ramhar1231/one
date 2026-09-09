<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>NexusShop — Simple Store</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">
<style>
/* ========== DESIGN TOKENS ========== */
:root{
  --bg:#f5f6fa; --card:#ffffff; --text:#1f2430; --muted:#6b7280; --line:#e5e7eb;
  --primary:#4f46e5; --primary-dark:#4338ca; --primary-soft:#eef2ff;
  --accent:#f59e0b; --good:#10b981; --bad:#ef4444;
  --r:14px; --sh:0 6px 24px rgba(31,36,48,.07); --sh-h:0 14px 40px rgba(31,36,48,.12);
  --tr:.25s ease;
}
*{box-sizing:border-box;margin:0;padding:0}
html{scroll-behavior:smooth}
body{font-family:'Inter',system-ui,-apple-system,sans-serif;background:var(--bg);color:var(--text);line-height:1.5;-webkit-font-smoothing:antialiased}
img{display:block;max-width:100%}
a{color:inherit;text-decoration:none}
button{font-family:inherit;border:none;background:none;cursor:pointer;color:inherit}
input{font-family:inherit;outline:none}
.wrap{max-width:1180px;margin:0 auto;padding:0 20px}

/* ========== BUTTONS ========== */
.btn{display:inline-flex;align-items:center;justify-content:center;gap:8px;padding:11px 22px;border-radius:999px;font-weight:600;font-size:14px;transition:var(--tr)}
.btn-primary{background:var(--primary);color:#fff}
.btn-primary:hover{background:var(--primary-dark);transform:translateY(-2px);box-shadow:0 8px 20px rgba(79,70,229,.35)}
.btn-light{background:#fff;color:var(--primary)}
.btn-light:hover{transform:translateY(-2px);box-shadow:0 8px 20px rgba(255,255,255,.25)}

/* ========== HEADER ========== */
header{position:sticky;top:0;z-index:50;background:rgba(255,255,255,.92);backdrop-filter:blur(12px);-webkit-backdrop-filter:blur(12px);border-bottom:1px solid var(--line)}
.h-in{display:flex;align-items:center;gap:14px;min-height:64px}
.brand{display:flex;align-items:center;gap:8px;font-weight:800;font-size:20px;flex-shrink:0}
.brand i{color:var(--primary);font-size:22px}
.brand .acc{color:var(--primary)}
nav.desktop{display:flex;gap:2px;margin-left:6px}
nav.desktop a{padding:8px 14px;border-radius:10px;font-size:14px;font-weight:500;color:var(--muted);transition:var(--tr)}
nav.desktop a:hover,nav.desktop a.active{background:var(--primary-soft);color:var(--primary)}
.h-right{display:flex;align-items:center;gap:10px;margin-left:auto}
.search{display:flex;align-items:center;gap:8px;background:var(--bg);border:2px solid transparent;border-radius:999px;padding:0 6px 0 14px;min-width:200px;transition:var(--tr)}
.search:focus-within{border-color:var(--primary);background:#fff;box-shadow:0 0 0 4px rgba(79,70,229,.1)}
.search input{border:0;background:none;width:100%;padding:9px 0;font-size:14px;color:var(--text)}
.search button{padding:8px;color:var(--muted);transition:var(--tr)}
.search button:hover{color:var(--primary)}
.icon-btn{width:40px;height:40px;border-radius:50%;display:grid;place-items:center;font-size:16px;color:var(--muted);position:relative;transition:var(--tr)}
.icon-btn:hover{background:var(--bg);color:var(--primary)}
.cart-count{position:absolute;top:-2px;right:-2px;background:var(--primary);color:#fff;font-size:11px;font-weight:700;width:19px;height:19px;border-radius:50%;display:grid;place-items:center;border:2px solid #fff;transition:var(--tr)}
#menuBtn{display:none;width:40px;height:40px;border-radius:50%;background:var(--bg);font-size:17px;color:var(--text)}
#mobileNav{display:none;padding:10px 20px 16px;border-top:1px solid var(--line);background:#fff}
#mobileNav a{display:flex;align-items:center;gap:10px;padding:11px 12px;border-radius:10px;font-weight:500;color:var(--text)}
#mobileNav a:hover{background:var(--bg)}

/* ========== HERO ========== */
.hero{margin:20px auto 0;max-width:1180px;border-radius:20px;padding:54px 48px;background:linear-gradient(135deg,#4f46e5,#7c3aed);color:#fff;position:relative;overflow:hidden}
.hero:after{content:'';position:absolute;right:-90px;top:-90px;width:320px;height:320px;border-radius:50%;background:rgba(255,255,255,.08)}
.hero:before{content:'';position:absolute;left:-60px;bottom:-110px;width:240px;height:240px;border-radius:50%;background:rgba(255,255,255,.05)}
.hero .badge{display:inline-block;background:rgba(255,255,255,.18);padding:5px 14px;border-radius:999px;font-size:13px;font-weight:600;margin-bottom:14px}
.hero h1{font-size:40px;line-height:1.15;margin-bottom:12px;letter-spacing:-.5px}
.hero p{opacity:.85;max-width:460px;margin-bottom:22px;font-size:16px}
.hero .acts{display:flex;gap:10px;flex-wrap:wrap}

/* ========== SECTIONS ========== */
.section{padding:46px 0 10px}
.sec-head{margin-bottom:24px}
.sec-head h2{font-size:25px;letter-spacing:-.3px}
.sec-head p{color:var(--muted);font-size:14px;margin-top:3px}

/* ========== CATEGORIES ========== */
.cat-grid{display:grid;grid-template-columns:repeat(6,1fr);gap:14px}
.cat-card{background:var(--card);border:2px solid transparent;border-radius:var(--r);padding:22px 12px;text-align:center;box-shadow:var(--sh);cursor:pointer;transition:var(--tr)}
.cat-card:hover{transform:translateY(-5px);box-shadow:var(--sh-h);border-color:var(--primary)}
.cat-card .ico{width:52px;height:52px;border-radius:50%;background:var(--primary-soft);color:var(--primary);display:grid;place-items:center;font-size:21px;margin:0 auto 10px;transition:var(--tr)}
.cat-card:hover .ico{background:var(--primary);color:#fff}
.cat-card h4{font-size:14px;font-weight:600}
.cat-card .cnt{font-size:12px;color:var(--muted);margin-top:3px}

/* ========== PRODUCTS ========== */
.prod-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:18px}
.p-card{background:var(--card);border-radius:var(--r);overflow:hidden;box-shadow:var(--sh);transition:var(--tr);display:flex;flex-direction:column;border:2px solid transparent}
.p-card:hover{transform:translateY(-5px);box-shadow:var(--sh-h);border-color:var(--primary)}
.p-card .imgw{position:relative;aspect-ratio:1/1;background:var(--bg);overflow:hidden}
.p-card .imgw img{width:100%;height:100%;object-fit:cover;transition:var(--tr)}
.p-card:hover .imgw img{transform:scale(1.05)}
.badge{position:absolute;top:10px;left:10px;background:var(--primary);color:#fff;padding:3px 10px;border-radius:999px;font-size:11px;font-weight:700}
.badge.sale{background:#f97316}
.wish-btn{position:absolute;top:10px;right:10px;width:34px;height:34px;border-radius:50%;background:rgba(255,255,255,.92);display:grid;place-items:center;font-size:15px;color:var(--muted);transition:var(--tr)}
.wish-btn:hover{color:var(--bad);transform:scale(1.1)}
.wish-btn.active{color:var(--bad)}
.p-card .body{padding:14px 16px 6px;flex:1;display:flex;flex-direction:column;gap:4px}
.p-card .cat-tag{font-size:11px;color:var(--muted);text-transform:uppercase;letter-spacing:.5px;font-weight:600}
.p-card h5{font-size:15px;font-weight:600;line-height:1.3;display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;overflow:hidden}
.price-row{display:flex;align-items:center;gap:8px;margin-top:2px}
.price{font-weight:800;font-size:17px}
.old-price{color:var(--muted);text-decoration:line-through;font-size:13px}
.rating{font-size:13px;color:var(--accent)}
.rating span{color:var(--muted)}
.p-card .foot{padding:10px 16px 16px}
.add-btn{width:100%;padding:10px;border-radius:10px;background:var(--primary);color:#fff;font-weight:600;font-size:14px;display:flex;align-items:center;justify-content:center;gap:8px;transition:var(--tr)}
.add-btn:hover{background:var(--primary-dark)}
.add-btn.added{background:var(--good)}
.empty-msg{grid-column:1/-1;text-align:center;padding:44px;color:var(--muted)}

/* ========== DEAL ========== */
.deal{margin-top:30px;background:var(--card);border-radius:var(--r);overflow:hidden;box-shadow:var(--sh);display:flex}
.deal .d-img{flex:0 0 46%;min-height:280px;background:var(--bg)}
.deal .d-img img{width:100%;height:100%;object-fit:cover}
.deal .d-body{flex:1;padding:36px 40px;display:flex;flex-direction:column;justify-content:center}
.deal .tag{display:inline-block;align-self:flex-start;background:#fff7ed;color:#c2410c;padding:4px 14px;border-radius:999px;font-size:12px;font-weight:700;text-transform:uppercase;letter-spacing:.5px;margin-bottom:10px}
.deal h3{font-size:26px;margin-bottom:6px}
.deal .desc{color:var(--muted);margin-bottom:12px}
.price-big{font-size:30px;font-weight:800}
.price-big .old{font-size:18px;font-weight:400;color:var(--muted);text-decoration:line-through;margin-left:8px}
.stock{font-size:14px;color:var(--muted);margin:4px 0 16px}
.stock strong{color:var(--bad)}
.timer{display:flex;gap:10px;margin-bottom:18px}
.t-box{background:var(--primary);color:#fff;padding:9px 14px;border-radius:10px;min-width:62px;text-align:center}
.t-box .num{font-size:24px;font-weight:700;line-height:1.2}
.t-box .lab{font-size:10px;opacity:.75;text-transform:uppercase;letter-spacing:.5px}

/* ========== TESTIMONIALS ========== */
.test-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:18px}
.test-card{background:var(--card);border-radius:var(--r);padding:22px 24px;box-shadow:var(--sh)}
.test-card .stars{color:var(--accent);font-size:15px;letter-spacing:2px;margin-bottom:10px}
.test-card blockquote{font-size:14px;line-height:1.6;color:var(--text);font-style:italic;margin-bottom:14px}
.test-card .author{display:flex;align-items:center;gap:10px}
.test-card .avatar{width:42px;height:42px;border-radius:50%;object-fit:cover;background:var(--bg)}
.test-card .name{font-weight:600;font-size:14px}
.test-card .role{font-size:12px;color:var(--muted)}

/* ========== NEWSLETTER ========== */
.news{margin:46px 0 40px;background:linear-gradient(135deg,#1f2430,#2d3348);border-radius:var(--r);padding:44px;color:#fff;display:flex;align-items:center;justify-content:space-between;gap:28px;flex-wrap:wrap}
.news h3{font-size:24px;margin-bottom:4px}
.news p{opacity:.75;font-size:14px}
.news form{display:flex;gap:10px;flex:1;max-width:460px;flex-wrap:wrap}
.news input{flex:1;min-width:190px;padding:13px 18px;border-radius:999px;border:0;font-size:14px;background:rgba(255,255,255,.12);color:#fff;transition:var(--tr)}
.news input::placeholder{color:rgba(255,255,255,.5)}
.news input:focus{background:rgba(255,255,255,.2)}
#newsMsg{margin-top:10px;font-size:13px;width:100%;color:#a7f3d0}

/* ========== FOOTER ========== */
footer{border-top:1px solid var(--line);padding:40px 0 24px;background:#fff}
.f-grid{display:grid;grid-template-columns:2fr 1fr 1fr;gap:36px;margin-bottom:28px}
.f-brand{font-weight:800;font-size:19px;margin-bottom:8px}
.f-brand i{color:var(--primary)}
.f-brand .acc{color:var(--primary)}
.f-brand+p{color:var(--muted);font-size:14px;max-width:280px;line-height:1.6}
.socials{display:flex;gap:10px;margin-top:14px}
.socials a{width:38px;height:38px;border-radius:50%;background:var(--bg);display:grid;place-items:center;color:var(--muted);transition:var(--tr)}
.socials a:hover{background:var(--primary);color:#fff}
.f-col h5{font-size:14px;font-weight:700;margin-bottom:12px}
.f-col ul{list-style:none;display:flex;flex-direction:column;gap:6px}
.f-col a{color:var(--muted);font-size:14px;transition:var(--tr)}
.f-col a:hover{color:var(--primary)}
.f-bottom{text-align:center;padding-top:20px;border-top:1px solid var(--line);color:var(--muted);font-size:13px}

/* ========== CART DRAWER ========== */
.overlay{position:fixed;inset:0;background:rgba(15,18,25,.45);opacity:0;pointer-events:none;transition:opacity .25s ease;z-index:90}
.overlay.show{opacity:1;pointer-events:auto}
.cart{position:fixed;top:0;right:0;height:100%;width:380px;max-width:92vw;background:#fff;z-index:100;transform:translateX(105%);transition:transform .3s cubic-bezier(.4,0,.2,1);display:flex;flex-direction:column;box-shadow:-10px 0 40px rgba(0,0,0,.12)}
.cart.open{transform:translateX(0)}
.cart-head{display:flex;align-items:center;justify-content:space-between;padding:18px 22px;border-bottom:1px solid var(--line)}
.cart-head h3{font-size:18px}
#cartItems{flex:1;overflow-y:auto;padding:14px 22px;display:flex;flex-direction:column;gap:12px}
.ci{display:flex;gap:12px;align-items:center;background:var(--bg);border-radius:12px;padding:10px}
.ci img{width:58px;height:58px;border-radius:10px;object-fit:cover}
.ci .info{flex:1;min-width:0}
.ci .info b{font-size:14px;display:block;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.ci .info span{font-size:13px;color:var(--muted)}
.ci .qty{display:flex;align-items:center;gap:8px;margin-top:6px}
.ci .qty button{width:24px;height:24px;border-radius:6px;background:#fff;border:1px solid var(--line);font-size:13px;transition:var(--tr)}
.ci .qty button:hover{background:var(--primary);color:#fff;border-color:var(--primary)}
.ci .rm{color:var(--bad);font-size:15px;padding:8px}
.cart-empty{flex:1;display:grid;place-items:center;color:var(--muted);font-size:14px;text-align:center;padding:0 20px}
.cart-foot{border-top:1px solid var(--line);padding:18px 22px;display:flex;flex-direction:column;gap:12px}
.cart-total{display:flex;justify-content:space-between;font-weight:700;font-size:16px}
#checkoutBtn{width:100%}

/* ========== TOAST ========== */
#toast{position:fixed;left:50%;bottom:26px;transform:translateX(-50%) translateY(80px);background:#1f2430;color:#fff;padding:11px 22px;border-radius:999px;font-size:14px;font-weight:500;opacity:0;transition:all .3s ease;z-index:200;box-shadow:0 10px 30px rgba(0,0,0,.25);pointer-events:none}
#toast.show{opacity:1;transform:translateX(-50%) translateY(0)}

/* ========== RESPONSIVE ========== */
@media(max-width:1100px){
  .cat-grid{grid-template-columns:repeat(3,1fr)}
  .prod-grid{grid-template-columns:repeat(3,1fr)}
  .test-grid{grid-template-columns:repeat(2,1fr)}
}
@media(max-width:900px){
  nav.desktop{display:none}
  #menuBtn{display:grid;place-items:center}
  .deal{flex-direction:column}
  .deal .d-img{flex:0 0 220px}
  .hero{padding:40px 28px}
  .hero h1{font-size:32px}
  .news{padding:30px 26px}
  .f-grid{grid-template-columns:1fr 1fr}
}
@media(max-width:640px){
  .prod-grid{grid-template-columns:repeat(2,1fr);gap:12px}
  .cat-grid{grid-template-columns:repeat(2,1fr);gap:12px}
  .test-grid{grid-template-columns:1fr}
  .f-grid{grid-template-columns:1fr;gap:22px}
  .search{min-width:120px}
  .hero{margin:12px 10px 0;border-radius:14px;padding:32px 22px}
  .hero p{font-size:14px}
  .deal .d-body{padding:24px}
  .t-box{min-width:52px}
}
</style>
</head>
<body>

<!-- ===== HEADER ===== -->
<header>
  <div class="wrap h-in">
    <button id="menuBtn" aria-label="Menu"><i class="fas fa-bars"></i></button>
    <a class="brand" href="#"><i class="fas fa-store-alt"></i> Nexus<span class="acc">Shop</span></a>

    <nav class="desktop" aria-label="Main navigation">
      <a href="#" class="active">Home</a>
      <a href="#categories">Categories</a>
      <a href="#products">Products</a>
      <a href="#deals">Deals</a>
      <a href="#testimonials">Reviews</a>
    </nav>

    <div class="h-right">
      <div class="search">
        <input type="search" id="searchInput" placeholder="Search products..." aria-label="Search" />
        <button id="searchBtn" aria-label="Search"><i class="fas fa-search"></i></button>
      </div>
      <button class="icon-btn" id="cartBtn" aria-label="Open cart" title="Cart"><i class="fas fa-shopping-bag"></i><span class="cart-count" id="cartCount">0</span></button>
    </div>
  </div>

  <div id="mobileNav">
    <a href="#"><i class="fas fa-home"></i> Home</a>
    <a href="#categories"><i class="fas fa-th-large"></i> Categories</a>
    <a href="#products"><i class="fas fa-fire"></i> Products</a>
    <a href="#deals"><i class="fas fa-tag"></i> Deals</a>
    <a href="#testimonials"><i class="fas fa-star"></i> Reviews</a>
  </div>
</header>

<!-- ===== HERO ===== -->
<section class="hero">
  <div class="badge"><i class="fas fa-sparkles"></i> New Collection 2026</div>
  <h1>Discover Premium Essentials</h1>
  <p>Curated fashion, tech &amp; accessories with free shipping on your first order. Limited-time deals await.</p>
  <div class="acts">
    <button class="btn btn-primary" id="shopNow"><i class="fas fa-arrow-right"></i> Shop Now</button>
    <button class="btn btn-light" id="exploreDeals"><i class="fas fa-clock"></i> Explore Deals</button>
  </div>
</section>

<!-- ===== CATEGORIES ===== -->
<section class="section" id="categories">
  <div class="wrap">
    <div class="sec-head">
      <h2>Browse Categories</h2>
      <p>Tap a category to filter products instantly</p>
    </div>
    <div class="cat-grid" id="categoriesGrid"></div>
  </div>
</section>

<!-- ===== PRODUCTS ===== -->
<section class="section" id="products">
  <div class="wrap">
    <div class="sec-head">
      <h2>Trending Now</h2>
      <p>Popular picks from our community</p>
    </div>
    <div class="prod-grid" id="productsGrid"></div>
  </div>
</section>

<!-- ===== DEAL ===== -->
<section class="section" id="deals">
  <div class="wrap">
    <div class="sec-head">
      <h2>Flash Deal</h2>
      <p>Grab it before it's gone — limited stock</p>
    </div>
    <div class="deal">
      <div class="d-img"><img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=80" alt="MacBook Air M2" loading="lazy"></div>
      <div class="d-body">
        <span class="tag"><i class="fas fa-bolt"></i> Limited Offer</span>
        <h3>MacBook Air M2</h3>
        <p class="desc">Thin, light, and incredibly powerful — the M2 chip redefines performance.</p>
        <div><span class="price-big">$999 <span class="old">$1,199</span></span></div>
        <p class="stock">Only <strong>12</strong> items left — hurry!</p>
        <div class="timer">
          <div class="t-box"><div class="num" id="dealDays">0</div><div class="lab">Days</div></div>
          <div class="t-box"><div class="num" id="dealHours">00</div><div class="lab">Hours</div></div>
          <div class="t-box"><div class="num" id="dealMinutes">00</div><div class="lab">Mins</div></div>
          <div class="t-box"><div class="num" id="dealSeconds">00</div><div class="lab">Secs</div></div>
        </div>
        <div style="max-width:220px"><button class="btn btn-primary" id="buyDeal" style="width:100%"><i class="fas fa-cart-plus"></i> Add to Cart</button></div>
      </div>
    </div>
  </div>
</section>

<!-- ===== TESTIMONIALS ===== -->
<section class="section" id="testimonials">
  <div class="wrap">
    <div class="sec-head">
      <h2>What Our Customers Say</h2>
      <p>Real reviews from real people</p>
    </div>
    <div class="test-grid" id="testimonialsList"></div>
  </div>
</section>

<!-- ===== NEWSLETTER ===== -->
<section class="section" style="padding-bottom:0">
  <div class="wrap">
    <div class="news">
      <div>
        <h3>Stay in the Loop</h3>
        <p>Get exclusive offers, early access &amp; new arrivals</p>
      </div>
      <form id="newsletterForm" novalidate>
        <input type="email" id="newsletterEmail" placeholder="Enter your email" aria-label="Email" />
        <button class="btn btn-primary" type="submit"><i class="fas fa-paper-plane"></i> Subscribe</button>
        <div id="newsMsg"></div>
      </form>
    </div>
  </div>
</section>

<!-- ===== FOOTER ===== -->
<footer>
  <div class="wrap">
    <div class="f-grid">
      <div class="f-brand-col">
        <div class="f-brand"><i class="fas fa-store-alt"></i> Nexus<span class="acc">Shop</span></div>
        <p style="color:var(--muted);font-size:14px;max-width:280px;line-height:1.6">Modern e-commerce demo built with care. Quality products, seamless experience.</p>
        <div class="socials">
          <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
          <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
          <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
          <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
        </div>
      </div>
      <div class="f-col">
        <h5>Shop</h5>
        <ul>
          <li><a href="#categories">Categories</a></li>
          <li><a href="#products">Trending</a></li>
          <li><a href="#deals">Deals</a></li>
          <li><a href="#testimonials">Reviews</a></li>
        </ul>
      </div>
      <div class="f-col">
        <h5>Support</h5>
        <ul>
          <li><a href="#">Help Center</a></li>
          <li><a href="#">Shipping</a></li>
          <li><a href="#">Returns</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
      </div>
    </div>
    <div class="f-bottom">&copy; <span id="year"></span> NexusShop. All rights reserved.</div>
  </div>
</footer>

<!-- ===== CART DRAWER ===== -->
<div class="overlay" id="overlay"></div>
<aside class="cart" id="cart" aria-label="Shopping cart">
  <div class="cart-head">
    <h3><i class="fas fa-shopping-bag" style="color:var(--primary)"></i> My Cart</h3>
    <button class="icon-btn" id="closeCart" aria-label="Close cart"><i class="fas fa-times"></i></button>
  </div>
  <div id="cartItems"></div>
  <div class="cart-foot">
    <div class="cart-total"><span>Total</span><span id="cartTotal">$0</span></div>
    <button class="btn btn-primary" id="checkoutBtn"><i class="fas fa-lock"></i> Checkout</button>
  </div>
</aside>

<div id="toast"></div>

<!-- ===== SCRIPT ===== -->
<script>
// ============ DATA ============
const CATEGORIES = [
  { id:'phones',   name:'Smartphones', icon:'fa-mobile-alt',  count:24 },
  { id:'laptops',  name:'Laptops',     icon:'fa-laptop',      count:18 },
  { id:'clothing', name:'Clothing',    icon:'fa-tshirt',      count:42 },
  { id:'gadgets',  name:'Gadgets',     icon:'fa-headphones',  count:31 },
  { id:'footwear', name:'Footwear',    icon:'fa-shoe-prints', count:27 },
  { id:'accessories', name:'Accessories', icon:'fa-watch',    count:39 }
];

const PRODUCTS = [
  { id:1, title:'iPhone 14 Pro Max', price:1099, oldPrice:1199, rating:5, reviews:128, badge:'New',
    img:'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80', category:'Smartphones' },
  { id:2, title:'MacBook Pro 14"', price:1999, rating:4, reviews:86, badge:'',
    img:'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80', category:'Laptops' },
  { id:3, title:'Apple Watch Series 8', price:349, oldPrice:399, rating:5, reviews:214, badge:'Sale',
    img:'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80', category:'Accessories' },
  { id:4, title:'Nike Air Max 270', price:150, rating:4, reviews:53, badge:'',
    img:'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80', category:'Footwear' },
  { id:5, title:'Sony A7 IV Camera', price:2499, rating:5, reviews:42, badge:'New',
    img:'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80', category:'Gadgets' },
  { id:6, title:'Chanel No. 5', price:120, rating:5, reviews:189, badge:'',
    img:'https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80', category:'Accessories' },
  { id:7, title:'Travel Backpack', price:79, oldPrice:99, rating:4, reviews:67, badge:'Sale',
    img:'https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80', category:'Accessories' },
  { id:8, title:'Sony WH-1000XM5', price:399, rating:5, reviews:156, badge:'',
    img:'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80', category:'Gadgets' }
];

// Flash-deal product (shown in the deal banner only)
const DEAL = { id:9, title:'MacBook Air M2', price:999, oldPrice:1199, rating:5, reviews:203, badge:'Sale',
  img:'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=600&q=80', category:'Laptops' };

const TESTIMONIALS = [
  { name:'Ava Martin', role:'Verified Buyer', avatar:'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80', text:'Fast shipping and excellent support. The product exceeded my expectations!', stars:5 },
  { name:'Michael Lee', role:'Frequent Shopper', avatar:'https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80', text:'Great selection and smooth checkout. Will definitely shop again.', stars:4 },
  { name:'Sophia Chen', role:'Designer', avatar:'https://images.unsplash.com/photo-1494790108378-be9c29b29330?auto=format&fit=crop&w=80&q=80', text:'Love the quality and the packaging. Everything arrived in perfect condition.', stars:5 },
  { name:'James Wilson', role:'Tech Enthusiast', avatar:'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=80&q=80', text:'Amazing prices on electronics. The M2 MacBook deal was unbeatable.', stars:5 }
];

// ============ STATE ============
let cart = [];              // [{id, qty}]
let wishlist = new Set();   // product ids

// ============ HELPERS ============
const $ = s => document.querySelector(s);
const esc = t => String(t).replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
const money = n => '$' + n.toLocaleString();
const starsFor = n => '★'.repeat(Math.round(n)) + '☆'.repeat(5 - Math.round(n));
const productById = id => PRODUCTS.find(p => p.id === id) || (DEAL.id === id ? DEAL : null);

// ============ RENDER ============
function renderCategories() {
  const grid = $('#categoriesGrid');
  grid.innerHTML = '';
  CATEGORIES.forEach(cat => {
    const el = document.createElement('div');
    el.className = 'cat-card';
    el.innerHTML = `<div class="ico"><i class="fas ${cat.icon}"></i></div><h4>${esc(cat.name)}</h4><div class="cnt">${cat.count} items</div>`;
    el.addEventListener('click', () => {
      $('#searchInput').value = cat.name;
      filterProducts(cat.name);
      document.getElementById('products').scrollIntoView({ behavior:'smooth', block:'start' });
    });
    grid.appendChild(el);
  });
}

function renderProducts(list) {
  const grid = $('#productsGrid');
  grid.innerHTML = '';
  if (!list.length) {
    grid.innerHTML = '<p class="empty-msg">No products found — try a different search.</p>';
    return;
  }
  list.forEach(p => {
    const badgeClass = p.badge === 'Sale' ? 'sale' : '';
    const badgeHtml = p.badge ? `<span class="badge ${badgeClass}">${esc(p.badge)}</span>` : '';
    const oldHtml = p.oldPrice ? `<span class="old-price">${money(p.oldPrice)}</span>` : '';
    const wished = wishlist.has(p.id) ? 'active' : '';
    const el = document.createElement('article');
    el.className = 'p-card';
    el.innerHTML = `
      <div class="imgw">
        <img src="${p.img}" alt="${esc(p.title)}" loading="lazy">
        ${badgeHtml}
        <button class="wish-btn ${wished}" data-id="${p.id}" aria-label="Toggle wishlist"><i class="fas fa-heart"></i></button>
      </div>
      <div class="body">
        <div class="cat-tag">${esc(p.category)}</div>
        <h5>${esc(p.title)}</h5>
        <div class="price-row"><span class="price">${money(p.price)}</span>${oldHtml}</div>
        <div class="rating">${starsFor(p.rating)} <span>(${p.reviews})</span></div>
      </div>
      <div class="foot"><button class="add-btn" data-id="${p.id}"><i class="fas fa-cart-plus"></i> Add to Cart</button></div>`;
    grid.appendChild(el);
  });

  grid.querySelectorAll('.add-btn').forEach(btn => {
    btn.addEventListener('click', () => addToCart(Number(btn.dataset.id), btn));
  });
  grid.querySelectorAll('.wish-btn').forEach(btn => {
    btn.addEventListener('click', () => toggleWish(Number(btn.dataset.id), btn));
  });
}

function renderTestimonials() {
  const grid = $('#testimonialsList');
  grid.innerHTML = '';
  TESTIMONIALS.forEach(t => {
    const el = document.createElement('div');
    el.className = 'test-card';
    el.innerHTML = `
      <div class="stars">${starsFor(t.stars)}</div>
      <blockquote>&ldquo;${esc(t.text)}&rdquo;</blockquote>
      <div class="author">
        <img class="avatar" src="${t.avatar}" alt="${esc(t.name)}" loading="lazy">
        <div><div class="name">${esc(t.name)}</div><div class="role">${esc(t.role)}</div></div>
      </div>`;
    grid.appendChild(el);
  });
}

function renderCart() {
  const box = $('#cartItems');
  if (!cart.length) {
    box.innerHTML = '<div class="cart-empty"><div><i class="fas fa-shopping-bag" style="font-size:34px;color:#d1d5db"></i><p style="margin-top:10px">Your cart is empty.<br>Add something nice!</p></div></div>';
    $('#cartTotal').textContent = money(0);
    return;
  }
  box.innerHTML = '';
  cart.forEach(item => {
    const p = productById(item.id);
    if (!p) return;
    const row = document.createElement('div');
    row.className = 'ci';
    row.innerHTML = `
      <img src="${p.img}" alt="${esc(p.title)}">
      <div class="info">
        <b>${esc(p.title)}</b>
        <span>${money(p.price)} each</span>
        <div class="qty">
          <button data-act="minus" data-id="${p.id}" aria-label="Decrease">−</button>
          <span>${item.qty}</span>
          <button data-act="plus" data-id="${p.id}" aria-label="Increase">+</button>
        </div>
      </div>
      <div style="text-align:right;display:flex;flex-direction:column;align-items:flex-end;gap:6px">
        <b>${money(p.price * item.qty)}</b>
        <button class="rm" data-act="rm" data-id="${p.id}" aria-label="Remove"><i class="fas fa-trash"></i></button>
      </div>`;
    box.appendChild(row);
  });
  $('#cartTotal').textContent = money(cart.reduce((s, it) => s + (productById(it.id)?.price || 0) * it.qty, 0));
}

// ============ CART ACTIONS ============
function updateCart() {
  const total = cart.reduce((s, it) => s + it.qty, 0);
  $('#cartCount').textContent = total;
  renderCart();
}

function addToCart(id, btn) {
  const it = cart.find(i => i.id === id);
  if (it) it.qty++;
  else cart.push({ id, qty: 1 });
  updateCart();
  toast('Added to cart ✓');
  if (btn) {
    const orig = btn.innerHTML;
    btn.classList.add('added');
    btn.innerHTML = '<i class="fas fa-check"></i> Added';
    setTimeout(() => { btn.classList.remove('added'); btn.innerHTML = orig; }, 1400);
  }
}

function changeQty(id, delta) {
  const it = cart.find(i => i.id === id);
  if (!it) return;
  it.qty += delta;
  if (it.qty <= 0) cart = cart.filter(i => i.id !== id);
  updateCart();
}

function removeItem(id) {
  cart = cart.filter(i => i.id !== id);
  updateCart();
  toast('Item removed');
}

function toggleWish(id, btn) {
  if (wishlist.has(id)) { wishlist.delete(id); btn.classList.remove('active'); toast('Removed from wishlist'); }
  else { wishlist.add(id); btn.classList.add('active'); toast('Added to wishlist ♥'); }
}

// ============ SEARCH / FILTER ============
function filterProducts(query) {
  const q = String(query || '').trim().toLowerCase();
  if (!q) { renderProducts(PRODUCTS); return; }
  renderProducts(PRODUCTS.filter(p =>
    p.title.toLowerCase().includes(q) || p.category.toLowerCase().includes(q)
  ));
}

// ============ TOAST ============
let toastTimer;
function toast(msg) {
  const t = $('#toast');
  t.textContent = msg;
  t.classList.add('show');
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => t.classList.remove('show'), 2200);
}

// ============ CART DRAWER ============
function openCart()  { $('#cart').classList.add('open'); $('#overlay').classList.add('show'); }
function closeCart() { $('#cart').classList.remove('open'); $('#overlay').classList.remove('show'); }

// ============ DEAL TIMER ============
(function setupDealTimer() {
  const target = Date.now() + (24 * 60 + 36) * 60 * 1000; // 24h 36m from load
  function tick() {
    const diff = target - Date.now();
    const pad = n => String(n).padStart(2, '0');
    $('#dealDays').textContent    = diff > 0 ? Math.floor(diff / (24*3600*1000)) : 0;
    $('#dealHours').textContent   = diff > 0 ? pad(Math.floor(diff % (24*3600*1000) / (3600*1000))) : '00';
    $('#dealMinutes').textContent = diff > 0 ? pad(Math.floor(diff % (3600*1000) / (60*1000))) : '00';
    $('#dealSeconds').textContent = diff > 0 ? pad(Math.floor(diff % (60*1000) / 1000)) : '00';
  }
  tick();
  setInterval(tick, 1000);
})();

// ============ EVENTS ============
document.getElementById('shopNow').addEventListener('click', () =>
  document.getElementById('products').scrollIntoView({ behavior:'smooth' }));
document.getElementById('exploreDeals').addEventListener('click', () =>
  document.getElementById('deals').scrollIntoView({ behavior:'smooth' }));
document.getElementById('buyDeal').addEventListener('click', function() {
  addToCart(DEAL.id, null);
  const orig = this.innerHTML;
  this.innerHTML = '<i class="fas fa-check"></i> Added!';
  this.style.background = 'var(--good)';
  setTimeout(() => { this.innerHTML = orig; this.style.background = ''; }, 1400);
});

const searchInput = $('#searchInput');
searchInput.addEventListener('input', () => filterProducts(searchInput.value));
$('#searchBtn').addEventListener('click', () => filterProducts(searchInput.value));
searchInput.addEventListener('keydown', e => { if (e.key === 'Enter') filterProducts(searchInput.value); });

$('#cartBtn').addEventListener('click', openCart);
$('#closeCart').addEventListener('click', closeCart);
$('#overlay').addEventListener('click', closeCart);

document.addEventListener('keydown', e => { if (e.key === 'Escape') closeCart(); });

$('#cartItems').addEventListener('click', e => {
  const btn = e.target.closest('button');
  if (!btn || !btn.dataset.act) return;
  const id = Number(btn.dataset.id);
  if (btn.dataset.act === 'plus') changeQty(id, 1);
  if (btn.dataset.act === 'minus') changeQty(id, -1);
  if (btn.dataset.act === 'rm') removeItem(id);
});

$('#checkoutBtn').addEventListener('click', () => {
  if (!cart.length) { toast('Cart is empty'); return; }
  cart = [];
  updateCart();
  closeCart();
  toast('🎉 Order placed — thank you! (demo)');
});

const menuBtn = $('#menuBtn'), mobileNav = $('#mobileNav');
menuBtn.addEventListener('click', () => {
  const open = mobileNav.style.display === 'block';
  mobileNav.style.display = open ? 'none' : 'block';
  menuBtn.innerHTML = open ? '<i class="fas fa-bars"></i>' : '<i class="fas fa-times"></i>';
});
mobileNav.querySelectorAll('a').forEach(a => a.addEventListener('click', () => {
  mobileNav.style.display = 'none';
  menuBtn.innerHTML = '<i class="fas fa-bars"></i>';
}));
window.addEventListener('resize', () => {
  if (window.innerWidth > 900) { mobileNav.style.display = 'none'; menuBtn.innerHTML = '<i class="fas fa-bars"></i>'; }
});

$('#newsletterForm').addEventListener('submit', e => {
  e.preventDefault();
  const email = $('#newsletterEmail').value.trim();
  const msg = $('#newsMsg');
  if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    msg.textContent = 'Please enter a valid email address.';
    msg.style.color = '#fca5a5';
    toast('Invalid email');
    return;
  }
  msg.textContent = '🎉 Thanks for subscribing!';
  msg.style.color = '#a7f3d0';
  $('#newsletterEmail').value = '';
  toast('Subscribed 🎉');
  setTimeout(() => msg.textContent = '', 3500);
});

$('#year').textContent = new Date().getFullYear();

// ============ INIT ============
renderCategories();
renderProducts(PRODUCTS);
renderTestimonials();
updateCart();
console.log('🚀 NexusShop — simple UI version loaded.');
</script>

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NexusShop Modern UI</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root{
--bg:#f4f7fb;
--primary:#0f172a;
--accent:#6366f1;
--muted:#64748b;
--card:rgba(255,255,255,0.7);
--radius:16px;
}

/* Base */
body{
margin:0;
font-family:Inter;
background:var(--bg);
color:var(--primary);
}

/* Header */
header{
position:sticky;
top:0;
background:rgba(255,255,255,0.6);
backdrop-filter:blur(12px);
padding:15px 0;
z-index:100;
}

.container{
max-width:1200px;
margin:auto;
padding:0 20px;
}

.header-inner{
display:flex;
justify-content:space-between;
align-items:center;
}

.brand{
font-family:Poppins;
font-size:22px;
font-weight:700;
}

.brand span{
color:var(--accent);
}

/* Buttons */
.btn{
padding:10px 18px;
border:none;
border-radius:999px;
cursor:pointer;
font-weight:600;
}

.btn-primary{
background:linear-gradient(135deg,#6366f1,#4f46e5);
color:white;
transition:.3s;
}

.btn-primary:hover{
transform:translateY(-2px);
}

/* Hero */
.hero{
text-align:center;
padding:80px 20px;
background:linear-gradient(135deg,#6366f1,#0f172a);
color:white;
}

.hero h1{
font-size:48px;
}

.hero p{
opacity:.9;
}

/* Grid */
.grid{
display:grid;
gap:20px;
}

/* Products */
.products{
grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
}

.product{
background:var(--card);
backdrop-filter:blur(12px);
padding:15px;
border-radius:var(--radius);
transition:.3s;
}

.product:hover{
transform:translateY(-8px);
}

.product img{
width:100%;
border-radius:12px;
transition:.3s;
}

.product:hover img{
transform:scale(1.05);
}

.price{
font-weight:bold;
margin-top:10px;
}

.add-btn{
margin-top:10px;
width:100%;
background:var(--primary);
color:white;
padding:10px;
border:none;
border-radius:8px;
cursor:pointer;
}

/* Toast */
.toast{
position:fixed;
bottom:20px;
right:20px;
background:#111;
color:white;
padding:12px 18px;
border-radius:8px;
opacity:0;
transition:.3s;
}

.toast.show{
opacity:1;
}
</style>
</head>

<body>

<header>
<div class="container header-inner">
<div class="brand">Nexus<span>Shop</span></div>
<button class="btn btn-primary">Cart (<span id="cartCount">0</span>)</button>
</div>
</header>

<section class="hero">
<h1>Premium Collection</h1>
<p>Modern UI e-commerce design</p>
<button class="btn btn-primary">Shop Now</button>
</section>

<section class="container" style="padding:40px 0;">
<h2>Products</h2>

<div class="grid products" id="products"></div>
</section>

<div class="toast" id="toast">Added to cart</div>

<script>
const PRODUCTS=[
{title:"iPhone 14",price:999,img:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80"},
{title:"MacBook",price:1999,img:"https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80"},
{title:"Headphones",price:299,img:"https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80"}
];

let cart=0;

function render(){
const container=document.getElementById("products");
PRODUCTS.forEach(p=>{
const el=document.createElement("div");
el.className="product";
el.innerHTML=`
<img src="${p.img}">
<h4>${p.title}</h4>
<div class="price">$${p.price}</div>
<button class="add-btn">Add to Cart</button>
`;
el.querySelector("button").onclick=()=>{
cart++;
document.getElementById("cartCount").innerText=cart;
showToast();
};
container.appendChild(el);
});
}

function showToast(){
const t=document.getElementById("toast");
t.classList.add("show");
setTimeout(()=>t.classList.remove("show"),1500);
}

render();
</script>

</body>
</html>

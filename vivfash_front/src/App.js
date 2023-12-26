import data from "./data.js";

function App() {
  return (
    <div>
      <header>
        <a href="/">VIVFASH-COLLECTIONS</a>
      </header>
      <main>
       <h1>Customized cloth designs</h1>
       <div className="products">
       {
        data.products.map(product => (
          <div className="product" key={product.slug}>
            <a href ={`/product/${product.slug}`}>
            <img src={product.images} alt={product.name} />
            </a>
            <div className="product-info">
             <a href={`/product/${product.slug}`}>
               <p>{product.name}</p>
               </a>
              <p><strong>${product.price}</strong></p>
              <button>Add to Cart</button>
            </div>
          </div>
        ))
          }
          </div>
      </main>
    </div>
  );
}

export default App;

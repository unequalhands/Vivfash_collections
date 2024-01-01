import React from 'react'
import data from '../data'
import { Link } from 'react-router-dom'

const Homescreen = () => {
  return (
    <div>
      <h1>Customized cloth designs</h1>
       <div className="products">
       {
        data.products.map(product => (
          <div className="product" key={product.slug}>
            <Link to ={`/product/${product.slug}`}>
            <img src={product.images} alt={product.name} />
            </Link>
            <div className="product-info">
             <Link to={`/product/${product.slug}`}>
               <p>{product.name}</p>
               </Link>
              <p><strong>${product.price}</strong></p>
              <button>Add to Cart</button>
            </div>
          </div>
        ))
          }
          </div>
    </div>
  )
}

export default Homescreen

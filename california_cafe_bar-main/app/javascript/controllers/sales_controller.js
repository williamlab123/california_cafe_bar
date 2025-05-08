// app/javascript/controllers/sales_controller.js
document.addEventListener('DOMContentLoaded', () => {
    const saleStockId = document.querySelector('#sale_stock_id');
    const stockPrice = document.querySelector('#stock_price');
  
    saleStockId.addEventListener('change', () => {
      fetch(`/stocks/${saleStockId.value}`)
        .then(response => response.json())
        .then(data => {
          stockPrice.textContent = `Price: ${data.price}`;
        });
    });
  });
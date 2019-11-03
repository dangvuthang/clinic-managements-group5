using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models {
  public class ProductModel {
    private List<Product> products;

    public ProductModel() {
      products = new List<Product>() { new Product() { Id = 1, Name = "Product 1",Price=21,Description= "Product 1",Image="product_01.png" }, new Product() { Id = 2, Name = "Product 2", Price = 30, Description = "Product 2", Image = "product_02.png" }, new Product() { Id = 3, Name = "Product 3", Price = 41, Description = "Product 3", Image = "product_03.png" }, new Product() { Id = 4, Name = "Product 4", Price = 11, Description = "Product 4", Image = "product_04.png" }, new Product() { Id = 5, Name = "Product 5", Price = 51, Description = "Product 5", Image = "product_05.png" }, new Product() { Id = 6, Name = "Product 6", Price = 165, Description = "Product 6", Image = "product_06.png" }, new Product() { Id = 7, Name = "Product 7", Price = 210, Description = "Product 7", Image = "product_06.png" }, new Product() { Id = 8, Name = "Product 8", Price = 300, Description = "Product 8", Image = "product_05.png" }, new Product() { Id = 9, Name = "Product 9", Price = 410, Description = "Product 9", Image = "product_04.png" }, new Product() { Id = 10, Name = "Product 10", Price = 110, Description = "Product 10", Image = "product_03.png" }, new Product() { Id = 11, Name = "Product 11", Price = 510, Description = "Product 11", Image = "product_02.png" }, new Product() { Id = 12, Name = "Product 12", Price = 1650, Description = "Product 12", Image = "product_01.png" }, new Product() { Id = 13, Name = "Product 13", Price = 1312, Description = "Product 13", Image = "product_05.png" } };
    }
    public List<Product> GetProducts() {
      return products;
    }

    public Product FindProduct(int id) {
      return products.FirstOrDefault(p => p.Id == id);
    }

  }
}
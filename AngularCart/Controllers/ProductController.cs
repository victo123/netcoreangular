using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AngularCart.Models;
using AngularCart.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace AngularCart.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductController : ControllerBase
    {
        private readonly ILogger<ProductController> _logger;
        public ProductController(ILogger<ProductController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<ProductViewModel> Get()
        {
            List<ProductViewModel> lstProducts = new List<ProductViewModel>();
            var rng = new Random();
            var Products =  new CartDbContext().Product.Include(r=>r.Category).ToList();
            foreach (var product in Products)
            {
                List<DiscountViewModel> discounts = new List<DiscountViewModel>();
                foreach (var discount in product.AppliedDiscount)
                {
                    discounts.Add(new DiscountViewModel() {
                        Discount = discount.Discount,
                        DiscountName = discount.DiscountNavigation.DiscountName,
                    });
                }
                lstProducts.Add(new ProductViewModel
                {
                    ProductId = product.ProductId,
                    ProductName = product.ProductName,
                    Packaging = product.Packaging,
                    CategoryId = product.CategoryId,
                    ProductImageUrl = product.ProductImageUrl,
                    ProductCost = product.ProductCost,
                    CategoryName = product.Category.CategoryName,
                    DeliveryCharges = product.Category.DeliveryCharges,
                    Discounts = discounts
                });
            }
            return lstProducts;
        }

        // GET: api/Products/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ProductViewModel>> GetProduct(int id)
        {
            var product = await new CartDbContext().Product.FindAsync(id);

            if (product == null)
            {
                return NotFound();
            }
            List<DiscountViewModel> discounts = new List<DiscountViewModel>();
            foreach (var discount in product.AppliedDiscount)
            {
                discounts.Add(new DiscountViewModel()
                {
                    Discount = discount.Discount,
                    DiscountName = discount.DiscountNavigation.DiscountName,
                });
            }
            return new ProductViewModel
            {
                ProductId = product.ProductId,
                ProductName = product.ProductName,
                ProductImageUrl = product.ProductImageUrl,
                ProductCost = product.ProductCost,
                CategoryName = product.Category.CategoryName,
                DeliveryCharges = product.Category.DeliveryCharges,
                Discounts = discounts
            };
        }

        [HttpGet("category")]
        public IEnumerable<CategoryViewModel> GetCategory()
        {
            List<CategoryViewModel> lstCategorys = new List<CategoryViewModel>();
            lstCategorys.Add(new CategoryViewModel
                {
                    id = 0,
                    CategoryName = "On Sales !",
                    Delivery = 0
                });
            lstCategorys.Add(new CategoryViewModel
                {
                    id = 0,
                    CategoryName = "New",
                    Delivery = 0
                });
            lstCategorys.Add(new CategoryViewModel
                {
                    id = 0,
                    CategoryName = "Shop by Store",
                    Delivery = 0
                });
            var Categorys =  new CartDbContext().ProductCategory.ToList();
            foreach (var product in Categorys)
            {
                lstCategorys.Add(new CategoryViewModel
                {
                    id = product.CategoryId,
                    CategoryName = product.CategoryName,
                    Delivery = product.DeliveryCharges
                });
            }
            return lstCategorys;
        }
        
    }
}

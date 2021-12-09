using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace AngularCart.Models
{
    public partial class CartDbContext : DbContext
    {
        public CartDbContext()
        {
        }

        public CartDbContext(DbContextOptions<CartDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AppliedDiscount> AppliedDiscount { get; set; }
        public virtual DbSet<Discount> Discount { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<ProductCategory> ProductCategory { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder
                    .UseLazyLoadingProxies()
                    .UseSqlServer("Server=localhost\\SQLEXPRESS;Database=DemoApp;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AppliedDiscount>(entity =>
            {
                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.HasOne(d => d.DiscountNavigation)
                    .WithMany(p => p.AppliedDiscount)
                    .HasForeignKey(d => d.DiscountId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AppliedDiscount_Discount");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.AppliedDiscount)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AppliedDiscount_Product");
            });

            modelBuilder.Entity<Discount>(entity =>
            {
                entity.Property(e => e.DiscountDescription).HasMaxLength(500);

                entity.Property(e => e.DiscountName)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.ProductImageUrl)
                    .HasColumnName("productImageUrl")
                    .HasMaxLength(500);

                entity.Property(e => e.ProductName)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Product)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_ProductCategory");
            });

            modelBuilder.Entity<ProductCategory>(entity =>
            {
                entity.HasKey(e => e.CategoryId);

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.CategoryName)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}



import dao.ProductDao;
import model.Product;
import model.ProductImage;
import model.ProductVariant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/add-product")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class AddProductServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy đường dẫn upload
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        try {
            // Lấy thông tin sản phẩm
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            BigDecimal basePrice = new BigDecimal(request.getParameter("basePrice"));
            boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));

            Product product = new Product();
            product.setProductName(productName);
            product.setDescription(description);
            product.setBasePrice(basePrice);
            product.setIsActive(isActive);

            // ===== Xử lý ảnh =====
            List<Part> fileParts = (List<Part>) request.getParts();
            List<ProductImage> imageList = new ArrayList<>();

            for (Part part : fileParts) {
                if (part.getName().equals("productImage") && part.getSize() > 0) {
                    String fileName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
                    String filePath = uploadPath + File.separator + fileName;
                    part.write(filePath);

                    ProductImage image = new ProductImage();
                    image.setImageUrl(UPLOAD_DIR + "/" + fileName);
                    image.setAltText("Product image");
                    image.setPrimary(imageList.isEmpty()); // ảnh đầu là ảnh chính
                    image.setSortOrder(imageList.size());
                    imageList.add(image);
                }
            }

            // ===== Xử lý biến thể (variants) =====
            String[] variantNames = request.getParameterValues("variantName");
            String[] variantValues = request.getParameterValues("variantValue");
            String[] priceAdjustments = request.getParameterValues("priceAdjustment");
            String[] stockQuantities = request.getParameterValues("stockQuantity");
            String[] skus = request.getParameterValues("sku");

            List<ProductVariant> variantList = new ArrayList<>();

            if (variantNames != null) {
                for (int i = 0; i < variantNames.length; i++) {
                    ProductVariant variant = new ProductVariant();
                    variant.setVariantName(variantNames[i]);
                    variant.setVariantValue(variantValues[i]);
                    variant.setPriceAdjustment(new BigDecimal(priceAdjustments[i]));
                    variant.setStockQuantity(Integer.parseInt(stockQuantities[i]));
                    variant.setSku(skus[i]);
                    variant.setActive(true);
                    variantList.add(variant);
                }
            }

            // ===== Gọi DAO để lưu vào DB =====
            ProductDao dao = new ProductDao();
            boolean success = dao.addProduct(product, imageList, variantList);

            if (success) {
                response.sendRedirect("admin-product-list.jsp?msg=success");
            } else {
                response.sendRedirect("admin-product-add.jsp?msg=fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin-product-add.jsp?msg=error");
        }
    }
}

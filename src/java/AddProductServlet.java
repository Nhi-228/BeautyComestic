
import dao.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import model.Product;
import model.ProductImage;
import model.ProductVariant;

@WebServlet("/ADMIN/addProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 50 * 1024 * 1024)
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");

            // 1. Trích xuất dữ liệu sản phẩm
            Product product = extractProductFromRequest(request);

            // 2. Upload ảnh và set vào sản phẩm
            List<ProductImage> imageGallery = uploadImages(request);
            product.setImageGallery(imageGallery);

            // 3. Trích xuất biến thể (nếu có)
            List<ProductVariant> variants = extractVariants(request);
            product.setVariants(variants);

            // 4. Lưu vào DB
            ProductDao dao = new ProductDao();
            dao.addProduct(product);

            // 5. Redirect sau khi thêm thành công
            response.sendRedirect("ADMIN/showProduct.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi thêm sản phẩm: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private Product extractProductFromRequest(HttpServletRequest request) {
    Product product = new Product();
    product.setName(request.getParameter("name"));
    product.setSku(request.getParameter("sku"));

    // Xử lý giá trị price và discountPrice an toàn với double
    try {
        String priceStr = request.getParameter("price");
        product.setPrice(priceStr != null && !priceStr.isEmpty() ? Double.parseDouble(priceStr) : 0.0);
    } catch (NumberFormatException e) {
        product.setPrice(0.0);
    }

    try {
        String discountStr = request.getParameter("discountPrice");
        product.setDiscountPrice(discountStr != null && !discountStr.isEmpty() ? Double.parseDouble(discountStr) : 0.0);
    } catch (NumberFormatException e) {
        product.setDiscountPrice(0.0);
    }

    product.setDescription(request.getParameter("description"));
    product.setUsage(request.getParameter("usage"));
    product.setSuggestion(request.getParameter("suggestion"));
    return product;
}


    private List<ProductImage> uploadImages(HttpServletRequest request) throws IOException, ServletException {
        List<ProductImage> images = new ArrayList<>();
        String uploadPath = getServletContext().getRealPath("/") + "image";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        for (Part part : request.getParts()) {
            if (part.getName().equals("images") && part.getSize() > 0) {
                String fileName = UUID.randomUUID().toString() + "_" + getFileName(part);
                part.write(uploadPath + File.separator + fileName);

                ProductImage image = new ProductImage();
                image.setImageUrl("image/" + fileName); // Đường dẫn tương đối để hiển thị
                image.setSortOrder(0); // Bạn có thể cập nhật từ form nếu muốn
                image.setIsPrimary(images.isEmpty()); // Ảnh đầu tiên là chính
                images.add(image);
            }
        }

        return images;
    }

    private List<ProductVariant> extractVariants(HttpServletRequest request) {
        List<ProductVariant> variants = new ArrayList<>();

        String[] variantNames = request.getParameterValues("variantName");
        String[] variantSkus = request.getParameterValues("variantSku");
        String[] variantPrices = request.getParameterValues("variantPrice");
        String[] variantStocks = request.getParameterValues("variantStock");

        if (variantNames != null) {
            for (int i = 0; i < variantNames.length; i++) {
                ProductVariant variant = new ProductVariant();
                variant.setName(variantNames[i]);
                variant.setSku(variantSkus[i]);
                variant.setPrice(new BigDecimal(variantPrices[i]));
                variant.setStockQuantity(Integer.parseInt(variantStocks[i]));
                variants.add(variant);
            }
        }

        return variants;
    }

    private String getFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf(File.separator) + 1);
            }
        }
        return null;
    }
}


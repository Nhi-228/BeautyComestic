
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import java.util.ArrayList;
import java.util.List;

// Lớp Product để chứa thông tin sản phẩm (giả lập, sau này thay bằng cơ sở dữ liệu)
class Product {
    String id;
    String name;
    double price;
    double oldPrice;
    String image;
    String status;
    List<String> species;
    List<String> smallImages;
    int quantity; // Thêm để lưu số lượng trong giỏ hàng

    public Product(String id, String name, double price, double oldPrice, String image, String status, List<String> species, List<String> smallImages) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.oldPrice = oldPrice;
        this.image = image;
        this.status = status;
        this.species = species;
        this.smallImages = smallImages;
    }

    // Getters
    public String getId() { return id; }
    public String getName() { return name; }
    public double getPrice() { return price; }
    public double getOldPrice() { return oldPrice; }
    public String getImage() { return image; }
    public String getStatus() { return status; }
    public List<String> getSpecies() { return species; }
    public List<String> getSmallImages() { return smallImages; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Dữ liệu giả lập sản phẩm (thay bằng truy vấn cơ sở dữ liệu sau này)
        List<String> species = new ArrayList<>();
        species.add("P01 - Bright Pink: da sáng hồng");
        species.add("N01 - Neutral Beige: da tự nhiên");
        species.add("N02 - Neutral Medium: da trung bình");

        List<String> smallImages = new ArrayList<>();
        smallImages.add("image/cushion2.jpg");
        smallImages.add("image/cushion3.jpg");
        smallImages.add("image/cushion4.jpg");

        Product product = new Product(
            "SP670942631",
            "3CE BARE COVER CUSHION",
            382500.0, // Giá sau giảm (450,000 - 15%)
            450000.0, // Giá gốc
            "image/cushion.jpg",
            "Còn hàng",
            species,
            smallImages
        );

        // Đặt dữ liệu sản phẩm vào request để JSP sử dụng
        request.setAttribute("product", product);

        // Chuyển tiếp yêu cầu đến products.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/products.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addToCart".equals(action)) {
            // Xử lý Thêm vào giỏ hàng
            String productId = request.getParameter("productId");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            // Lưu vào giỏ hàng trong session
            List<Product> cart = (List<Product>) request.getSession().getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }
            Product product = new Product(productId, "3CE BARE COVER CUSHION", 382500.0, 450000.0, "image/cushion.jpg", "Còn hàng", null, null);
            product.setQuantity(quantity);
            cart.add(product);
            request.getSession().setAttribute("cart", cart);
            response.sendRedirect("products.jsp?added=true");
        } else if ("buyNow".equals(action)) {
            // Xử lý Mua ngay
            String productId = request.getParameter("productId");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            request.getSession().setAttribute("paymentProductId", productId);
            request.getSession().setAttribute("paymentQuantity", quantity);
            response.sendRedirect("payment.jsp");
        } else {
            doGet(request, response);
        }
    }
}

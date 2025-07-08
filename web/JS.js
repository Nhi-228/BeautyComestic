window.onload = function () {
    let currentIndex = 0;
    const slides = document.querySelector('.slides');
    if (slides) {
        const totalSlides = slides.children.length;
        function updateSlide() {
            slides.style.transform = `translateX(-${currentIndex * 100}%)`;
        }

        function changeSlide(direction) {
            currentIndex += direction;
            if (currentIndex < 0) currentIndex = totalSlides - 1;
            if (currentIndex >= totalSlides) currentIndex = 0;
            updateSlide();
        }

        setInterval(() => changeSlide(1), 5000);
    }

    // Số lượng
    const minusBtn = document.querySelector('.quantity-box button:first-child');
    const plusBtn = document.querySelector('.quantity-box button:last-child');
    const qtyInput = document.querySelector('.quantity-box input');

    if (minusBtn && plusBtn && qtyInput) {
        minusBtn.addEventListener('click', () => {
            let val = parseInt(qtyInput.value);
            if (val > 1) qtyInput.value = val - 1;
        });

        plusBtn.addEventListener('click', () => {
            let val = parseInt(qtyInput.value);
            qtyInput.value = val + 1;
        });
    }

    // Chọn hình nhỏ thay đổi hình lớn
    const smallImgs = document.querySelectorAll('.products-content-left-small-img img');
    const bigImg = document.querySelector('.products-content-left-big-img img');
    if (smallImgs && bigImg) {
        smallImgs.forEach(img => {
            img.addEventListener('click', () => {
                bigImg.src = img.src;
            });
        });
    }

    // Click chọn option kích thước
    document.querySelectorAll('.option').forEach(btn => {
        btn.addEventListener('click', function () {
            document.querySelectorAll('.option').forEach(b => b.classList.remove('selected'));
            this.classList.add('selected');
        });
    });

    // Thêm vào giỏ
    const addToCartBtn = document.querySelector('.add-to-cart');
    if (addToCartBtn) {
        addToCartBtn.addEventListener('click', () => {
            const productName = document.querySelector('.products-name h1')?.innerText || '';
            const selectedOption = document.querySelector('.option.selected')?.innerText || '(Chưa chọn)';
            const quantity = qtyInput?.value || 1;

            alert(`Đã thêm ${quantity} x ${productName} (${selectedOption}) vào giỏ hàng!`);
        });
    }
    //-------products-------
    const Use = document.querySelector(".Use");
    const Product = document.querySelector(".Product");
    if(Use){
        Use.addEventListener('click', function (){
            document.querySelector(".products-content-right-button-content-product").style.display ="none";
        document.querySelector(".products-content-right-button-content-Use").style.display ="block";
        
    });
    }
    if(Product){
        Product.addEventListener('click', function (){
            document.querySelector(".products-content-right-button-content-product").style.display ="block";
        document.querySelector(".products-content-right-button-content-Use").style.display ="none";
    });
    }
    
    
    
    
};

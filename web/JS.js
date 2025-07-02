/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let currentIndex = 0;
const slides = document.querySelector('.slides');
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

// Tự động chuyển ảnh mỗi 5 giây
setInterval(() => {
  changeSlide(1);
}, 5000);

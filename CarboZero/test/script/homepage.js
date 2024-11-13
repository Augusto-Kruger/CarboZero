// Código do swiper da homepage
var swiper = new Swiper('.blog-slider', {
    direction: 'vertical', // Define a direção para vertical
    spaceBetween: 30,
    effect: 'fade',
    loop: true,
    mousewheel: {
        invert: false, // Permite a navegação com o scroll do mouse
    },
    pagination: {
        el: '.blog-slider__pagination',
        clickable: true,
    },
});

// Adaptar o JavaScript para trabalhar com as novas classes
document.querySelectorAll('.new-card').forEach(card => {
    const face1 = card.querySelector('.new-face1');
    const face2 = card.querySelector('.new-face2');

    // Adiciona a classe 'hover-ativo' quando o mouse entra na face1
    face1.addEventListener('mouseenter', () => {
        card.classList.add('hover-ativo');
    });

    // Mantém a classe 'hover-ativo' quando o mouse entra na face2
    face2.addEventListener('mouseenter', () => {
        card.classList.add('hover-ativo');
    });

    // Remove a classe 'hover-ativo' quando o mouse sai do card
    card.addEventListener('mouseleave', () => {
        card.classList.remove('hover-ativo');
    });
});

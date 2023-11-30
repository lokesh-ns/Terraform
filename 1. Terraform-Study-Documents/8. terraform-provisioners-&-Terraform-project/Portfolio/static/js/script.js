let menu = document.querySelector('.menu')
let nav_container = document.querySelector('.nav_container')

menu.onclick=()=>{
    nav_container.classList.toggle('open-menu');
    menu.classList.toggle('move');
};

window.onscroll=()=>{
    nav_container.classList.remove('open-menu');
    menu.classList.remove('move');
}; 
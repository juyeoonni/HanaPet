function scrollToTarget(target) {
    const targetElement = document.getElementById(target);
    const targetTop = targetElement.getBoundingClientRect().top + window.scrollY;
    window.scrollTo({top: targetTop, behavior: 'smooth'});
}
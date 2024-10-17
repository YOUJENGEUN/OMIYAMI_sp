document.addEventListener("DOMContentLoaded", function () {
  setTimeout(function () {
    document.getElementById("loader-wrapper").classList.add("loaded");
  }, 1500);
});

const myDelay = 3000;
let timer;

document.addEventListener("DOMContentLoaded", function () {
  // .searchform 클래스가 있는 input 요소를 선택
  const searchInput = document.querySelector(".searchform");

  // 요소가 제대로 선택되었는지 확인
  if (searchInput) {
    searchInput.addEventListener("input", function () {
      if (searchInput.value.trim() !== "") {
        searchInput.classList.add("has-text");
      } else {
        searchInput.classList.remove("has-text");
      }
    });
  } else {
    console.error("searchInput 요소를 찾을 수 없습니다.");
  }
});

document.addEventListener("DOMContentLoaded", function () {
  let Top = document.getElementById("scrollUp");

  if (Top) {
    // 요소가 존재하는지 확인
    Top.addEventListener("click", function () {
      window.scrollTo({ top: 0, behavior: "smooth" });
    });

    window.addEventListener("scroll", function () {
      if (window.scrollY > 30) {
        Top.classList.add("on");
      } else {
        Top.classList.remove("on");
      }
    });
  }
});

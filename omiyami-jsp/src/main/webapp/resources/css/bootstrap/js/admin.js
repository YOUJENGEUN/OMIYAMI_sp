document.addEventListener("DOMContentLoaded", function () {
  const menuItems = document.querySelectorAll(".nav-item");
  const currentPath = window.location.pathname.split("/").pop().split('-')[0].toLowerCase();  // 현재 경로의 파일명만 추출


  
  menuItems.forEach((item) => {
    const itemPath = new URL(item.href, window.location.origin).pathname.split("/").pop().split('-')[0].toLowerCase();  // 메뉴 경로의 파일명만 추출


    // 파일명만 비교하여 active 클래스 추가
    if (itemPath === currentPath) {
      item.classList.add("active");
    } else {
      item.classList.remove("active");
    }
  });
});
const triggerTabList = document.querySelectorAll("#myTab button");
triggerTabList.forEach((triggerEl) => {
  const tabTrigger = new bootstrap.Tab(triggerEl);

  triggerEl.addEventListener("click", (event) => {
    event.preventDefault();
    tabTrigger.show();
  });
});

function selectAll(selectAllCheckbox) {
  const items = document.getElementsByName("select-item");
  items.forEach((item) => {
    item.checked = selectAllCheckbox.checked;
  });
  updateSelectAllLabel();
}

function selectItem() {
  const selectAllCheckbox = document.querySelector(
    'input[name="selectAll-item"]'
  );
  const items = document.getElementsByName("select-item");
  const totalItems = items.length;
  const checkedItems = document.querySelectorAll(
    'input[name="select-item"]:checked'
  ).length;

  selectAllCheckbox.checked = checkedItems === totalItems;
  updateSelectAllLabel();
}

// '전체선택 (n/n)' & 주문하기(n개) 갱신
function updateSelectAllLabel() {
  const items = document.getElementsByName("select-item");
  const totalItems = items.length;
  const checkedItems = document.querySelectorAll(
    'input[name="select-item"]:checked'
  ).length;
}





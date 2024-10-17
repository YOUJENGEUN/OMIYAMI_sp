document.addEventListener("DOMContentLoaded", function () {
  updateSelectAllLabel();

  // 모든 increase와 decrease 버튼에 이벤트 추가
  const decreaseButtons = document.querySelectorAll(".decrease-btn");
  const increaseButtons = document.querySelectorAll(".increase-btn");

  decreaseButtons.forEach(function (button) {
    button.addEventListener("click", function () {
      const inputField = this.nextElementSibling;
      let currentValue = parseInt(inputField.value);

      // 최소값 1 이하로 내려가지 않도록 설정
      if (currentValue > parseInt(inputField.min)) {
        inputField.value = currentValue - 1;
      }
    });
  });

  increaseButtons.forEach(function (button) {
    button.addEventListener("click", function () {
      const inputField = this.previousElementSibling;
      let currentValue = parseInt(inputField.value);

      // 값 증가
      inputField.value = currentValue + 1;
    });
  });

  // 전체체크박스 선택/해제
  function selectAll(selectAllCheckbox) {
    const items = document.getElementsByName("select-item");
    items.forEach((item) => {
      item.checked = selectAllCheckbox.checked;
    });
    updateSelectAllLabel();
  }

  // 개별체크박스 선택/해제 & 전체체크박스 갱신
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

    const label = document.querySelector('label[for="checkbtn"]');
    label.innerText = `전체 선택 (${checkedItems}/${totalItems})`;

    const checkoutBtn = document.querySelector(".checkout-btn");
    checkoutBtn.innerText = `주문하기 (${checkedItems}개)`;
  }

  // 선택된 항목 삭제 (DB삭제)
  function deleteSelected() {
    //
  }

  //수량변경
  function changeAmount(amount) {
    const amountInput = document.getElementById("amount-box");
    let currentAmount = parseInt(amountInput.value);
    let newAmount = currentAmount + amount;

    if (newAmount < 1) {
      newAmount = 1;
    }

    amountInput.value = newAmount;
  }

  // 이벤트 바인딩
  const selectAllCheckbox = document.querySelector(
    'input[name="selectAll-item"]'
  );
  selectAllCheckbox.addEventListener("click", () =>
    selectAll(selectAllCheckbox)
  );

  const itemCheckboxes = document.querySelectorAll('input[name="select-item"]');
  itemCheckboxes.forEach((checkbox) => {
    checkbox.addEventListener("click", selectItem);
  });
});

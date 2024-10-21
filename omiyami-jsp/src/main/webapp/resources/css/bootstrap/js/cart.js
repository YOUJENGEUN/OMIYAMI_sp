document.addEventListener('DOMContentLoaded', function() {
  // 전체 선택 체크박스
  var checkAll = document.getElementById('checkAll');
  var itemCheckboxes = document.querySelectorAll('input[name="product_ids"]');
  var selectAllLabel = document.querySelector('label[for="checkAll"]');

  // 주문하기 버튼 및 주문 금액 표시 요소
  var checkoutButton = document.querySelector('.checkout-btn');
  var totalOrderAmount = document.getElementById('total-order-amount');
  var shippingFeeElement = document.getElementById('shipping-fee');
  var finalPaymentAmount = document.getElementById('final-payment-amount');
  var rewardPointElement = document.getElementById('reward-point'); // 적립 포인트 표시 요소

  // 수량 조절 버튼 찾기
  var decreaseButtons = document.querySelectorAll('.decrease-btn');
  var increaseButtons = document.querySelectorAll('.increase-btn');

  // 전체 선택 기능
  checkAll.addEventListener('change', function () {
    var isChecked = checkAll.checked;
    itemCheckboxes.forEach(function(checkbox) {
      checkbox.checked = isChecked;
    });
    updateSelectAllLabel();
    updateOrderCount();
    updateTotalOrderAmount();
  });

  // 개별 체크박스 클릭 시 전체 선택 여부 갱신
  itemCheckboxes.forEach(function(checkbox) {
    checkbox.addEventListener('change', function () {
      var allChecked = Array.from(itemCheckboxes).every(cb => cb.checked);
      checkAll.checked = allChecked;
      updateSelectAllLabel();
      updateOrderCount();
      updateTotalOrderAmount();
    });
  });

  // 선택 갯수 업데이트 함수
  function updateSelectAllLabel() {
    var checkedCount = Array.from(itemCheckboxes).filter(cb => cb.checked).length;
    selectAllLabel.textContent = '전체 선택 (' + checkedCount + '/' + itemCheckboxes.length + ')';
  }

  // 수량 감소 버튼 클릭 이벤트
  decreaseButtons.forEach(function(button) {
    button.addEventListener('click', function() {
      var quantityInput = this.nextElementSibling;
      var currentQuantity = parseInt(quantityInput.value);
      if (currentQuantity > 1) {
        modifyCartQuantity(this, currentQuantity - 1);
      }
    });
  });

  // 수량 증가 버튼 클릭 이벤트
  increaseButtons.forEach(function(button) {
    button.addEventListener('click', function() {
      var quantityInput = this.previousElementSibling;
      var currentQuantity = parseInt(quantityInput.value);
      modifyCartQuantity(this, currentQuantity + 1);
    });
  });

  // AJAX를 통해 서버에 수량 업데이트 요청 보내기
  function modifyCartQuantity(button, newQuantity) {
    var cartItem = button.closest('.cart-item');
    var productId = cartItem.getAttribute('data-product-id');
    var productPrice = parseFloat(cartItem.getAttribute('data-product-price'));
    
    // 서버에 수량 업데이트 요청 보내기
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/cart/update', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        button.closest('.cart-item-quantity').querySelector('.quantity-input').value = newQuantity;
        updateTotalPrice(cartItem, newQuantity);
        updateTotalOrderAmount(); // 수량 변경 시 총 주문 금액도 업데이트
        console.log('Cart quantity modified successfully');
      }
    };
    xhr.send('product_id=' + productId + '&quantity=' + newQuantity);
  }

  function updateTotalPrice(cartItem, newQuantity) {
    // 총 가격을 업데이트할 요소를 찾음
    var totalPriceElement = cartItem.querySelector('.total-price');
    
    // data-price 속성에서 개별 상품의 가격을 가져옴
    var productPrice = parseFloat(totalPriceElement.getAttribute('data-price'));

    // 가격과 수량 값이 숫자인지 확인
    if (isNaN(productPrice) || isNaN(newQuantity)) {
      console.error("Invalid number detected");
      return;
    }

    // 총 가격 계산
    var newTotalPrice = productPrice * newQuantity;

    // 총 가격을 포맷된 문자열로 업데이트
    totalPriceElement.textContent = new Intl.NumberFormat().format(newTotalPrice) + '원';
  }

  // 선택된 갯수를 주문하기 버튼에 반영하는 함수
  function updateOrderCount() {
    var selectedCount = Array.from(itemCheckboxes).filter(cb => cb.checked).length;
    checkoutButton.textContent = `주문하기 (${selectedCount}개)`;
  }

  // 선택된 상품의 총 가격을 주문 금액에 반영하는 함수
  function updateTotalOrderAmount() {
    var totalAmount = 0;
    var shippingFee = 0;

    itemCheckboxes.forEach(function(checkbox) {
      if (checkbox.checked) {
        var cartItem = checkbox.closest('.cart-item');
        var quantity = parseInt(cartItem.querySelector('.quantity-input').value);
        var productPrice = parseFloat(cartItem.querySelector('.total-price').getAttribute('data-price'));
        
        if (!isNaN(quantity) && !isNaN(productPrice)) {
          totalAmount += quantity * productPrice;
        }
      }
    });

    // 배송비 설정 (5만원 미만일 경우 3천원)
    if (totalAmount < 50000) {
      shippingFee = 3000;
    } else {
      shippingFee = 0;
    }

    // 총 주문 금액 및 배송비 업데이트
    totalOrderAmount.textContent = new Intl.NumberFormat().format(totalAmount) + '원';
    shippingFeeElement.textContent = new Intl.NumberFormat().format(shippingFee) + '원';

    // 예정 결제 금액 계산 및 업데이트
    var finalAmount = totalAmount + shippingFee;
    finalPaymentAmount.textContent = new Intl.NumberFormat().format(finalAmount) + '원';

    // 예정 적립 포인트 계산 및 업데이트 (주문 금액의 1%)
    var rewardPoints = Math.floor(totalAmount * 0.01);
    rewardPointElement.textContent = rewardPoints + 'p';
  }

  // 초기화 시 갯수 및 총 가격 업데이트
  updateSelectAllLabel();
  updateOrderCount();
  updateTotalOrderAmount();
});

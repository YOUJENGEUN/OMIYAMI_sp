function openTab(contentId) {
    var content1 = document.getElementById(contentId); //첫 번째 내용이 있는 행

    var isVisible = content1.style.display === 'table-row';
    
    // 모든 내용을 숨기기
    document.querySelectorAll('.content-wrapper').forEach(content =>
        content.style.display = 'none');
    
    // 클릭한 제목의 내용 보이기/숨기기
    content1.style.display = isVisible ? 'none' : 'table-row'; //block으로 할 시 테이블 형식 X

    // 두 번째 내용을 첫 번째 내용과 동시에 보이기/숨기기
    var content2 = content1.nextElementSibling; //첫 번째 내용이 있는 행의 다음 행
    
    if (content2 && content2.classList.contains('content-wrapper')) { //두 번째 내용을 나타내는 행인지
      content2.style.display = isVisible ? 'none' : 'table-row';
    }
}

function toggleOrderInput(select) {
  var orderInput = document.getElementById('order-input');

  // '직접 입력'일 때 input 태그 보이기, 그렇지 않으면 숨기기
  if (select.value === 'other') {
      orderInput.style.display = 'block';
      orderInput.focus();
  } else {
      orderInput.style.display = 'none';
  }
}

/* 페이지네이션 로직 => 어차피 JSP에서 Java로 구현될 듯 하니 보류!

  let currentPage = 1;  // 현재 페이지 수
  const totalPages = 10;  // (서버에서 받아오는) 전체 페이지 수
  const maxPageItems = 5;  // 최대 페이지 번호 수

  // 페이지네이션 동적 생성
  function renderPagination(page) {
    const pagination = document.getElementById('pagination');
    pagination.innerHTML = '';  // 기존 페이지네이션 번호 제거

    // 이전 페이지 버튼
    let prevItem = document.createElement('li');
    prevItem.classList.add('page-item', page === 1 ? 'disabled' : '');
    prevItem.innerHTML = `<a class="page-link" href="#" onclick="changePage(${page - 1}); return false;">Previous</a>`;
    pagination.appendChild(prevItem);

    // 페이지 번호 범위 계산
    const startPage = Math.max(1, page - Math.floor(maxPageItems / 2));
    const endPage = Math.min(totalPages, startPage + maxPageItems - 1);

    // 동적으로 페이지 번호 생성
    for (let i = startPage; i < endPage; i++) {
      let pageItem = document.createElement('li');
      pageItem.classList.add('page-item', i === page ? 'active' : '');
      pageItem.innerHTML = `<a class="page-link" href="#" onclick="changePage(${i}); return false;">${i}</a>`;
      pagination.appendChild(pageItem);
    }

    // 다음 페이지 버튼
    let nextItem = document.createElement('li');
    nextItem.classList.add('page-item', page === totalPages ? 'disabled' : '');
    nextItem.innerHTML = `<a class="page-link" href="#" onclick="changePage(${page + 1}); return false;">Next</a>`;
    pagination.appendChild(nextItem);
  }

  // 페이지 번호를 변경
  function changePage(page) {
    if (page < 1 || page > totalPages) return;  // 유효한 페이지 번호인지 확인
    currentPage = page;  // 현재 페이지 업데이트
    loadPageData(page);  // 새로운 페이지 데이터 로드
    renderPagination(page);  // 페이지네이션 재생성
  }

  // 페이지 데이터 로드
  function loadPageData(page) {
    // 서버 요청을 통해 데이터를 가져오는 부분 - 로그
    console.log(`Loading data for page ${page}`);
    
    // 서버에서 받은 데이터를 이곳에 업데이트
    document.getElementById('board-content').innerText = `Content of Page ${page}`;
  }

  // 초기 페이지 로드
  renderPagination(currentPage);
  loadPageData(currentPage);

*/
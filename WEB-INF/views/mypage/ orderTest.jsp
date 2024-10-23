<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 관리 테스트</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        .btn {
            padding: 5px 10px;
            margin: 2px;
            cursor: pointer;
        }
        .status-section {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>주문 관리 테스트</h2>

        <!-- 주문 통계 섹션 -->
        <div class="status-section">
            <h3>주문 현황</h3>
            <p>전체 주문 수: <span id="totalOrders">0</span></p>
            <p>취소된 주문 수: <span id="cancelledOrders">0</span></p>
        </div>

        <!-- 주문 입력 폼 -->
        <div>
            <h3>새 주문 등록</h3>
            <form id="orderForm">
                <p>
                    <label>사용자 ID:</label>
                    <input type="number" name="userId" required>
                </p>
                <p>
                    <label>주문명:</label>
                    <input type="text" name="orderName" required>
                </p>
                <p>
                    <label>총액:</label>
                    <input type="number" name="totalAmount" step="0.01" required>
                </p>
                <button type="submit" class="btn">주문 등록</button>
            </form>
        </div>

        <!-- 주문 목록 테이블 -->
        <h3>주문 목록</h3>
        <table>
            <thead>
                <tr>
                    <th>주문 ID</th>
                    <th>사용자 ID</th>
                    <th>주문명</th>
                    <th>상태</th>
                    <th>총액</th>
                    <th>주문일시</th>
                    <th>작업</th>
                </tr>
            </thead>
            <tbody id="orderList">
            </tbody>
        </table>
    </div>

    <script>
        // 주문 목록 조회
        function loadOrders() {
            $.ajax({
                url: '/order',
                type: 'GET',
                success: function(data) {
                    var tbody = $('#orderList');
                    tbody.empty();
                    
                    data.forEach(function(order) {
                        var row = $('<tr>');
                        row.append($('<td>').text(order.orderId));
                        row.append($('<td>').text(order.userId));
                        row.append($('<td>').text(order.orderName));
                        row.append($('<td>').text(order.status));
                        row.append($('<td>').text(order.totalAmount.toFixed(2)));
                        row.append($('<td>').text(new Date(order.orderDate).toLocaleString()));
                        
                        var actions = $('<td>');
                        if(order.status !== '주문취소') {
                            actions.append(
                                $('<button>')
                                    .text('취소')
                                    .addClass('btn')
                                    .click(function() {
                                        cancelOrder(order.orderId);
                                    })
                            );
                        }
                        actions.append(
                            $('<button>')
                                .text('삭제')
                                .addClass('btn')
                                .click(function() {
                                    deleteOrder(order.orderId);
                                })
                        );
                        
                        row.append(actions);
                        tbody.append(row);
                    });
                }
            });
        }

        // 주문 통계 조회
        function loadOrderStats() {
            $.ajax({
                url: '/order/count',
                type: 'GET',
                success: function(data) {
                    $('#totalOrders').text(data.totalOrders);
                    $('#cancelledOrders').text(data.cancelledOrders);
                }
            });
        }

        // 주문 취소
        function cancelOrder(orderId) {
            if(confirm('주문을 취소하시겠습니까?')) {
                $.ajax({
                    url: '/order/' + orderId + '/cancel',
                    type: 'POST',
                    success: function() {
                        loadOrders();
                        loadOrderStats();
                    }
                });
            }
        }

        // 주문 삭제
        function deleteOrder(orderId) {
            if(confirm('주문을 삭제하시겠습니까?')) {
                $.ajax({
                    url: '/order/' + orderId,
                    type: 'DELETE',
                    success: function() {
                        loadOrders();
                        loadOrderStats();
                    }
                });
            }
        }

        // 주문 등록
        $('#orderForm').submit(function(e) {
            e.preventDefault();
            var formData = {
                userId: $('input[name=userId]').val(),
                orderName: $('input[name=orderName]').val(),
                totalAmount: $('input[name=totalAmount]').val(),
                status: '주문완료'
            };

            $.ajax({
                url: '/order',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function() {
                    $('#orderForm')[0].reset();
                    loadOrders();
                    loadOrderStats();
                }
            });
        });

        // 페이지 로드 시 초기 데이터 로딩
        $(document).ready(function() {
            loadOrders();
            loadOrderStats();
        });
    </script>
</body>
</html>
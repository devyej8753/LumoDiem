<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 상세조회</title>

<link rel="stylesheet" href="<c:url value='/chatcss/chat.css'/>">


</head>
<body>
<%@ include file="/views/include/nav.jsp" %>

<div id="colorlib-main">
  <section class="ftco-section ftco-no-pt ftco-no-pb">
    <div class="container">
      <div class="row d-flex">
        <div class="col-xl-8 py-5 px-md-5">
          <div class="row pt-md-4">

            <div class="klass_detail"
              style="
                max-width: 100%; 
                margin: 0 auto; 
                border: 1px solid #ddd; 
                border-radius: 10px; 
                padding: 20px; 
                box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
              ">
            <h3 style="text-align: center; margin-bottom: 20px;">클래스 상세 정보</h3>
				
              <c:choose>
                <c:when test="${klass.accountNo eq account.accountNo or account.accountGrade eq 'A'}">
                	 <!-- 추가 -->
	                  <div style="text-align: right; margin-bottom: 10px;">
	                    <a href="/klassBoardUpdate?klass_no=${klass.klassNo}" style="text-decoration: none;">
	                      <button type="button" id="updateBtn" name="updateBtn"
	                        style="background: #D1B5E0; color: white; border: none; 
	                               padding: 8px 12px; border-radius: 5px; cursor: pointer;">
	                        수정
	                      </button>
	                    </a>
	                    <button type="button" id="deleteBtn" name="deleteBtn"
	                      style="background: #FF6058; color: white; border: none; 
	                             padding: 8px 12px; border-radius: 5px; cursor: pointer;">
	                      삭제
	                    </button>
	                  </div>
                </c:when>
              </c:choose>

              <input type="hidden" value="${klass.klassNo}" name="klass_no">

              <ul style="list-style: none; padding: 0;">
                <li style="text-align: center; margin-bottom: 20px;">
                  <c:choose>
					<c:when test="${not empty klassAttach}">
						<c:forEach var="list" varStatus="vs" items="${klassAttach }">
				          <img alt="사진" src="<%=request.getContextPath()%>/klassFilePath?attach_no=${list.attachNo}" 
				          style="max-width: 100%; max-height: 100%;" >
						</c:forEach>
					</c:when>
					<c:otherwise>
						<img alt="썸네일" src="/views/mainpage/thumbnail.jpg" style="height: 244px; width:244px;">
					</c:otherwise>
				</c:choose>
                </li>
                <li>
                  <table style="width: 100%; border-collapse: collapse; ">
                    <tr style="border-bottom: 1px solid #ddd;">
                      <th style="font-weight: bold; padding: 8px;">클래스명</th>
                      <td style="padding: 8px;">${klass.klassName}</td>
                    </tr>
                    <tr style="border-bottom: 1px solid #ddd;">
                      <th style="font-weight: bold; padding: 8px;">주최자</th>
                      <td style="padding: 8px;">${klass.accountNickname}</td>
                    </tr>
                    <tr style="border-bottom: 1px solid #ddd;">
                      <th style="font-weight: bold; padding: 8px;">일정</th>
                      <td style="padding: 8px;">
                        <c:forEach var="li" items="${klassDate}">
                          ${fn:substring(li.klassStart,0,10)}<br>
                        </c:forEach>
                      </td>
                    </tr>
                    <tr style="border-bottom: 1px solid #ddd;">
                      <th style="font-weight: bold; padding: 8px;">시간</th>
                      <td style="padding: 8px;">
                        <c:forEach var="li" items="${klassDate}">
                          ${fn:substring(li.klassStart,11,19)}<br>
                        </c:forEach>
                      </td>
                    </tr>
                    <tr style="border-bottom: 1px solid #ddd;">
                      <th style="font-weight: bold; padding: 8px;">최대(예약가능)</th>
                      <td style="padding: 8px;">
                        <c:forEach var="li" items="${klassDate}">
                          ${klass.klassMax}명 (${klass.klassMax - li.klassCount}명)<br>
                        </c:forEach>
                      </td>
                    </tr>
                    <tr style="border-bottom: 1px solid #ddd;">
                      <th style="font-weight: bold; padding: 8px;">주소</th>
                      <td style="padding: 8px;">${klass.klassAddress}</td>
                    </tr>
                    <tr style="border-bottom: 1px solid #ddd;">
                      <th style="font-weight: bold; padding: 8px;">수업료</th>
                      <td style="padding: 8px;">${klass.klassPrice}원</td>
                    </tr>
                    <tr style="border-bottom: 1px solid #ddd;">
                      <th style="font-weight: bold; padding: 8px;">작성일</th>
                      <td style="padding: 8px;">${klass.klassRegDate}</td>
                    </tr>

                    <!-- 예약 기능 (회원 Grade==M) -->
                    <c:choose>
                      <c:when test="${account.accountGrade eq 'M'}">
                        <tr style="border-bottom: 1px solid #ddd;">
                          <td colspan="2" style="text-align: center; padding: 10px;">
                            <div style="display: inline-flex; justify-content: center; align-items: center; gap: 10px;">
                              <select name="resKlassSelect" id="resKlassSelect">
                                <c:forEach var="date" items="${klassDate}">
                                  <option value="${date.klassDateNo}">
                                    ${date.klassStart} ~ ${fn:substring(date.klassEnd,11,19)}
                                  </option>
                                </c:forEach>
                              </select>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2" style="text-align: center; padding: 10px;">
                            <div style="display: inline-flex; justify-content: center; align-items: center; gap: 10px;">
                              <span id="minusSpan">➖</span>
                              <span id="numberSpan">1</span>
                              <span id="plusSpan">➕</span>
                              <button type="button" id="resBtn" name="resBtn"
                                style="background-color: #D1B5E0; color: white; border: 1px solid #d1c2dd; 
                                       border-radius: 8px; padding: 8px 16px; cursor: pointer;">
                                예약하기
                              </button>
                              <button type="button" id="cnclBtn" name="cnclBtn"
                                style="background-color: #F0F2EF; color: white; border: 1px solid #ccc; 
                                       border-radius: 8px; padding: 8px 16px; cursor: pointer;">
                                예약취소
                              </button>
                            </div>
                          </td>
                        </tr>
                      </c:when>
                    </c:choose>

                    <tr style="border-bottom: 1px solid #ddd;">
                      <td colspan="2" style="text-align: center; padding: 10px;">
                        <c:choose>
                          <c:when test="${myLikeCount eq 0}">
                            <div class="icon">
                              <span class="icon-heart-o" id="unlikeToLike" style="color: #f44336; font-size: 20px;">
                                ${totalLikeCount}
                              </span>
                            </div>
                          </c:when>
                          <c:otherwise>
                            <div class="icon">
                              <span class="icon-heart" id="likeToUnlike" style="color: #f44336; font-size: 20px;">
                                ${totalLikeCount}
                              </span>
                            </div>
                          </c:otherwise>
                        </c:choose>
                      </td>
                    </tr>
                  </table>
                </li>
                <li>
                  <br>
                  <!-- 게시글 내용 -->
                  <div>
                    ${klass.klassTxt}
                  </div>
                </li>
              </ul>
            </div>

            <!-- 🚨 신고 버튼 -->
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal"
              style="position: absolute; top: 10px; right: 10px; font-size: 14px; 
                     padding: 6px 8px; width: 40px; height: 40px; line-height: 1; 
                     border-radius: 50%; display: flex; align-items: center; justify-content: center;">
              🚨
            </button>
            <div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <input type="radio" name="reportKlass" id="abuse" value="욕설">
                    <label for="abuse">욕설</label><br>
                    <input type="radio" name="reportKlass" id="hateSpch" value="비하발언">
                    <label for="hateSpch">비하발언</label><br>
                    <input type="radio" name="reportKlass" id="improperNickname" value="부적절한 닉네임">
                    <label for="improperNickname">부적절한 닉네임</label><br>
                    <input type="radio" name="reportKlass" id="adv" value="광고">
                    <label for="adv">광고</label>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn-primary" id="reportBtn">신고</button>
                  </div>
                </div>
              </div>
            </div>
            <!-- 🚨 신고 버튼 끝 -->

            <!-- 리뷰 목록 -->
            <div style="width: 100%; max-width: 100%; margin: 20px auto; 
                        border: 1px solid #ddd; border-radius: 10px; padding: 10px;">
              <form>
                <table class="review_by_klass_list"
                  style="
                    width: 100%;
                    border-collapse: separate;
                    border-spacing: 0 5px;
                    text-align: center;
                    border: 1px solid #ddd;">
                    
                  <thead style="border-bottom: 2px solid #aaa; background-color: #D1B5E0;">
                    <tr style="border-bottom: 1px solid #ddd;">
                      <th style="width: 60px; padding: 8px;">No.</th>
                      <th style="width: 200px; padding: 8px;">제목</th>
                      <th style="width: 100px; padding: 8px;">닉네임</th>
                      <th style="width: 150px; padding: 8px;">작성일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:choose>
                      <c:when test="${not empty review}">
                        <c:forEach var="list" items="${review}" varStatus="vs">
                          <tr data-review-no="${list.reviewNo }" style="background-color: #E8DAEF; border-bottom: 1px solid #ddd;">
                            <td style="padding: 8px;">${vs.count}</td>
                            <td style="padding: 8px;">${list.reviewName}</td>
                            <td style="padding: 8px;">${list.accountNickname}</td>
                            <td style="padding: 8px;">${list.reviewRegDate}</td>
                          </tr>
                        </c:forEach>
                      </c:when>
                      <c:otherwise>
                        <tr style="background-color: #E8DAEF; border-bottom: 1px solid #ddd;">
                          <td colspan="4" style="padding: 8px;">
                            작성된 리뷰가 없습니다.
                          </td>
                        </tr>
                      </c:otherwise>
                    </c:choose>
                  </tbody>
                </table>
              </form>
            </div>
            <!-- 리뷰 목록 끝 -->

          </div><!-- row pt-md-4 끝 -->
        </div><!-- col-xl-8 끝 -->
      </div><!-- row 끝 -->
    </div><!-- container 끝 -->
  </section>
</div><!-- colorlib-main 끝 -->


<!-- 채팅 패널 (원본) -->
<!-- position: fixed; top: 100px; right: 20px; width: 300px; z-index: 999; -->

<!-- 채팅 패널 -->
<div style="
  position: fixed; 
  top: 100px; 
  right: 70px; 
  width: 380px; 
  z-index: 9999;
">
  <div class="card"
       style="
         border: 2px solid #D1B5E0; 
         border-radius: 10px;  
         box-shadow: 2px 2px 10px rgba(0,0,0,0.2);
       ">

    <!-- 카드 헤더 (진한 보라) -->
    <div class="card-header"
      style="
        background-color: #D1B5E0; 
        color: #fff; 
        font-weight: bold; 
        display: flex; 
        justify-content: space-between; 
        align-items: center;
      ">
      <span>Chat</span>
      <!-- 드롭다운 (새로고침 등) -->
      <div class="dropdown" style="position: relative;">
        <button type="button"
          class="btn btn-sm dropdown-toggle"
          style="
            background-color: #EBD1F3; 
            color: #333; 
            border: none; 
            padding: 4px 8px; 
            border-radius: 4px;
          "
          data-bs-toggle="dropdown"
          aria-expanded="false">
          ▼
        </button>
        <ul class="dropdown-menu" style="min-width:120px;">
          <li>
            <a id="refreshBtn" class="dropdown-item" style="cursor:pointer">
              새로고침
            </a>
          </li>
          <li>
            <a class="dropdown-item" target="_blank"
               href="https://www.istockphoto.com/kr/%EC%82%AC%EC%A7%84/cute-corgi-dog-in-a-wildflower-cage-sits-on-a-summer-sunny-meadow-gm1967994177-558259453">
              😉빛나는 하루!😉
            </a>
          </li>
        </ul>
      </div>
    </div>
    <!-- 카드 헤더 끝 -->

    <!-- 카드 바디 (채팅 내용) -->
    <div class="card-body" id="chatBody"
      style="
        display: flex; 
        height: 400px; 
        overflow-y: auto; 
        justify-content: center; 
        align-items: center;
      ">
      <!-- 채팅방 입장하기 버튼 (초기) -->
      <button type="button" id="chatStartBtn"
        style="
          background-color: #E8DAEF; 
          color: #2c3e50; 
          border: 1px solid #d1c2dd; 
          border-radius: 8px; 
          padding: 8px 16px; 
          cursor: pointer;
        ">
        채팅방 입장하기
      </button>
      <!-- 실제 채팅 메시지 목록 (처음엔 display:none) -->
      <ul class="chat" id="chatUl"
        style="
          list-style:none; 
          margin:0; 
          padding:0; 
          display:none;
        ">
        <!-- JS에서 메시지 append -->
      </ul>
    </div>
    <!-- 카드 바디 끝 -->

    <!-- 카드 푸터 (메시지 입력) -->
    <div class="card-footer" style="padding: 8px; background-color: #f0f0f0;">
      <div style="display: flex;">
        <input id="sendInput" type="text" placeholder="메세지를 입력해주세요."
          style="
            flex: 1; 
            padding: 6px; 
            border: 1px solid #ccc; 
            border-radius: 4px; 
            margin-right: 8px;
          ">
        <button type="button" id="sendBtn"
          style="
            background-color: #f8e1f8; 
            border: 1px solid #dcb3dc; 
            color: #333; 
            border-radius: 4px; 
            padding: 6px 12px; 
            cursor: pointer;
          ">
          Send
        </button>
      </div>
    </div>
  </div>
</div>



<script>
  // 자바스크립트 변수는 문자열로 받아서 에러 방지
  const klassNo = "${klass.klassNo}";
  const accountNo = "${account.accountNo}";
  const res_no = "${res_no}"; // 예약번호(없으면 "")

  // === 신고하기 ===
  $('#reportBtn').click(function(){
    let rp = $('.modal-body input[name="reportKlass"]:checked').val();
    console.log(rp, klassNo, accountNo);
    const rpCheck = confirm("신고하시겠습니까?");
    if(rpCheck){
      $.ajax({
        url : "/klassReport",
        type : "post",
        data : {"klass_no": klassNo, "account": accountNo, "report_klass_txt": rp},
        dataType : "json",
        success : function(data){
          alert(data.res_msg);
          if(data.res_code == "200"){
            location.href="/klassBoardList";
          } else {
            location.href="/";
          }
        }
      });
    }
  });
  
  // === 댓글 클릭시 리뷰 상세페이지 넘김 === 
  $('.review_by_klass_list tr').click(function(){
		const reviewNum = $(this).data('review-no');
		if(reviewNum != null && reviewNum >0){
			location.href='/reviewDetail?review_no='+reviewNum;
		}
	})	
  

  // === 삭제 ===
  $('#deleteBtn').click(function(){
    const attachNo = "${klass.attachNo}";
    const check = confirm("삭제하시겠습니까?");
    if(check){
      $.ajax({
        url : "klassBoardDelete",
        type : "post",
        data : {"klass_no": klassNo, "attach_no": attachNo},
        dataType : "JSON",
        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        success : function(data){
          if(data.res_code == "200"){
            alert(data.res_msg);
            location.href="/klassBoardList";
          } else {
            alert(data.res_msg);
            location.href='/klassDetail?klass_no='+klassNo;
          }
        }
      });
    }
  });

  // === +/- 인원 ===
  $('#minusSpan').click(function(){
    let downPpl = $('#numberSpan').text();
    let downResCnt = Number(downPpl);
    if(downResCnt > 1){
      downResCnt--;
      $('#numberSpan').text(downResCnt);
    }
  });
  $('#plusSpan').click(function(){
    let upPpl = $('#numberSpan').text();
    let upRescnt = Number(upPpl);
    if(upRescnt < 4){
      upRescnt++;
      $('#numberSpan').text(upRescnt);
    }
  });

  // === 예약하기 ===
  $('#resBtn').click(function(){
    const klassDateNo = $('#resKlassSelect').val();
    const resPpltxt = $('#numberSpan').text();
    let resPpl = Number(resPpltxt);
    const ck = confirm("예약하시겠습니까?");
    if(ck){
      $.ajax({
        url : "/klassReservation",
        type : "post",
        data : {"klass_date_no": klassDateNo, "res_ppl": resPpl, "klass_no": klassNo},
        dataType: "json",
        success : function(data){
          alert(data.res_msg);
          if(data.res_code == "200"){
            window.location.href = data.paymentResponse.next_redirect_pc_url;
          } else {
            // 예약 실패 시 처리
          }
        },
        error : function(a,b,c){
          alert('결제 요청 중 오류 발생');
        }
      });
    }
  });

  // === 예약취소 ===
  $('#cnclBtn').click(function(){
	  
    if(!res_no || res_no == "" || res_no == "null"){
      alert("예약 정보가 없습니다.");
      return;
    }
    const deleteCheck = confirm("예약 취소하시겠습니까?");
    if(deleteCheck){
      $.ajax({
        url: "/cnclReservation",
        type:"post",
        data:{"res_no": res_no},
        dataType:"json",
        success:function(data){
          alert(data.res_msg);
          if(data.res_code == "200"){
            location.href="/klassBoardList";
          } else {
            location.href='/';
          }
        }
      });
    }
  });

  // === 좋아요(Like) ===
  $(function(){
    let unlikeToLike = "unlikeToLike";
    let likeToUnlike = "likeToUnlike";
    // 좋아요X -> 좋아요O
    $(document).on('click', '#unlikeToLike', function(){
      $.ajax({
        url : "/klassLikeChange",
        type : "post",
        data : {"klass_no": klassNo, "like": unlikeToLike},
        dataType : 'json',
        success : function(data){
          if(data.res_code == "200"){
            alert('좋아요!');
            $('#unlikeToLike').text(data.newTotalLikeCount);
            $('#unlikeToLike').attr("id","likeToUnlike")
                              .removeClass('icon-heart-o')
                              .addClass('icon-heart');
          } else {
            alert('오류. 홈페이지로 이동합니다.');
            location.href="/";
          }
        },
        error : function(){ alert('ajax 실패1'); }
      });
    });
    // 좋아요O -> 좋아요X
    $(document).on('click', '#likeToUnlike', function(){
      $.ajax({
        url : "/klassLikeChange",
        type : "post",
        data : {"klass_no": klassNo, "like": likeToUnlike},
        dataType : 'json',
        success : function(data){
          if(data.res_code == "200"){
            alert('좋아요를 취소합니다.');
            $('#likeToUnlike').text(data.newTotalLikeCount);
            $('#likeToUnlike').attr("id","unlikeToLike")
                              .removeClass('icon-heart')
                              .addClass('icon-heart-o');
          } else {
            alert('오류. 홈페이지로 이동합니다.');
            location.href="/";
          }
        },
        error : function(){ alert('ajax 실패2'); }
      });
    });
  });

  // === 채팅 기능 ===
  // AJAX 불러오기
  const chatAjax = function(klassNoPara, chatTxtPara, klassAccountNoPara){
    return $.ajax({
      url : "/klassChat",
      type : "post",
      data : {
        "chatTxt": chatTxtPara,
        "klassAccountNo": klassAccountNoPara,
        "klassNo": klassNoPara
      },
      dataType : 'json',
      success : function(data){
        $('#chatUl').html('');
        if(data.res_code == "200"){
          let val = "";
          for(let i=0; i<data.chatList.length; i++){
        	  if(data.chatList[i].includes("(Member)")){
					val += '<li class="left clearfix"><div class="chat-body clearfix" style="text-align: right"><strong class="primary-font">' + '</strong><p style="text-align: right">' + data.chatList[i] + '</p></div></li>';									
				} else{
					val += '<li class="right clearfix"><div class="chat-body clearfix" style="text-align: left"><strong class="primary-font">' + '</strong><p style="text-align: left">' + data.chatList[i] + '</p></div></li>';
				}
			}
          $('#chatUl').append(val).show();
        } else {
          alert('오류. 홈페이지로 이동합니다.');
          location.href="/";
        }
      },
      error : function(){
        alert('채팅 불러오기에 실패했습니다.');
      }
    });
  };

  // 채팅방 입장
  $(document).on('click', '#chatStartBtn', function(){
    alert('채팅방에 입장합니다!');
    $('#chatStartBtn').hide();
    // 3초 간격으로 새로고침
    setInterval(function(){
      $('#refreshBtn').click();
    }, 3000);
  });

  // 채팅 전송 (버튼)
  $(document).on('click', '#sendBtn', function(){
    let klassAccountNo = "${klass.accountNo}";
    let chatTxt = $('#sendInput').val();
    $('#chatStartBtn').hide();
    if(chatTxt == ''){
      alert('메세지를 입력해주세요!');
      return;
    }
    if(chatTxt.includes("(Host)") || chatTxt.includes("(Member)")){
      alert('금칙어 (Host), (Member) 가 들어있습니다.');
      return;
    }
    chatAjax(klassNo, chatTxt, klassAccountNo).done(function(){
      $('#sendInput').val('');
      $('#chatBody').scrollTop($('#chatBody')[0].scrollHeight);
    });
  });

  // 채팅 전송 (Enter)
  $(document).on('keyup', '#sendInput', function(e){
    if(e.key === 'Enter'){
      $('#sendBtn').click();
    }
  });

  // 채팅 새로고침
  $(document).on('click', '#refreshBtn', function(){
    chatAjax(klassNo).done(function(){
      $('#chatBody').scrollTop($('#chatBody')[0].scrollHeight);
    });
  });
</script>
</body>
</html>
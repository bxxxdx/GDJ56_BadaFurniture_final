<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/> 

<!-- 주소검색 api -->
<!-- <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<!-- <script src="https://ssl.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js?autoload=false"></script> -->
<script src = "https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<!-- css -->
<link rel="stylesheet" href="${path }/resources/css/member/enroll.css"/>

<section>
	 <div class="flexDiv" style="justify-content: center;">
        <h1 style="color: #348492; font-size: 40px;">회원가입</h1>
    </div>
    <br>

    <div class="flexDiv" style="justify-content: center;">
        <div id="enrollDiv">
            <form action="${path}/member/enrollMemberEnd.do" method="post" onsubmit="return fn_invalidate();">
                <br>
                <div class="flexDiv" style="justify-content: center;">
                    <div style="border: 1px solid grey; width: 80%;">
                        <h5> ❗ 계좌번호 제외 모두 필수 입력항목입니다.</h5>
                        <h5> ❗ 아이디는 4글자 이상 영문자/숫자로만 구성할 수 있습니다.</h5>
                        <h5> ❗ 비밀번호는 8글자 이상, 영문자/숫자로만 구성할 수 있습니다.</h5>
                    </div>
                </div>
                <br>
                
                <div class="flexDiv" style="justify-content: center;">
                    <div id="inputDiv">
		            	<div class="flexDiv">
		                    <img src="${path }/resources/images/member/아이디.png">
		                    <div class="input-container">		
		                        <input type="text" name="memberId" id="id" class="form__input" placeholder="아이디" required/>
		                        
		                        <label class="form__label" id="idTxt">아이디</label>
		                    </div>
		                    <input type="button" class="oribtn" id="idcheck" value="중복확인">
		                </div>
		                <br>
		                
		                <script>
		                	//아이디 중복확인
		                	$("#idcheck").click(function(){
		                	/* $("input[name=memberId]").keyup(function(){ */
		                		$.ajax({
		                			url: "${path}/member/idDuplicate.do",
		                			data: {memberId: $("#id").val()},
		                	         success:data=>{
		                				if(data=='true'){  //중복된 아이디가 있음
		                					$("#idTxt").html("<span id='idTxtcheck'>중복된 아이디입니다</span>")
	                        				$("#idTxtcheck").css({
	                        					"color" : "#FA3E3E",
	                        					"font-weight" : "bold",
	                        					"font-size" : "14px"
	                        				});
		                					
		                					alert("중복된 아이디입니다");
		                					$("input[name=id]").val("");
		                			
		                				}else{ //중복된 아이디 없음
		                					$("#idTxt").html("<span id='idTxtcheck'>사용가능한 아이디입니다</span>")
	                        				$("#idTxtcheck").css({
	                        					"color" : "#0D6EFD",
	                        					"font-weight" : "bold",
	                        					"font-size" : "14px"
	                        				});
		                				}
		                			}
		                		});
		                	});
		                </script>
		                
                        <div class="flexDiv">
                            <img src="${path }/resources/images/member/메일.png">
                            <div class="input-container" >
                                <input type="email" name="email" id="email" class="form__input" placeholder="이메일" required/>
                                <label class="form__label" id="mailTxt">이메일</label>
                            </div>
                           <input type="button" class="oribtn" id="emailcheck" value="중복확인" required>
                           <input type="button" class="oribtn" id="emailAuthentication" value="이메일인증" hidden>
                        </div>
                        <br>
                        <div class="flexDiv">
                            <img src="${path }/resources/images/member/이메일체크.png" width="">
                            <div class="input-container">
                                <input type="text" name="emailck" class="form__input" id="memailconfirm" placeholder="인증번호" required/>
                                <label class="form__label" id="memailconfirmTxt">인증번호</label>
                            </div>
                            <!-- <input type="button" class="oribtn" value="인증확인"> -->		
                        </div>
                        <br>
                        
                        <script>
	                      	//이메일 정규표현식
	            			$("input[name=email]").blur(e=>{
            					const userEmail=$("input[name=email]").val().trim();
            					const emailChk=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])+@[a-z]+\.[a-z]{2,3}/
            					
            					if(!emailChk.test(userEmail)){
            						setTimeout(function(){ 
            							alert("⛔ 이메일을 정확히 입력해주세요 ⛔");
            							$("input[name=email]").val("");
            						}, 10);
            					}					
	            			});
                        	
                        	//이메일 중복확인
		                	$("#emailcheck").click(function(){
		                		const email = $("input[name=email]").val();
		                		$.ajax({
		                			url: "${path}/member/emailDuplicate.do",
		                			data: {email: email},
		                	         success:data=>{
		                				if(data=='true'){  //중복된 이메일 있음
		                					$("#mailTxt").html("<span id='mailTxtcheck'>중복된 이메일입니다</span>")
	                        				$("#mailTxtcheck").css({
	                        					"color" : "#FA3E3E",
	                        					"font-weight" : "bold",
	                        					"font-size" : "14px"
	                        				});
		                			
		                				}else{ //중복된 이메일 없음
		                					$("#mailTxt").html("<span id='mailTxtcheck'>사용가능한 이메일입니다</span>")
	                        				$("#mailTxtcheck").css({
	                        					"color" : "#0D6EFD",
	                        					"font-weight" : "bold",
	                        					"font-size" : "14px"
	                        				});
		                					$("#emailAuthentication").attr("hidden",false);
		                				}
		                			}
		                		});
		                	});
                        
                        	
	                     	// 이메일 인증번호
	                        $("#emailAuthentication").click(function() {
	                           $.ajax({
	                              type : "POST",
	                              url : "login/mailConfirm",
	                              data : {
	                                 "email" : $("#email").val()
	                              },
	                              success : function(data){
	                                 alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
	                                 console.log("data : "+data);
	                                 chkEmailConfirm(data, $("#memailconfirm"), $("#memailconfirmTxt"));
	                              }
	                           });
	                        });

                        	// 이메일 인증번호 체크 함수
                        	function chkEmailConfirm(data){
                        		$("#memailconfirm").on("blur", function(){
                        			if (data != $("#memailconfirm").val()) { 
                        				emconfirmchk = false;
                        				$("#memailconfirmTxt").html("<span id='emconfirmchk'>인증번호가 불일치</span>")
                        				$("#emconfirmchk").css({
                        					"color" : "#FA3E3E",
                        					"font-weight" : "bold",
                        					"font-size" : "14px"
                        				});
                        				
                        				alert("인증번호가 틀렸습니다.");
        	            				$("input[name=emailck]").val("");
                        				
                        			} else { // 아니면 중복아님
                        				emconfirmchk = true;
                        				$("#memailconfirmTxt").html("<span id='emconfirmchk'>인증번호 확인 완료</span>")

                        				$("#emconfirmchk").css({
                        					"color" : "#0D6EFD",
                        					"font-weight" : "bold",
                        					"font-size" : "14px"
                        				});
                        			}
                        		});
                        	}
                        </script>
                        
                        <div class="flexDiv">
                            <img src="${path }/resources/images/member/비밀번호.png">
                            <div class="input-container">		
                                <input type="password" name="password" id="pw" class="form__input" placeholder="비밀번호" required/>
                                <label class="form__label">비밀번호</label>
                            </div>
                        </div>
                        <br>
                        <div class="flexDiv">
                            <img src="${path }/resources/images/member/비밀번호체크.png">
                            <div class="input-container">		
                                <input type="password" name="passwordck" id="pwck" class="form__input" placeholder="비밀번호 확인" required/>
                                <label class="form__label" id="passwordckTxt">비밀번호 확인</label>
                            </div>
                        </div>
                        <br>
                        
                        <script>
	            			//비밀번호 확인
							$("input[name=passwordck]").keyup(e=>{
								const pw = $("#pw").val();
								const pwck = $("input[name=passwordck]").val();
								
								if(pw!=pwck){
									$("#passwordckTxt").html("<span id='passwordck'>비밀번호 불일치</span>")
                    				$("#passwordck").css({
                    					"color" : "#FA3E3E",
                    					"font-weight" : "bold",
                    					"font-size" : "14px"
                    				});
								}else{
									$("#passwordckTxt").html("<span id='passwordck'>비밀번호 일치</span>")
                    				$("#passwordck").css({
                    					"color" : "#0D6EFD",
                    					"font-weight" : "bold",
                    					"font-size" : "14px"
                    				});
								}
								
								$("#pwck").blur(e=>{
									const pw=$("#pw").val();
	            					const pwck=$("#pwck").val();
	            					if(pw!=pwck){
	            						$("#pwck").val('');
	            					}
								});
								
							});
                        </script>
                        
                        <div class="flexDiv">
                            <img src="${path }/resources/images/member/이름.png">
                            <div class="input-container">		
                                <input type="text" name="memberName" class="form__input" placeholder="이름" required/>
                                <label class="form__label">이름</label>
                            </div>
                        </div>
                        <br>
                        <div class="flexDiv">
                            <img src="${path }/resources/images/member/전화.png">
                            <div class="input-container">
                                <input type="text" name="phone" class="form__input" placeholder="전화번호(-포함)" required/>
                                <label class="form__label">전화번호</label>		
                            </div>
                        </div>
                        <br>
                        
                        <div class="flexDiv">
                            <img src="${path }/resources/images/member/은행.png">
                            <div class="input-container">
								<select name="bankName">
									<option value="">은행명 선택</option>
			                        <option value="국민은행">국민은행</option>
			                        <option value="기업은행">기업은행</option>
			                        <option value="농협중앙회">농협중앙회</option>
			                        <option value="새마을금고">새마을금고</option>
			                        <option value="수협중앙회">수협중앙회</option>
			                        <option value="신한은행">신한은행</option>
			                        <option value="외환은행">외환은행</option>
			                        <option value="우리은행">우리은행</option>
			                        <option value="우체국">우체국</option>
			                        <option value="카카오뱅크">카카오뱅크</option>
			                        <option value="케이뱅크">케이뱅크</option>
			                        <option value="하나은행">하나은행</option>
			                        <option value="한국씨티은행">한국씨티은행</option>
			                        <option value="HSBC은행">HSBC은행</option>
			                        <option value="SC제일은행">SC제일은행</option>
								</select>
                                <!-- <input type="text" name="bankName" class="form__input" placeholder="거래은행"/>
                                <label class="form__label">거래은행</label> -->		
                            </div>
                        </div>
                        <br>
                        <div class="flexDiv">
                            <img src="${path }/resources/images/member/계좌번호.png">
                            <div class="input-container">
                                <input type="text" name="accountCode" class="form__input" placeholder="계좌번호(-포함)"/>
                                <label class="form__label">계좌번호</label>		
                            </div>
                        </div>
                        <br>
                        
                        <div class="flexDiv">
                            <img src="${path }/resources/images/member/주소.png">
                            <input type="button" value="주소찾기" class="oribtn" onclick="sample5_execDaumPostcode()">
                        </div>
                        <br>
                        <div class="flexDiv">
                            <img src="${path }/resources/images/member/그림.png">
                            <div class="input-container">
                                <input type="text" id="postCode" name="postCode" class="form__input" placeholder="우편번호" required readonly/>
                                <label class="form__label">우편번호</label>		
                            </div>
                        </div>
                        <br>
                        <div class="flexDiv">
                            <img src="${path }/resources/images/member/그림.png">
                            <div class="input-container">
                                <input type="text" id="address" name="address" class="form__input" placeholder="주소" required readonly/>
                                <label class="form__label">주소</label>		
                            </div>
                        </div>
                        <br>
                        <div class="flexDiv">
                            <img src="${path }/resources/images/member/그림.png">
                            <div class="input-container">
                                <input type="text" name="detailAddress" class="form__input" placeholder="상세주소"/>
                                <label class="form__label">상세주소</label>		
                            </div>
                        </div>
                    </div>
                </div>
					
				<script>
	                function sample5_execDaumPostcode() {
	                    new daum.Postcode({
	                        oncomplete: function(data) {
	                            addr = data.address; // 최종 주소 변수
	
	                            // 주소 정보를 해당 필드에 넣는다.
	                            document.getElementById("address").value = addr;
	                            document.getElementById("postCode").value = data.zonecode;
	                            
	                			console.log(data);
	                			console.log(addr);
	                          	console.log(data.zonecode);
	                			//console.log(data.jibunAddress);
	                			//console.log(document.getElementById("sample5_address").value);
	                			
				                //geocoder.addressSearch(addr, callback); 
	                        }
	                    }).open();
	                }
	            </script>
				
				<script>
					const fn_invalidate=()=>{
						
						//아이디 정규표현식
    					const id=$("#id").val().trim();
    					const idChk=/^[A-Za-z0-9]+$/
    					
    					if(!idChk.test(id) || id.length<4){
    						setTimeout(function(){ //alert 무한루프 문제 해결
	    						alert("⛔ 아이디는 4자 이상, 영문자/숫자로만 구성할 수 있습니다. ⛔");
	    						$("input[name=memberId]").val("");
    						}, 10)
    						$("#id").focus();
    						return false;
    					}					
						
						//비번 정규표현식, 일치-불일치 체크
       					const pw=$("#pw").val();
       					const pwck=$("#pwck").val(); 
       					const pwChk=/^[a-zA-Z0-9]+$/ 
       					
       					if(!pwChk.test(pw) || pw.trim().length<8){
       						alert("⛔ 비밀번호는 8자 이상, 영문자/숫자로만 구성할 수 있습니다.⛔");
       						$("#pw").val('');
       						$("#userPw").focus();
       						return false;
       					}
       					
       					//전화번호 정규표현식
                        const userPhone=$("input[name=phone]").val().trim();
                        const phoneChk=/^\d{3}-\d{3,4}-\d{4}$/
                        
                        if(!phoneChk.test(userPhone)){
                            setTimeout(function(){ 
	                            alert("⛔ '-' 포함 전화번호를 정확히 입력해주세요 ⛔");
	                            $("input[name=phone]").val("");
                            }, 10);
                            $("input[name=phone]").focus();
                            return false;
                        }					
					}
				</script>	
				
                <div class="flexDiv" style="justify-content: center;">
                    <div id="inputDiv">
                        <h3 style="color: #348492;"><b style="background-color: lightgray;">🔊 바다 이용약관</b></h3>
                        <div id="signupRule1"><h4>&nbsp;바다 이용약관</h4>이용약관 
                            본 약관은 2023년 02월 01일부터 적용됩니다. 
                            
                            
                            목적 
                            본 약관은 (BADA furniture 이하 "회사" 또는 "BADA")에서 제공하는 서비스(이하 "서비스")의 이용과 관련하여, 회사와 회원 간에 서비스 이용에 관한 권리 및 의무와 책임사항, 기타 필요한 사항을 규정하는 것을 목적으로 합니다. 그리고 회사는 아래와 같은 서비스를 제공합니다. 
                        
                            
                            용어의 정의 
                            서비스: 개인용 컴퓨터 (PC), TV, 휴대형 단말기, 전기통신설비 등을 포함한 각종 유무선 장치와 같이 구현되는 단말기와 상관없이 회사가 제공하는 서비스를 의미합니다.  
                            회원: 회사와 서비스 이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 모든 사용자를 의미합니다. 
                            계정: 회원의 식별 및 서비스 이용을 위하여 회원이 선정하고 회사가 인증한 문자, 숫자 또는 특수문자의 조합으로 만들어진 식별자(이메일 주소 등)를 의미합니다. 
                            비밀번호: 회원의 개인 정보 보호 및 회원의 동일성 확인을 위해서 회원이 정한 문자, 숫자 또는 특수문자의 조합을 의미합니다. 
                            계정 정보: 계정, 비밀번호, 닉네임 등 회원이 회사에 제공한 일반정보 및 게임 전적 정보 등 생성정보를 통칭합니다. 
                            게시물: 회원이 서비스를 이용함에 있어 회원이 서비스에 게시한 문자, 문서, 그림, 음성, 동영상, 링크, 파일 혹은 이들의 조합으로 이루어진 정보 등 모든 정보나 자료를 의미합니다. 
                            가입신청자: 회사에 대하여 서비스 이용을 신청하였으나 아직 회사로부터 그 서비스 이용에 관하여 동의를 받지 못한 자를 의미합니다. 
                            
                            약관의 게시와 효력, 개정 
                            회사는 본 약관의 내용을 회원이 쉽게 알 수 있도록 홈페이지나 서비스 초기화면 또는 그 연결화면에 게시합니다. 
                            회사는 관련법에 위배되지 않는 범위에서 본 약관을 변경할 수 있습니다. 
                            회사가 본 약관을 개정할 경우에는 적용일자 및 개정내용, 개정사유 등을 명시하여 그 적용일자로부터 최소한 7일 이전(회원에게 불리하거나 중대한 사항의 변경은 30일 이전)부터 그 적용일자 경과 후 상당한 기간이 경과할 때까지 초기화면 또는 그 연결화면을 통해 공지합니다. 
                            회사가 전항에 따라 개정된 약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정된 약관에 동의한 것으로 봅니다. 
                            회원은 변경된 약관에 동의하지 않는 경우 회원 지위에서 탈퇴할 수 있습니다. 회원이 회사에 대하여 명시적으로 위와 같은 회원탈퇴 의사를 표시할 경우, 회사는 그 탈퇴한 회원을 상대로 변경된 약관의 적용을 받는 해당 서비스를 더 이상 제공할 수 없습니다. 
                            
                            약관의 해석과 예외 준칙 
                            회사는 제공하는 개별 서비스에 대해서 별도의 이용약관 및 정책을 둘 수 있으며, 해당 내용이 본 약관과 상충할 경우 개별 서비스의 이용약관을 우선하여 적용합니다. 
                            본 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 그 규정에 따릅니다. 
                            
                            이용계약의 체결 
                            이용계약은 회원이 서비스에서 제공하는 회원 가입 페이지에서 서비스 이용약관에 동의한 후 이용신청을 하고 신청한 내용에 대해서 회사가 승낙함으로써 체결됩니다. 
                            가입신청자는 제1항의 이용신청 시 본인의 실제 정보를 기재하여야 합니다. 식별정보를 허위로 기재하거나 타인의 정보를 도용한 경우 본 약관에 의한 회원의 권리를 주장할 수 없고, 회사는 환급 없이 이용계약을 취소하거나 해지할 수 있습니다. 
                            만 14세 미만의 아동에 대하여는 이용신청을 제한합니다. 
                            회사는 이용약관에 동의한 후 가입신청자에 대해서 원칙적으로 접수 순서에 따라 서비스 이용을 승낙함을 원칙으로 합니다. 다만 회사의 설비에 여유가 없거나 기술적 장애가 있는 경우, 서비스 상의 장애가 발생한 경우, 그 밖에 이용신청의 승낙이 곤란한 경우 일정시간 가입승인을 유보할 수 있습니다. 
                            회사는 다음 각 호에 해당하는 신청에 대해서 승낙하지 않거나 사후에 이용계약을 해지할 수 있습니다. 
                            가입신청자가 본 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우 
                            제3자의 이메일 주소를 이용하여 신청한 경우 
                            허위의 정보를 기재하거나, 회사가 필수적으로 입력을 요청한 부분을 기재하지 않은 경우 
                            가입신청자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우 
                            비정상적인 방법을 통하여 계정을 대량으로 생성하는 행위 
                            만 14세 미만의 아동이 이용신청을 한 경우 
                            최근 3개월 내 이용제한 기록이 있는 이용자가 이용신청을 하는 경우 
                            대한민국 이외의 국가 중 회사에서 아직 서비스를 제공할 것으로 결정하지 않은 국가에서 서비스를 이용하는 경우로 회사가 해외 서비스 업체와 체결한 계약이나 특정 국가에서 접속하는 회원에 대한 서비스 제공과 관련하여 서비스제공을 제한할 필요가 있는 경우 
                            회사는 회원에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다. 
                            회원은 회원 가입이나 회원정보 수정을 통해 기재한 개인정보 및 모든 정보의 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다. 변경의 지체로 인하여 발생한 회원의 손해에 대해 회사는 책임을 지지 않습니다. 
                            회사는 관련 법률 및 회사의 개인정보처리방침에서 정한 바에 따라 회원에게 요청하는 회원정보 및 기타정보 항목을 추가, 삭제 등 변경하여 수집 및 이용할 수 있습니다. 
                            
                            개인정보보호 의무 
                            회사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보 보호법 등 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 회사의 개인정보처리방침이 적용됩니다. 다만, 회사의 공식 사이트 이외의 링크된 사이트에서는 회사의 개인정보처리방침이 적용되지 않습니다. 
                            회사는 서비스를 중단하거나 회원이 개인정보 제공 동의를 철회한 경우에는 신속하게 회원의 개인정보를 파기합니다. 단, 개인정보처리방침에서 정하는 바에 따라 특정 정보는 일정 기간 동안 보관할 수 있습니다. 
                            
                            회원의 아이디 및 비밀번호 
                            회원은 계정과 비밀번호에 관해서 관리책임이 있습니다. 
                            회원은 계정 및 비밀번호를 제3자가 이용하도록 제공하여서는 안됩니다. 
                            회사는 회원이 계정 및 비밀번호를 소홀히 관리하여 발생하는 서비스 이용상의 손해 또는 회사의 고의 또는 중대한 과실이 없는 제3자의 부정이용 등으로 인한 손해에 대해 책임을 지지 않습니다. 
                            회원은 계정 및 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 회사에 통지하고 회사의 안내에 따라야 합니다. 
                            
                            회사의 의무 
                            회사는 계속적이고 안정적인 서비스의 제공을 위하여 최선을 다하여 노력합니다. 
                            회사는 회원이 안전하게 서비스를 이용할 수 있도록 현재 인터넷 보안기술의 발전수준과 회사가 제공하는 서비스의 성격에 적합한 보안시스템을 갖추고 운영해야 합니다. 
                            회사는 서비스를 이용하는 회원으로부터 제기되는 불만이 정당하다고 인정할 경우, 시스템과 인력이 충분하다면 이를 처리하여야 합니다. 이 처리과정에 대해서 회원이 문의를 보낸 이메일의 회신 등의 방법으로 전달하거나, 서비스에 반영함으로써 회원은 이를 인지 할 수 있습니다. 
                            회사는 정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법, 전기통신사업법 등 서비스의 운영, 유지와 관련 있는 법규를 준수합니다. 
                            
                            회원의 의무 
                            회원은 다음 각호에 해당하는 행위를 해서는 안 됩니다. 
                            이용 신청 또는 회원정보 변경 시 허위내용 등록 
                            타인의 정보 도용 
                            회사의 운영자, 임직원, 회사를 사칭하거나 관련 정보를 도용 
                            회사가 게시한 정보의 변경 
                            컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 가능성이 있는 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료 등을 게시하거나 타인에게 발송하는 행위 
                            회사의 사전 허락 없이 자동화된 수단(매크로, 봇, 스파이더, 스크래퍼 등)을 이용하여 회원가입을 시도 또는 가입하거나, 서비스를 통해 얻을 수 있는 정보를 수집, 가공, 배포하거나, 회사의 서비스 제공 취지에 부합하지 않는 방법으로 서비스를 이용하거나, 서비스에 대한 어뷰징 행위를 막기 위한 회사의 조치를 무력화하려는 일체의 행위 
                            서비스의 운영을 방해하거나 안정적 운영을 방해할 수 있는 컴퓨터 바이러스의 감염 자료 등록 또는 유포하는 행위 
                            회사와 기타 제3자의 저작권, 영업비밀, 특허권 등 지적재산권에 대한 침해 
                            회사와 다른 회원 및 기타 제3자를 희롱하거나, 위협하거나 명예를 손상시키거나, 업무를 방해하는 행위 
                            외설, 폭력적인 메시지, 기타 공서양속에 반하는 정보를 공개 또는 게시하는 행위 
                            해킹을 통해서 다른 사용자의 정보를 취득하는 행위 
                            회사의 동의 없이 영리, 영업, 광고, 정치활동 등을 목적으로 서비스를 사용하는 행위 
                            기타 현행 법령에 위반되는 불법적인 행위 및 선량한 풍속 기타 사회통념상 허용되지 않는 행위 
                            회사는 회원이 전항에서 금지한 행위를 하는 경우, 위반 행위의 경중에 따라 서비스의 이용정지/계약의 해지 등 서비스 이용 제한, 수사 기관에의 고발 조치 등 합당한 조치를 취할 수 있습니다. 
                            회원은 회사의 명시적 사전 동의가 없는 한 서비스의 이용권한 및 기타 이용계약상의 지위를 제3자에게 양도, 증여, 대여할 수 없으며 이를 담보로 제공할 수 없습니다. 
                            회원은 관계법, 본 약관의 규정, 이용안내 및 서비스와 관련하여 공지한 주의사항, 회사가 통지하는 사항 등을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는 안 됩니다. 
                            회원은 회사의 사전 허락 없이 회사가 정한 이용 목적과 방법에 반하여 영업/광고활동 등을 할 수 없고, 회원의 서비스 이용이 회사의 재산권, 영업권 또는 비즈니스 모델을 침해하여서는 안됩니다. 
                            회사는 회원이 게시하거나 등록하는 서비스 내의 게시물, 게시 내용이 제1항에서 규정하는 금지행위에 해당된다고 판단되는 경우, 사전통지 없이 이를 삭제하거나 이동 또는 등록을 거부할 수 있습니다. 
                            
                            서비스의 제공 및 변경 
                            회사는 회원에게 아래와 같은 서비스를 제공합니다. 
                            OP.GG를 비롯한 OP.GG의 도메인 웹사이트 
                            온라인 콘텐츠 제공 서비스 
                            모바일 애플리케이션 또는 PC의 웹브라우저 등을 이용하여 위 ①, ② 등에 접근하는 서비스 
                            기타 회사가 추가 개발하거나 다른 회사와의 제휴계약 등을 통해 회원에게 제공하는, 그리고 제공 할 일체의 서비스 
                            회사는 다음 각 호의 어느 하나에 해당하는 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. 이 경우 회사는 회원에게 공지사항 및 페이지의 특정 공간에 잘 보이도록 표시하는 방법으로 통지합니다. 다만, 회사가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다. 
                            컴퓨터 등 정보통신설비의 보수점검, 교체, 정기점검 또는 게임 내용이나 서비스의 수정을 위하여 필요한 경우 
                            해킹 등의 전자적 침해사고, 통신사고, 회원들의 비정상적인 게임 이용행태, 미처 예상하지 못한 서비스의 불안정성에 대응하기 위하여 필요한 경우 
                            관련 법령에서 특정 시간 또는 방법으로 서비스 제공을 금지하는 경우 
                            천재지변, 비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 제공이 불가능할 경우 
                            회사의 분할, 합병, 영업양도, 영업의 폐지, 당해 서비스의 수익 악화 등 회사의 경영상 중대한 필요에 의한 경우 
                            회사가 제공하는 서비스의 형태와 기능, 디자인 등 필요한 경우 수시로 변경되거나, 중단될 수 있습니다.  
                            전항에 의해서 제공되는 서비스가 변경 및 중단될 경우 무료로 제공되는 서비스 이용과 관련하여 이용자에게 발생한 어떠한 손해에 대해서도 책임을 지지 않습니다. 다만, 회사의 고의 또는 중대한 과실로 인하여 발생한 손해의 경우는 제외합니다. 
                            회사는 회원이 연동한 '내 소환사명'에 대한 소환사 정보를 게임 전적 서비스 및 제반 서비스에 이용·제공할 수 있습니다. 
                            
                            게시물의 삭제 또는 이용 제한 
                            회원의 게시물의 내용이 다음 각 호에 해당하는 경우 회사는 해당 게시물을 삭제 또는 해당 회원의 회원 자격을 제한, 정지 또는 상실 시킬 수 있습니다. 
                            다른 회원 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용 
                            음란물, 욕설 등 공서양속에 위반되는 내용의 정보, 문장, 도형 등을 유포하는 내용 
                            범죄행위와 관련이 있다고 판단되는 내용 
                            다른 회원 또는 제3자의 저작권 등 기타 권리를 침해하는 내용 
                            종교적, 정치적 분쟁을 야기하는 내용으로서, 이러한 분쟁으로 인하여 회사의 업무가 방해되거나 방해되리라고 판단되는 경우 
                            타인의 개인정보, 사생활을 침해하거나 명예를 손상시키는 경우 
                            동일한 내용을 중복하여 다수 게시하는 등 게시의 목적에 어긋나는 경우 
                            불필요하거나 승인되지 않은 광고, 판촉물을 게재하는 경우 
                            회원의 게시물로 인한 법률상 이익 침해를 근거로, 다른 회원 또는 제3자가 회원 또는 회사를 대상으로 하여 민형사상의 법적 조치(예: 고소, 가처분신청, 손해배상청구소송)를 취하는 동시에 법적 조치와 관련된 게시물의 삭제를 요청해오는 경우, 회사는 동 법적 조치의 결과(예: 검찰의 기소, 법원의 가처분결정, 손해배상판결)가 있을 때까지 관련 게시물에 대한 접근을 잠정적으로 제한하거나 수정, 삭제 권한을 임시로 제한할 수 있습니다. 
                            
                            광고의 게재 
                            회사는 서비스 운영과 관련하여 회원정보, 고객이 입력한 정보를 활용하여 광고를 게재할 수 있습니다. 회원은 서비스 이용 시 노출되는 맞춤 광고 게재에 대해 동의합니다. 
                            회사는 서비스상에 게재되어 있거나 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다. 
                            
                            이메일을 통한 정보의 제공 
                            회사는 회원이 서비스 이용에 필요하다고 인정되는 다양한 정보를 회원이 제공한 이메일 주소로 제공할 수 있습니다. 
                            회사는 사전에 회원으로부터 광고성 이메일 수신에 대한 동의를 받은 경우에 한하여, 서비스 운영을 위해 회원정보를 활용하여 영리목적의 광고성 이메일을 전송할 수 있습니다. 회원이 이를 원하지 않는 경우에는 언제든지 서비스 홈페이지 또는 서비스 내부 설정페이지 등을 통하여 수신거부를 할 수 있습니다. 
                            회사는 다음 각호에 해당하는 경우 회원의 동의여부와 상관없이 이메일로 발송할 수 있습니다. 
                                1. 이용 신청에서 입력한 이메일 주소의 소유를 확인하기 위해서 인증메일을 발송하는 경우 
                                2. 회원의 정보가 변경되어 확인하기 위해서 인증메일을 발송하는 경우 
                                3. 기타 서비스를 제공함에 있어 회원이 반드시 알아야 하는 중대한 정보라고 회사가 판단하는 경우 
                                4. 회원이 계속해서 1주일 이상 로그인하지 않는 경우 
                                5. 아이디/비밀번호 분실로 인한 정보 찾기 기능을 이용하여 회원 가입시 회사에 등록한 이메일 주소로 위 정보를 보내줄 것을 요구함에 따라, 회사가 위 등록된 이메일 주소로 인증 메일을 발송하는 경우 (단, 가입 신청한 회원 본인뿐 아니라 누구든지 이 기능으로 인증 메일 발송을 요구할 수 있음) 
                            
                            이용의 제한 
                            회사가 본 약관 '회원의 의무'의 위반 행위를 조사하는 과정에서 당해 계정이 특정 위반행위에 직∙간접적으로 관련되어 있는 경우 등 다른 회원의 권익 보호 및 서비스의 질서유지를 위해 불가피할 경우에는 해당 계정의 이용을 일시적으로 정지할 수 있습니다. 
                            회사는 회원이 본 약관 '회원의 의무'를 위반한 경우 및 서비스의 정상적인 운영을 방해한 경우에는 사전 통보 후 회원 자격을 제한, 이용계약을 해지하거나 또는 기간을 정하여 서비스의 이용을 중지할 수 있습니다. 
                            회사는 전항에도 불구하고, 저작권법을 위반한 불법프로그램의 제공 및 운영방해, 정보통신망 이용촉진 및 정보보호 등에 관한 법률을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 
                            회사는 회원이 계속해서 1년 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다. 
                            회원이 본 조에 따른 회사의 이용제한에 불복하고자 할 때에는 통보를 받은 날로부터 15일 이내에 회사의 이용제한에 불복하는 이유를 기재한 이의신청서를 서면, 이메일 또는 이에 준하는 방법으로 회사에 제출하여야 합니다. 이의신청서를 접수한 회사는 접수한 날로부터 15일 이내에 회원의 불복 이유에 대하여 서면, 이메일 또는 이에 준하는 방법으로 답변하고 답변 내용에 따라 상응하는 조치를 취하여야 합니다. 다만, 회사는 15일 이내에 답변이 곤란한 경우 회원에게 그 사유와 처리일정을 통보하여야 합니다. 
                            
                            권리와 책임 
                            회원이 서비스 내에 작성한 게시물에 대한 책임 및 권리는 게시물을 등록한 회원에게 있습니다. 
                            회사는 회원이 작성한 게시물에 대해서 감시 및 관리할 수 없으며 이에 대해서 책임지지 않습니다. 회사는 회원이 등록하는 게시물의 신뢰성, 진실성, 정확성 등에 대해서 책임지지 않으며 보증하지 않습니다. 
                            회사는 회원과 별도로 서면 계약을 체결하여 게임 전적 서비스 및 제반 서비스의 브랜드 특성을 이용할 수 있는 명시적인 권리를 부여하지 아니하는 한, 회원에게 회사 또는 서비스의 상호, 상표, 서비스표, 로고, 도메인 네임 및 기타 식별력 있는 브랜드 특성을 이용할 수 있는 권리를 부여하지 않습니다. 
                            서비스에 대한 저작권 및 지적재산권, 회사가 작성한 게시물의 저작권은 회사에 귀속됩니다. 단, 회원이 단독 또는 공동으로 작성한 게시물 및 제휴계약에 따라 제공된 저작물 등은 제외합니다. 
                            회원이 서비스 내에 게시한 게시물은 회사가 국내·외에서 다음 목적으로 사용할 수 있습니다. 
                            서비스(제3자가 운영하는 사이트 또는 미디어의 일정 영역 내에 입점하여 서비스가 제공되는 경우를 포함합니다)내에서 게시물을 사용하기 위하여 게시물의 크기를 변환하거나 단순화하는 등의 방식으로 수정하는 것 
                            회사의 서비스를 홍보하기 위한 목적으로 미디어, 통신사 등에게 게시물의 내용을 보도, 방영하게 하는 것. 단, 이 경우 회사는 회원의 개별 동의를 구하고 진행합니다.  
                            회원의 게시물 또는 저작물이 회사 또는 제3자의 저작권 등 지적재산권을 침해함으로써 발생하는 민∙형사상의 책임은 전적으로 회원이 부담하여야 합니다. 
                            
                            게시물의 관리 
                            회원의 게시물이 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 저작권법 등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 게시물의 게시중단 및 삭제 등을 요청할 수 있으며, 회사는 관련법에 따라 조치를 취하여야 합니다. 
                            회사는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 본 약관 및 기타 회사 정책, 관련법에 위반되는 경우에는 관련법에 따라 해당 게시물에 대해 임시조치 등을 취할 수 있습니다. 
                            회원이 비공개로 설정한 게시물에 대해서는 회사를 포함한 다른 사람이 열람할 수 없습니다. 단, 법원, 수사기관이나 기타 행정기관으로부터 정보제공을 요청받은 경우나 기타 법률에 의해 요구되는 경우에는 회사를 포함한 다른 사람이 해당 게시물을 열람할 수 있습니다. 
                            
                            계약의 해지 
                            회원은 회사에 언제든지 회원 탈퇴를 요청할 수 있으며, 회사는 이와 같은 요청을 받았을 경우, 회사가 별도로 고지한 방법에 따라 신속하게 처리합니다. 
                            회원이 회원탈퇴를 한 경우에는 회원이 회사의 서비스에 저장한 게시물 일체에 대한 수정·삭제 권한을 잃게 됩니다. 그러므로 회원은 서비스 탈퇴 전 회원이 작성 및 게시한 게시물을 모두 삭제 후 탈퇴하시기 바랍니다. 단, 저작물이 공동 저작을 통해 작성된 경우에는 공동 저작자의 의사에 따라 회사의 서비스에 해당 게시물이 저장되어 있을 수 있습니다. 그리고 제3자에 의하여 보관되거나 무단복제 등을 통하여 복제됨으로써 해당 저작물이 삭제되지 않고 재 게시된 경우, 실제 권리자의 요청에 따라 해당 저작물에 관한 삭제 등 조치를 취할 것입니다. 
                            본 약관 및 관계 법령을 위반한 회원의 경우 다른 회원을 보호하고, 법원, 수사기관 또는 관련 기관의 요청에 따른 증거자료로 활용하기 위해 회원탈퇴 후에도 관계 법령이 허용하는 한도에서 회원의 계정정보를 보관할 수 있습니다. 
                            
                            책임제한 
                            회사는 회원의 약관, 서비스 이용 방법 및 이용 기준을 준수하지 않는 등 회원의 귀책사유 또는 컴퓨터의 오류 등으로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다. 
                            회사는 회원 간 또는 회원과 제3자 상호간에 서비스를 매개로 하여 발생한 분쟁에 대해 개입할 의무가 없으며 이로 인한 손해를 배상할 책임도 없습니다. 
                            회사는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다. 
                            회사는 천재지변, 전쟁, 기간통신사업자의 서비스 중지, 제3자가 제공하는 오픈아이디의 인증 장애, 해결이 곤란한 기술적 결함 기타 불가항력으로 인하여 서비스를 제공할 수 없는 경우 책임이 면제됩니다. 
                            회사는 사전에 공지된 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 서비스가 중지되거나 장애가 발생한 경우에 대하서는 책임이 면제됩니다. 
                            회원은 자신의 결정에 의하여 회사의 서비스를 사용하여 특정 프로그램이나 정보 등을 다운받거나 접근함으로써 입게 되는 컴퓨터 시스템상의 손해나 데이터, 정보의 상실에 대한 책임을 집니다. 
                            회사는 회원의 컴퓨터 환경이나 회사의 관리 범위에 있지 아니한 보안 문제로 인하여 발생하는 제반 문제 또는 현재의 보안기술 수준으로 방어가 곤란한 네트워크 해킹 등 회사의 귀책사유 없이 발생하는 문제에 대해서 책임을 지지 않습니다. 
                            회사는 서비스가 제공한 내용에 대한 중요 정보의 정확성, 내용, 완전성, 적법성, 신뢰성 등에 대하여 보증하거나 책임을 지지 않으며, 사이트의 삭제, 저장실패, 잘못된 인도, 정보에 대한 제공에 대한 궁극적인 책임을 지지 않습니다. 또한, 회사는 회원이 서비스 내 또는 웹사이트상에 게시 또는 전송한 정보, 자료, 사실의 신뢰도, 정확성, 완결성, 품질 등 내용에 대해서는 책임을 지지 않습니다. 
                            회사는 회원이 서비스를 이용하여 기대하는 효용을 얻지 못한 것에 대하여 책임을 지지 않으며 서비스에 대한 취사 선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다. 
                            회사는 회원의 게시물을 등록 전에 사전심사 하거나 상시적으로 게시물의 내용을 확인 또는 검토하여야 할 의무가 없으며, 그 결과에 대한 책임을 지지 않습니다. 
                            회사는 관련 법령, 정부 정책 등에 따라 서비스 또는 회원에 따라 서비스 이용시간 등을 제한할 수 있으며, 이러한 제한사항 및 제한에 따라 발생하는 서비스 이용 관련 제반 사항에 대해서는 책임이 면제됩니다. 
                            
                            준거법 및 재판관할 
                            본 약관 및 이와 관련한 분쟁은 대한민국 법률에 따라 규율되고 해석됩니다. 
                            회사와 회원간 발생한 분쟁에 관한 소송의 관할법원은 제소 당시의 회사의 주소를 관할하는 지방법원의 전속관할로 합니다. 
                            
                            부칙 
                            본 약관은 2023년 01월 01일부터 적용됩니다. 
                            2023년 4월 19일부터 시행되던 종전의 약관은 본 약관으로 대체합니다.</div>
                        <br>
                    </div>
                </div>

                <div class="flexDiv" style="justify-content: center;">
                    <div id="inputDiv">
                        <div id="signupRule2"><h4>&nbsp;개인정보 수집 및 이용에 관한 내용</h4>
                            개인정보 수집∙이용 동의서 
                            
                            'BADA furniture'의 홈페이지 회원 가입을 신청하시는 분께 아래와 같이 개인정보의 수집·이용목적, 수집하는 개인정보의 항목, 개인정보의 보유 및 이용기간을 안내하여 드리오니 내용을 자세히 읽으신 후 동의 여부를 결정하여 주십시오. 
                            
                            
                            1. 수집하는 개인정보의 항목 
                            'BADA furniture'은(는) 다음의 개인정보 항목을 수집합니다. 
                            
                            1. 홈페이지 회원가입 및 관리 
                            수집 정보: 이메일 주소, 닉네임, 비밀번호 
                            2. 민원사무 처리 
                            수집 정보: 이메일 주소 
                            3. 재화 또는 서비스 제공 
                            수집 정보 : 이메일 주소, 닉네임, 비밀번호 
                            4. 마케팅 및 광고에의 활용 
                            선택: 이메일 주소 
                        
                            2. 개인정보의 수집·이용 목적 
                            'BADA furniture'은(는) 개인정보를 다음의 목적을 위해 수집·이용합니다. 수집한 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다. 
                            
                            1. 홈페이지 회원가입 및 관리 
                            회원 가입의사 확인, 회원자격 유지•관리, 서비스 부정이용 방지, 각종 고지•통지, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 수집·이용합니다. 
                            2. 민원사무 처리 
                            민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 수집·이용합니다. 
                            3. 재화 또는 서비스 제공 
                            서비스 제공, 콘텐츠 제공 등을 목적으로 개인정보를 수집·이용합니다. 
                            4. 마케팅 및 광고에의 활용 
                            신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 수집·이용합니다. 
                            
                            
                            3. 개인정보의 보유 및 이용 기간 
                            'BADA furniture'은(는) 법령에 따른 개인정보 보유∙이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유∙이용기간 내에서 개인정보를 처리, 보유합니다. 
                            각각의 개인정보 보유 및 이용 기간은 다음과 같습니다. 
                                1) 홈페이지 회원가입 및 관리: 홈페이지 탈퇴일로부터 30일이 경과하는 날까지. 다만, 관계 법령 위반에 따른 수사, 조사 등이 진행중인 경우에는 해당 수사, 조사 종료 시까지. 
                                2) 민원사무 처리: 민원사무 처리 완료 시까지. 단, 민원 발생 후 소송절차가 개시된 경우 해당 소송절차가 확정적으로 종결되는 날까지. 
                                3) 재화 또는 서비스 제공: 재화·서비스 공급 완료 시까지. 단, 관련 법령에서 소비자 보호 등을 위하여 필요한 경우 해당 법령에서 정한 기간의 만료일까지. 
                                4) 마케팅 및 광고에의 활용: 회원탈퇴 후 다른 사람이 탈퇴회원의 이메일주소를 이용하여 즉시 재가입하는 것을 방지하기 위하여 회원 탈퇴일로부터 30일이 되는 날까지. 단, 마케팅 및 맞춤서비스 제공과 관련하여 소송절차가 개시된 경우 해당 소송절차가 확정적으로 종결되는 날까지. 
                            
                            4. 기타 사항 
                            개인정보 수집 및 이용에 대해서는 거부할 수 있으며, 거부 시에는 회원가입이 불가합니다. 
                            서비스 제공을 위해서 반드시 필요한 최소한의 개인정보이므로 동의를 하셔야 서비스 이용이 가능합니다. 
                            이 외 서비스 이용과정에서 별도 동의를 통해 추가정보 수집이 있을 수 있습니다.
                        </div>
                        <br>
                        <div id="ruleContainer">
                            <label><input type="checkbox" name="agree1" value="Y" required> 이용약관에 동의합니다.</label> 
                            <br>
                            <label><input type="checkbox" name="agree2" value="Y" required> 개인정보 수집 및 이용에 동의합니다.</label>
                        </div>
                    </div>
                </div>

                <br><br><br>
                <div class="flexDiv" style="justify-content: center;">
                    <button type="submit" class="btn">회원가입</button>
                </div>
                <br>
            </form>
        </div>
    </div>

</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
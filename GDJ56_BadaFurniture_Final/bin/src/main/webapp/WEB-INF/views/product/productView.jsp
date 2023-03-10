 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/bootstrap.min.css" type="text/css">
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/font-awesome.min.css" type="text/css"> --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/style.css" type="text/css">
	
	<!-- Js Plugins -->
     <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script> 
  <%--   <script src="${pageContext.request.contextPath }/resources/js/jsProduct/jquery-3.3.1.min.js"></script> --%>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/main.js"></script>
		
	<!--?????? CSS  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/productView.css"/>
      

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
           <!--?????? ?????? ??????  -->
            <div class="checkout__form">
                <h4>PRODUCT Details</h4>
             <c:if test="${not empty productData}">
              <!--<form action="#"> -->
                    <div class="row">
                         <div class="col-lg-8 col-md-6">
                         	<div class="product__details__pic">
		                     	<c:if test="${not empty productData.files}">     
			                        
			                        <div class="product__details__pic__item">
			                            <c:forEach var="files" items="${productData.files}" varStatus="vs" begin="0" end="0">	
			                             <div class="container"> 
			                            <img  id="soldOutStateImg"  class="product__details__pic__item--large"
			                                src="${path}/resources/upload/product/${files.renamedFileName}" alt="">
			                        	<img id="soldOutImage" style="display: none;width:50%;height:50%;"  class="centered"  src="${path}/resources/images/product/soldOutEasy.png"  >
			                        
			                        	 </div> 
			                        	</c:forEach>
			                        </div>
			                        <div class="product__details__pic__slider owl-carousel">
			                           <c:forEach var="files" items="${productData.files}" varStatus="vs">	  
				                            <img class="imgUrl"  data-imgbigurl="${path}/resources/upload/product/${files.renamedFileName}"
				                                src="${path}/resources/upload/product/${files.renamedFileName}" alt="">				                                               		
			                        	</c:forEach>
			                        </div>
                    			</c:if>
                    		</div>                                                      
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>????????? ??????</h4>
                                <div class="checkout__order__products">?????? <span>${productData.price}???</span></div>
                                <ul>
                                    <li>?????? <span>${productData.item}</span></li>
                                    <li>??????(??????/??????/??????) </li>
                                    <li style="font-weight: 700;">${productData.widths}mm/${productData.depths}mm /${productData.heights}mm</li> 
                                    <li>?????? <span>${productData.color}</span></li>
                                </ul>
                                
                                <div class="checkout__order__subtotal">?????? <span>${productData.grade}</span></div>
                                <div class="checkout__order__total">????????? <span>${productData.price}???</span></div>
                                <div class="checkout__input__checkbox">
                                    <label for="acc-or">
                                        ???????????? ????????? ??????????
                                      
                                    </label>
                                </div>
                                <p>???????????? ???????????? ???????????? ????????????.
                                	????????? ?????? ????????? ??????????????? ????????? ????????????.
                                </p>
                                
                             <%--    <c:if test="${not empty loginMember }">  --%>
                                <button  class="site-btn" style="background-color: #348492;"  onclick="fn_directPurchaseBtn();">?????? ????????????</button>
                                <button  class="site-btn" style="background-color: #348492;" onclick="fn_cartBtn();">????????????</button>
                         <%--    	</c:if> --%>
                            	
                            	<!--??????????????? ???????????????   type="hidden -->
                            	<input id="cart_productNo" type="hidden" value="${productData.productNo}">
                            <%-- 	<input id="cart_memberNo" type="hidden" value="${loginMember.memberNo}" > --%>
                            		<input id="cart_memberNo" type="hidden" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.memberNo}" > 
                            </div>
                        </div>
                    </div>
             <!--</form> -->
            </div>
        </div>   	 
    <%-- 	 <input type="hidden" id="badaLoginFilter"  value="${loginMember.memberId}"> --%>  	 
    	 <!--???????????? ????????? ???????????? ??? ???????????? ??????????????? ?????? ???????????????  ??????  -->
    	 <input type="hidden" id="badaLoginFilter"  value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.memberId}">
    	 
    	 
    	 <!--?????? soldOutState??? ????????? ?????? ?????????  -->
    	 <style>
		    .container {
		      position: relative;
		       
		     /*  text-align: center; */
		    }
		    
		    .centered {
			  position: absolute;
			  top: 50%;
			  left: 50%;
			  transform: translate(-50%, -50%);
			}
		</style>  	 
    	 
    	 <input  type="text" id="productSoldOutState"  value="${productData.soldOutState}" >
    	 <!--????????? ?????? ?????? ?????????  css ?????? ???????????? ???????????? -->
    	 <!--?????? soldOutState??? ????????? ????????? ???????????? ????????? ???????????? ???????????? -->
    	 <script>
    	 if($('#productSoldOutState').val()=='I'|| $('#productSoldOutState').val()=='Y'){ 
    		 $('#soldOutStateImg').css('filter','blur(4px)');
    		 $('#soldOutStateImg').css('-webkit-filter','blur(4px)');
    	 	$('#soldOutImage').show(); 		 
    	 } 
    	 </script>
    	 </style>
    	 <!--???????????? ????????? ?????? ?????? ?????????  -->
    	 <style>
    	 	.imgUrl{
    	 	height:100% !important;
    	 	width:100% !important;
    	 	
    	 	}
    	 	.owl-item cloned{
    	 	height: 122.9px !important;
    	 	width: 112.5px !important;
    	 	
    	 	}
    	 	.owl-item active{
    	 	height: 122.9px !important;
    	 	width: 112.5px !important;
    	 	
    	 	}
    	 
    	 	.owl-item {
    	 	height: 122.9px !important;
    	 	width: 112.5px !important;
    	 	
    	 	}
    	 	
    	 	.owl-item cloned active {
    	 	height: 122.9px !important;
    	 	width: 112.5px !important;
    	 	
    	 	}
    	 
    	 	.product__details__pic__item--large{
    	 		height: 730.9px !important;
    	 	width: 730.5px !important;
    	 	}
    	 
    	 </style>
    	 
    	 
    	
    	 
    	 
    	 
    	 <!--???????????? ????????????  -->
    	 <script type="text/javascript">
    	 /*-----------------------------
         Product Discount Slider
     -------------------------------*/
     $(".product__discount__slider").owlCarousel({
         loop: true,
         margin: 0,
         items: 3,
         dots: true,
         smartSpeed: 1200,
         autoHeight: false,
         autoplay: true,
         responsive: {

             320: {
                 items: 1,
             },

             480: {
                 items: 2,
             },

             768: {
                 items: 2,
             },

             992: {
                 items: 3,
             }
         }
     });

     /*---------------------------------
         Product Details Pic Slider
     ----------------------------------*/
     $(".product__details__pic__slider").owlCarousel({
         loop: true,
         margin: 20,
         items: 4,
         dots: true,
         smartSpeed: 1200,
         autoHeight: false,
         autoplay: true
     });

     /*-----------------------
 		Price Range Slider
 	------------------------ */
     var rangeSlider = $(".price-range"),
         minamount = $("#minamount"),
         maxamount = $("#maxamount"),
         minPrice = rangeSlider.data('min'),
         maxPrice = rangeSlider.data('max');
     rangeSlider.slider({
         range: true,
         min: minPrice,
         max: maxPrice,
         values: [minPrice, maxPrice],
         slide: function (event, ui) {
             minamount.val('$' + ui.values[0]);
             maxamount.val('$' + ui.values[1]);
         }
     });
     minamount.val('$' + rangeSlider.slider("values", 0));
     maxamount.val('$' + rangeSlider.slider("values", 1));

     /*--------------------------
         Select
     ----------------------------*/
     $("select").niceSelect();

     /*------------------
 		Single Product
 	--------------------*/
     $('.product__details__pic__slider img').on('click', function () {

         var imgurl = $(this).data('imgbigurl');
         var bigImg = $('.product__details__pic__item--large').attr('src');
         if (imgurl != bigImg) {
             $('.product__details__pic__item--large').attr({
                 src: imgurl
             });
         }
     });
    	 
    	 
    	 
    	 </script>
    	 
    	 
    	 
    	 
    	 
    	 <script>
    	 const fn_cartBtn=()=>{
    		 /*  */
    		 if($('#productSoldOutState').val()=='I'|| $('#productSoldOutState')=='Y'){ 
    			 alert("??????????????? ???????????????. ??????????????? ???????????? ????????????.");	
    			 	return false;
    		 } 
    		 
    		 
    		 if( $("#badaLoginFilter").val() ==''){
    		
    			 alert("????????? ????????? ??????????????? ?????? ??? ????????????.");
   			 window.location.href="${path}/member/login.do"
    			
    		} 
    		
    	
    		
    		
    		$.ajax({
						url:"${path}/product/cartBtn.do",
						data:{cartProductNo:$("#cart_productNo").val()
							,cartMemberNo:$("#cart_memberNo").val()
						},
						success:data=>{
							console.log(data);
							if(confirm(data+"??????????????? ?????????????????????????")) {
							    window.location.href = "${path}/mypage/cart.do"
							}
						}
					});
    			
    	 }	
    	 
    	
    	 const fn_directPurchaseBtn=()=>{
    		 if($('#productSoldOutState').val()=='I'|| $('#productSoldOutState')=='Y'){ 
    			 alert("??????????????? ???????????????. ??????????????? ????????????.");	
    			 	return false;
    		 } 
    		 	 
    		 
    		 if( $("#badaLoginFilter").val() ==''){
    	    		
    			 alert("????????? ????????? ??????????????? ????????????.");
   			 window.location.href="${path}/member/login.do"
    			
    		} 
    		 
    		 
    		 location.assign('${path}/order/orderSheet.do?productNo=${productData.productNo}');
    	 }
    	 
    	 
    	 
    	 </script>
    	 <!--?????? ????????????  -->
            <div style="display:flex;justify-content:center;">
                <!--????????? ??????????????? ?????? ????????????????????????-->
              
                <!--????????? ??????????????? ?????? ????????????????????????????????????-->
                <!--???????????? div  -->
                <div style="border:0px solid red;width:1000px;height:100%;margin-top:50px;">
                    <div class="card-content" style="height:100%;">
                        <img src="${path}/resources/images/product/furnitureInfo.png"  class="furnitureInfo"/>
                        <div class="detailFont" style="border:0px solid red;height:60px;text-align: center;">
                            <span>??????:</span>
                            <span>${productData.material}</span>
                        </div>
                        <div class="detailFont" style="border:0px solid red;height:60px;text-align: center;">
                          <!--   <span>????????? ???/???:</span>
                            <span>???</span> -->
                        </div>
                    	
                    	<c:if test="${not empty productData.files}">      
                        	<c:forEach var="files" items="${productData.files}" varStatus="vs"> 	
                        		<div style="display:flex;justify-content:center;">
                        		<div style="width:500px;height:500px;display:flex;justify-content:center;">
                        			<img src="${path}/resources/upload/product/${files.renamedFileName}" class="card-content-img"/>
                    			</div>	
                    			</div>
                    		</c:forEach>	 
                    	</c:if>
                    	<c:if test="${empty productData.files}"> 
                    		???????????? ????????????
                    	</c:if>	
                    </div>  
                	
                	<span class="more">
                        <span class="blind">?????????</span>
                     </span>
                     <div class="board" >	                 
	                        <div  style="border:0px solid black;height:780px;"> 
	                            <div  style="border:0px solid rgb(17, 0, 255);height:260px;">
	                                <div style="border:0px solid rgb(179, 255, 0);height:86px;">
	                                ????????????<br>
	                                -??????5~7???
	                                </div>
	                                <div style="border:0px solid rgb(255, 81, 0);height:86px;">
	                                ?????????<br>
	                                ???????????? ??????????????? ????????????????????????.
	                                </div>
	                                <div style="border:0px solid rgb(76, 0, 255);height:86px;">
	                                ??????/??????<br>
	                                -???????????? ?????? ????????????????????????????: ???????????? <br>
	                                -????????? ?????? ?????? ?????????: ?????? ??????
	                                </div>   
	                            </div>
	                            <div  style="border:0px solid rgb(179, 255, 0);height:260px;"> 
	                                <div style="border:0px solid rgb(255, 115, 0);height:43px;"><p style="text-decoration: underline; text-underline-position:under;">?????? ??? ?????? ??????</p></div>
	                                <div style="border:0px solid rgb(30, 255, 0);height:217px;">
	                                    -?????? ?????? ??? ????????? ???????????? ?????? ?????????  ???????????? ????????? ??????  ????????? ???????????????.  <br>
	                                    -????????? ????????? ??????????????? ????????? ?????? <br>
	                                    -????????? ????????? ??? ???????????? ?????? ??????????????? ??????????????? ??? ???????????? ?????? ??????????????? ?????????.  <br>
	                                    -???????????? ?????????  ??????????????? ???????????? ???????????? ?????? ?????? ?????????????????? ???????????? ?????? ???????????? ?????????.  <br>
	                                </div>
	                            </div>
	                            <div  style="border:0px solid rgb(17, 0, 255);height:260px;">
	                                <div style="border:0px solid rgb(255, 115, 0);height:43px;"><p style="text-decoration: underline; text-underline-position:under;">????????????????????????</p></div>
	                                <div style="border:0px solid rgb(30, 255, 0);height:217px;">
	                                    -????????? ????????? ??? ???????????? ?????????????????? ??????????????? ???????????? ????????? ???????????? ??? ?????? <br>
	                                    -?????? ??? ????????? ????????? ??????????????? <br>
	                                    -???????????? ?????? ?????? ??????????????? ????????? ??????????????? ????????? ?????? <br>
	                                </div>
	                            </div>
	                        </div>	                      
	                    </div>    
                
                </div>
              	
              	
              	
              	
              	
              
              
              </c:if>
              <c:if test="${empty productData}">
              	?????? ????????? ???????????? ????????????.	              
              </c:if>
  				
  
  
              
         
                <!-- ?????? ???????????? div????????????  -->
    </section>
    <!--?????? ????????? ?????? js  -->
    <script>
        $(document).ready(function(){
      $('.more').click(function(){
        if($('.more').hasClass('more')){
           $('.more').addClass('close').removeClass('more');
           $('.board').css('visibility', 'visible');
        }else if($('.close').hasClass('close')){
           $('.close').addClass('more').removeClass('close');  
           $('.board').css('visibility', 'hidden');
        }
      });
    });
      </script>
    
    <!--section footer ???????????????  --> 
   <style>
	    	header {
		   position:fixed;
		   left:0px;
		   top:0px;
		   height:60px;
		   width:100%;
		   background:#35acff;
		   color: white;
		}
	  
	   	footer {
	 /*    position:fixed;  */
	   left:0px;
	   bottom:0px;
	  
	   width:100%;
	   background:#35acff;
	   color: white;
		}
	
		section {
		  margin-top:60px;
		  margin-bottom:800px !important;
		}	
	 
	 
			 
		/* 	 html, body {
		  height: 100%;
		}
		
		.wrap {
		  position: relative;
		  min-height: 100%;
		  padding-bottom: 114px;
		}
		
		.footer {
		  position: absolute !important;
		  bottom: 0;
		} */
   </style>

    

 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
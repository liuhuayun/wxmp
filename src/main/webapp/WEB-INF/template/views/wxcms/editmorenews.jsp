<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/template/views/common/head.inc.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>多图文素材管理</title>
<link href="<%=path%>/res/css/common/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/res/css/web/initial.css" rel="stylesheet">
<link href="<%=path%>/res/css/web/URL_Token.css" rel="stylesheet">
<link href="<%=path%>/res/css/web/top_left.css" rel="stylesheet">
<link href="<%=path%>/res/css/web/multiGraphic.css" rel="stylesheet">

<script src="<%=path%>/res/js/common/jquery.js"></script>
<script src="<%=path%>/res/js/common/bootstrap.min.js"></script>
<script src="<%=path%>/res/js/web/leftNav.js"></script>
<script src="<%=path%>/res/js/web/table.js"></script>
		
<script type="text/javascript" src="<%=path%>/res/js/plugins/webuploader/webuploader.js"></script>
<script type="text/javascript" src="<%=path %>/res/js/plugins/webuploader/webuploader.css"></script>

<script type="text/javascript" src="<%=path%>/res/js/plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="<%=path %>/res/js/plugins/ueditor/ueditor.all.min.js"></script>

<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="<%=path %>/res/js/plugins/ueditor/lang/zh-cn/zh-cn.js"></script>



<!--引入自定义js-->
<script src="<%=path%>/res/js/web/editmorenews.js"></script>

</head>
	
<body>

<div class="top">
	<jsp:include page="/WEB-INF/template/views/common/top.jsp"></jsp:include>
</div>
<div class="main">
    <jsp:include page="/WEB-INF/template/views/common/leftDemo.jsp"></jsp:include>
	  
    <div class="mainRight">
        <jsp:include page="/WEB-INF/template/views/common/topNavDemo.jsp"></jsp:include>
    	
         <div class="posInfo">
        	<ul>
            	<li><span class="posIcon"><img src="<%=path%>/res/images/pos_icon_03.png">当前位置：</span></li>
                <li><h6>
                     <a href="<%=path%>/wxcms/toMultiGraphic">图文管理</a>
                    </h6>
                    <h6>></h6>
                    <h6>多图文修改</h6>
               </li>
            </ul>
        </div>
       
       
 <div class="rightInfo">
  <div class="graPage">
             <!-- <h2 class="posTitle">素材库/新建图文消息</h2>-->
              <div class="graMain">
                  <dl class="graLeft">
                      <dt>多图文添加</dt>
                      
                      <dd class="graContainer">
                          <c:forEach var="row" items="${newsList}" varStatus="status">
                             <c:choose>
                               <c:when test="${status.index == 0}">
                                    <div class="graBig" id="now_div" onClick="fnClick(this)">
                                       <input type="hidden" id="newsId_${status.index}" value="${row.id}">
					                   <input type="hidden" id="mediaId_${status.index}" value="${row.mediaId}">
		                               <input type='hidden' id='left_title_${status.index}' value="${row.title}">
			                           <input type='hidden' id='left_thumb_media_id_${status.index}' value="${row.thumbMediaId}">
			                           <input type='hidden' id='left_author_${status.index}' value="${row.author}">
						               <input type='hidden' id='left_digest_${status.index}' value="${row.brief}">
						               <input type='hidden' id='left_show_cover_pic_${status.index}' value="${row.showpic}">
						               <input type='hidden' id='left_content_${status.index}' value="${row.description}"> 
						               <input type='hidden' id='left_content_source_url_${status.index}' value="${row.url}">
						               <input type='hidden' id='left_mainImage_${status.index}' value="${row.picpath}">
		                               <img src="${row.picpath}">
		                               <h6>${row.title}</h6>
                                   </div>
                               </c:when>
                               <c:otherwise>
                                  <div class='graSmall'  onClick='fnClick(this)'
			                           onMouseOver='mouseOver(this)' onMouseOut='mouseOut(this)'>
			                           <input type="hidden" id="newsId_${status.index}" value="${row.id}">
					                   <input type="hidden" id="mediaId_${status.index}" value="${row.mediaId}">
		                               <input type='hidden' id='left_title_${status.index}' value="${row.title}">
			                           <input type='hidden' id='left_thumb_media_id_${status.index}' value="${row.thumbMediaId}">
			                           <input type='hidden' id='left_author_${status.index}' value="${row.author}">
						               <input type='hidden' id='left_digest_${status.index}' value="${row.brief}">
						               <input type='hidden' id='left_show_cover_pic_${status.index}' value="${row.showpic}">
						               <input type='hidden' id='left_content_${status.index}' value="${row.description}"> 
						               <input type='hidden' id='left_content_source_url_${status.index}' value="${row.url}">
						               <input type='hidden' id='left_mainImage_${status.index}' value="${row.picpath}">
			                           <ul>
								            <li class='smallTitle'><h6>${row.title}</h6></li>
								            <li class='smallImg'><img src="/res/images/small_img.png">
								            </li>
				                       </ul>
				                       <h6 class='deleteBtn' style='display:none' onClick='deleteDiv(this)'>删除</h6>
				                  </div>
                               </c:otherwise>
                             </c:choose>
                          </c:forEach>
                      </dd>
                  </dl>
                 
                  <div class="graMid">
                      
                      <div class="titleInput"><span>请输入标题：</span>
                         <input type="text" placeholder="标题" id="newsTitle" 
                         style="width:80%" value="${newsObj.title}"
                         onkeyup="inputTitle()" onblur="checkTitle(this)" >
                         <br>
                         <!-- 标题的非空提示 -->
                         <span id="title_tip" style="color:red"></span>
                      </div>
                      <div class="titleInput"><span>请输入作者：</span>
                         <input type="text" placeholder="作者" id="author" 
                         style="width:80%" onblur="checkAuthor(this)" value="${newsObj.author}">
                         <br>
                         <!-- 作者的非空提示 -->
                         <span id="author_tip" style="color:red"></span>
                      </div>
                     <div class="titleInput">
                      <span>请输入内容：</span>
                         <textarea  id="content" 
                         style="width:680px;height:300px; margin-left:0px!important;">${newsObj.description}</textarea>
                         <!-- 内容的非空提示 -->
                         <span id="content_tip" style="color:red"></span>
                      </div>
                      <ul class="graStyleEdite">
                          <li class="li01">
                              <dl>
                                  <dt>封面<span class="fontDefault">大图片建议尺寸：900像素 * 500像素</span></dt>
                                  <dd>
                                      <!-- 点击可以选择图片<input type="button" value="本地上传" id="uploadBtn">        -->
                                      <div id="uploadImage1" class="btn btn-default" style="padding:0px;width:80px;height:30px;line-height:30px;"></div>
                                      <style type="text/css">
                                          .webuploader-element-invisible{
                                           border:1px solid;   
                                            width: 80px;
										    height: 30px;
										    border: 1px solid;
										    margin-left: -12px;
										    overflow: hidden;
										    padding:0px;
										    margin-left:1px;
										    opacity:0 
										    }
										    
                                      </style>
                                      <input type="button" value="从图片库选择">
                                  </dd>
                                  <dd>
                                      <img id="fileImage1" style="width:110px;height:100px;" 
                                        src="${newsObj.picpath}"
                                        alt="多图文封面图片">
                                  </dd>
                                  <dd>
                                       <span class="fontDefault" id="imgShow">
                                                                                                                              封面图片显示在正文中
                                          <!-- 保存imgId -->      
                                          
                                          <c:if test="${newsObj.showpic == 1}">
                                             <input type="checkbox"  id="show_cover_pic" checked="checked">
                                          </c:if>                                                                    
                                          <c:if test="${newsObj.showpic != 1}">
                                             <input type="checkbox"  id="show_cover_pic">
                                          </c:if>   
                                       </span>                                                                   
                                  </dd>
                              </dl>
                              <!-- 封面图片 -->
                              <span id="thumbMedia_tip" style="color:red"></span>
                          </li>
                          <!-- 
                          
                                                    <li class="li02">
                              <dl>
                                  <dt>摘要<span class="fontDefault">选填，如果不填写会默认抓取正文前54个字</span></dt>
                                  <dd><textarea  id="newDigest"  onblur="checkDigest(this)"></textarea></dd>
                              </dl>
                              <span id="digest_tip" style="color:red"></span>
                          </li>
                          
                           -->

                      </ul>
                  </div>
                  <dl class="graRight">
                      <dt>多媒体</dt>
                      
                      <dd class="graTabs">
                          <div>图片</div>
                          <div>视频</div>
                          <div>音乐</div>
                          <div>音频</div>
                          <div>投票</div>
                      </dd>
                  </dl>
              </div>
            </div>
            
            <div class="graSave">
              <input type="button" value="保存" onclick="checkEditMoreNews()">
            </div>        	
            
         </div>       	
            
        </div>
    </div>

</body>
<script type="text/javascript">


//图片一上传
upload = WebUploader.create({
	
	// 选完文件后，是否自动上传。
    auto: true,
    // 上传图片排重
    duplicate: true,
    // swf文件路径
    swf: '<%=path%>/res/js/plugins/webuploader/Uploader.swf',
    // 文件接收服务端。
    server: '<%=path%>/managerImg/uploadImg',
    id: 'uploadFile',
    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    pick: {
    	id: '#uploadImage1',
    	innerHTML: '本地上传',
    	multiple: false
    },
    accept: {
        title: 'image',
        extensions: 'jpg,jpeg,bmp,png',
        mimeTypes: 'image/*'
    },
    fileSingleSizeLimit:1024*1024*5
	
});
upload.on('error', function(handler){
	if("Q_TYPE_DENIED"==handler){
		alert("请按规定图片格式上传");
	}else if("F_EXCEED_SIZE"==handler){
		alert("图片超过规定大小");
	}
} )
//上传成功的事件
upload.on( 'uploadSuccess', function( file, response ) {
	//封面图片id
	var imgMediaId = response.imgMediaId;
	var imgUrl = response.url;
	
	if(imgUrl == null){
		alert("数据库保存图片失败");
		return false;
	}
	if(imgMediaId == null){
		alert("图片同步到微信失败");
		return false;
	}else{
		
		$("#fileImage1").attr("src",imgUrl);
		$("#fileImage1").show();
		$("#thumbMedia_tip").html("");
		
		
		//当前操作的div复制
		var divIndex = $("#now_div").index();
		$("#now_div").find("#left_mainImage_"+divIndex).val(imgUrl);
	
		$("#now_div").find("#left_thumb_media_id_"+divIndex).val(imgMediaId);
		
		$("#now_div").find("img").attr("src",imgUrl);

	}

});

</script>
</html>

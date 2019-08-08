
(function(){
      //var id = '<c:out value="${dto.id}"/>';      
      $.getJSON("/dog/missingboard/getAttachList/<%=dto.getId()%>", function(arr){              
    	  
          console.log(arr);
          
          var str = "";
          var dotStr = "";
          
          var dots = document.getElementsByClassName("dot");
          
          $(arr).each(function(i, attach){                  
              //이미지 파일
              if(attach.fileType){                	
                var fileCallPath =  encodeURIComponent( attach.uploadPath+"/"+attach.uuid +"_"+attach.fileName); //파일 이름                   
                
                str += "<div class='mySlides active'>"
                str += "<img id='lostdog' style='width:100%' src='/display?fileName="+fileCallPath+"'>";                                   
                str += "</div>";
                
                //사진 갯수만큼 dot 생성
                dotStr += "<span class='dot' onclick='currentSlide("+(i+1)+")' style='margin:0.3rem!important;'></span>"        
              }                  
          });
          
          //이미지 생성
          $("#imageSlides").html(str);
          //dot 생성
          $("#dots").html(dotStr);              
          
          //맨 처음 로딩 시 첫번째 사진만 보여줌
          showSlides(1);
          
          });//end getjson
          
    })();//end function
var irkit = new (function(){
  this.post_message = function(name){
    $.ajax({
      url : "/post_message",
      type : 'POST',
      data : {name: name},
      success : function(data,type){
        log(name);
      },
      error : function(xhr, stat, err){
        log(name+" : error");
      },
      complete : function(){
      },
      dataType : 'text'
    });
  };
})();

var log = function(msg){
  console.log(msg);
  $("#logs").prepend(
    $("<p>").text(msg).fadeIn(600)
  );
};

$(function(){
  $(".btn_ir_write").on('click', function(e){
    console.log(e.target.value);
    irkit.post_message(e.target.value);
  });
});

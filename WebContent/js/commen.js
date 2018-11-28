/**
 * Created by Administrator on 2016/9/23.
 */

 $(function($){
     //左侧导航展开
     var $fold = $(".manage_item");
     $fold.each(function(index, element) {
         $(element).bind("click",toggleFold)                     
         
     }); 
     function toggleFold(){
         if(!$(this).hasClass("curr")){
             $(this).addClass("curr").andSelf().
                     next(".sub_manage_list").slideDown();   
                     
             $(this).parents(".manage_list").siblings().
                     find(".manage_item").removeClass("curr");   
                     
             $(this).parents(".manage_list").siblings().
                     find(".sub_manage_list").slideUp(); 
         }else{
             $(this).removeClass("curr").andSelf().
                     next(".sub_manage_list").slideUp(); 
         };
         
     };
     //左右内容高度自适应
     var mainH =parseInt( $(".main_panel").outerHeight()),
         byeH =parseInt( $(window).outerHeight()-149);
         mainH = mainH >= byeH ? mainH:byeH;
     $(".sider_nav_con").outerHeight(mainH);
     
     
     //收起左侧
     $("#fold_sider").bind("click",function(){
         if(!$(".sider_panel").hasClass("fold")){
             $(this).addClass("reverse");
             $(".sider_panel").addClass("fold");
             $(".main_panel").css({width:97+"%"});
         }else{
             $(this).removeClass("reverse");
             $(".sider_panel").removeClass("fold");
             $(".main_panel").css({width:85+"%"});   
         }
             
     });       
 })

//  注销提示框
$(function () {
    var dialog_quit=new Dialog({
        target:'#quitBox',
        width:450,
        height:216,
        showYesBtn:true,
        showNoBtn:true,
        title: '提示',
        yesFn:function(){ return;},
        noFn:function(){ return;}
    });
    $('.quitBtn').bind('click',function(){
        dialog_quit.show();
    });
});

 // 侧栏高度
 function getClientH(){
     return document.documentElement ? document.documentElement.clientHeight:document.body.clientHeight;
 }
 $('.sider_panel').height(getClientH()-96);

!(function () {

    $(window).on('load',function () {
        $('.asideMenu>li.open').next().show();
        $('.asideMenu>li.close').next().hide();
        var i=$('.tabUl>li').index($('.tabUl>li.curr'));
        $('.sider_con .tabCont').eq(i).slideDown(500).siblings().hide();
        $('.sider_con .aside_bg').show();
        $('.manage_list .curr').next().show();
    });

    // tab切换
    $('.tabUl>li').on('click',function () {
        var i=$('.tabUl>li').index($(this));
        $(this).addClass('curr').siblings().removeClass('curr');
        $('.sider_con .tabCont').eq(i).show().siblings().hide();
        $('.sider_con .aside_bg').show();
    });

    // // 侧边菜单显示和隐藏
    $('.fold_sider').on('click',function(){
        if($(this).hasClass('open')){
            $(this).removeClass('open').parent().removeClass('open');
        }else{
            $(this).addClass('open').parent().addClass('open');
        }
    });

    $('.searchForm>input').on('focus',function () {
        $(this).parent().addClass('active');
    });

    $('.searchForm>input').on('blur',function () {
        $(this).parent().removeClass('active');
    });

    //表格选择变色
    $('.table_1 td .check').on('click',function () {
        if(!($(this).hasClass('checked'))){
            $(this).addClass('checked').parent().removeClass('checked').siblings().removeClass('checked');       
        }else{
            $(this).removeClass('checked').parent().addClass('checked').siblings().addClass('checked');
            
        }
    });

    $('.table_1 td').on('click',function () {
        if(!($(this).hasClass('checked'))){
            $(this).parent().find('.check').addClass('checked');
            $(this).addClass('checked').siblings().addClass('checked');
        }else{
            $(this).parent().find('.check').removeClass('checked');
            $(this).removeClass('checked').siblings().removeClass('checked');
        }
    });

    $('.table_1 thead .allCheck').on('click',function () {
        if(!($(this).hasClass('checked'))){
            $(this).addClass('checked')
            $('.table_1 tbody td .check').addClass('checked').parent().addClass('checked').siblings().addClass('checked');
        }else{
            $(this).removeClass('checked')
            $('.table_1 tbody td .check').removeClass('checked').parent().removeClass('checked').siblings().removeClass('checked');
        }
    });

    $('.searchCont .check').on('click',function () {
        $(this).toggleClass('checked');
    });

    // 日期选择器
    $('#s1').click(function(e){
        e.stopPropagation();
        Calendar.show(this,{nextInput:'s2'});
    });

    $('#s2').click(function(e){
        e.stopPropagation();
        Calendar.show(this,{});
    });
    
    //点击标题显示隐藏下方的表格
    $('.topTitle>span').on('click',function () {
        if(!($(this).hasClass('open'))){
            console.log('开.......');
            $(this).addClass('open').parent().next().slideUp(200);
        }else{
            console.log('关.......');
            $(this).removeClass('open').parent().next().slideDown(200);
        }
    });
})();


<!--

  TEAM_4

  [API Chart����ϱ�]-->

 

<!-- 

    [��������]

    1.���������� : �Ϻ� �ڽ����ǽ�

                 KOFIC ��ȭ���������������� ����API (http://www.kobis.or.kr/kobisopenapi/homepg/main/main.do)

    2.��ƮAPI   : Highcharts(http://www.highcharts.com/) 

                 Highcharts_ API(http://api.highcharts.com/) 

 -->

 

<%@ page language="java" 

         contentType="text/html; charset=EUC-KR"

         pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

        <title>highChart����ϱ�_�ְ��ڽ����ǽ�</title>

        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

           <script src="https://code.highcharts.com/highcharts.js"></script>

           <script src="https://code.highcharts.com/modules/exporting.js"></script>

           <script type="text/javascript">

               $(function() {

                   var xCategories = [];  //x��

                   var Visitors = [];  //���� ����

                   var totalVisitors = []; //�� ����

                   $.getJSON("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt=20160302",function(data){

                     //$.getJSON("movie_chart_sample.json",function(data){

                       $.each(data.boxOfficeResult.weeklyBoxOfficeList,function(index,obj){

                         //$.each(data.DATA,function(index,obj){    

                           //console.log(obj.movieNm,obj.audiCnt);

                           xCategories.push(obj.movieNm);

                           Visitors.push(parseInt(obj.audiCnt));

                           totalVisitors.push(parseInt(obj.audiAcc));                         

                           

                       });//each

                       

                   $('#highchart').highcharts({

                       /* chart: {

                           type:'column' //����׷���

                       }, */

                       

                        /* chart: {

                           type: 'pie' //������Ʈ

                       }, */

                       

                       title : {

                        text : '�ְ� �ڽ����ǽ�', //��Ʈ�� ����

                        x : -20

                    },

                    subtitle : {

                        text : 'Source: http://www.kobis.or.kr/', //��Ʈ�� ������

                        x : -20

                    },

                    xAxis : {

                        categories : xCategories, //x��, �� ���� �׷����� �׸� �̸�

                         crosshair: {

                                width: 3,

                                color: 'lightgray'

                            }

                    },

                    yAxis : { //y��

                        min:10000, // 0���� ����

                        title : {

                            text : '������(��)' 

                        },

                        

                        crosshair: {

                            width: 3,

                            color: 'lightgray'

                        },

                        plotLines : [ {

                            value : 0,

                            width : 1,

                            color : '#808080'

                        } ]

                    },                    

                    

                     tooltip: {

                           headerFormat: '<span style="font-size:10px">{point.key}</span><table>', //key�� x�� 

                           pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +

                               '<td style="padding:0"><b>{point.y} ��</b></td></tr>',

                           footerFormat: '</table>', //{point.y:f}442543,  {point.y}443 543

                           shared: true, //true�� ���� X���� ������ ���� ���� ����  

                           useHTML: true  //true�� ���� ������ html �±� ���

                     }, 

                     

                     /* tooltip : {

                            valueSuffix : '��'

                    }, */

                       plotOptions: { //�ش� X���� ��������

                            column: {

                                pointPadding: 0.2,

                                borderWidth: 0

                            }

                      }, 

                      legend : { //����

                            layout : 'vertical',

                            align : 'right', // sereis ������

                            verticalAlign : 'middle', //sereis ������ �߰�

                            borderWidth : 0 //sereis �׵θ�

                        }, 

                      series : [ { 

                            name : '���� ������',

                            data : Visitors

                       }, {

                            name : '���� ������',

                            data : totalVisitors

                       } ]                      

                       

                   });//highcharts                      

       

               }); //getJSON              

 

           });     

           

           </script>

        

    </head>

    <body>

        <div id="highchart" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

    </body>

</html>
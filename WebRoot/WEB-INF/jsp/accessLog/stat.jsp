<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-bar-chart-o fa-fw "></i> 数据统计</h1>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-10">
		<form:form action="accessLog/${all ? 'allStat':'stat'}.do" class="smart-form smart-form-search" onsubmit="return ajaxSearch(this,'${targetPanel}')" commandName="accessLog">
			<input type="hidden" name="targetPanel" value="${targetPanel}"/>
			<div id="form-search-mobile" class="btn-header transparent pull-left" style="margin-top:-5px;">
				<span> <a href="javascript:void(0)" title="Search"><i class="fa fa-search"></i></a> </span>
			</div>
			<fieldset style="padding-top:10px;">
			<div class="row">
			
				<c:if test="${all }">
				
					<section class="col col-2">
							<label class="select">
							<select id="creator" name="username" class=" comboxed">
								<option value="">-<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.creator"/>-</option>
								<c:forEach items="${userList}" var="u">
									<option value="${u.username }" ${username eq u.username ? 'selected':'' }>${u.chineseName }(${u.username })</option>
								</c:forEach>
							</select>
							<i></i>
							</label>
					</section>
				
				</c:if>
			
				<section class="col col-2 pull-left">
					<label class="input"> 
						<i class="icon-append fa fa-calendar"></i>
						<input name="start" id="start" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"
						value="<fmt:formatDate pattern='yyyy-MM-dd' value='${start}'/>" class="date_not_required textInput valid"  size="12"
							   placeholder="开始时间"
							   />
					</label>
				</section>
				<section class="col col-2 pull-left">
					<label class="input"> 
						<i class="icon-append fa fa-calendar"></i>
						<input name="end" id="end" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"
						value="<fmt:formatDate pattern='yyyy-MM-dd' value='${end}'/>" class="date_not_required textInput valid"  size="12"
							   placeholder="结束时间"
							   />
					</label>
				</section>

				<section class="col col-2 pull-left">
						<a class="btn btn-primary smart-form-submit-btn pull-left" href="#" style="padding:5px 15px;"><i class="fa fa-search"></i> 统计</a>
				</section>
			</div>
			</fieldset>
		</form:form>
	</div>
</div>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget" id="wid-id-0" 
			data-widget-colorbutton="false" data-widget-editbutton="false" 
			data-widget-deletebutton="false"
			data-widget-custombutton="false"
			data-widget-sortable="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-bar-chart-o"></i> </span>
					<h1 style="font-size:14px;letter-spacing: 1px;margin-left:25px;line-height:12px;">场景访问量</h1>
				</header>
				<div>
					<div class="jarviswidget-editbox">
					</div>
					<div class="widget-body no-padding">
						<div class="dataTables_wrapper" style="border-bottom:0px solid #ddd;min-height:330px;"> 

							<div style="padding:10px;" class="stat-page">
								 
								 <div class="main-wrapper" style="">
								 <h1 class="main-title">PV:页面访问量</h1>
								 <div class="pv-summary">
								 
									 <div class="lt">
									 	<h2>${pvSummary.max }</h2>
									 	<span class="little-title">日最高(PV)</span>
									 </div>
									 <div class="lb">
									 	<h2>${pvSummary.min }</h2>
									 	<span class="little-title">日最低(PV)</span>
									 </div>
									 
									 <div class="circle-wrapper">
										 <div class="circle">
										 	<div class="circle-center">
										 			<h1>${pvSummary.total }</h1>
										 			<span class="subtitle">总浏览次数</span>
										 	</div>
										 </div>
									 </div>
									 
									 <div class="rt">
									 	<h2>${pvSummary.average }</h2>
									 	<span class="little-title">平均(PV)</span>
									 </div>
								 </div>
								 </div>
								 
								 
								 <div class="main-wrapper uv" style="float:left;">
								 <h1 class="main-title">UV:独立访客数</h1>
								 <div class="pv-summary">
								 
									 <div class="lt">
									 	<h2>${uvSummary.max }</h2>
									 	<span class="little-title">日最高(UV)</span>
									 </div>
									 <div class="lb">
									 	<h2>${uvSummary.min }</h2>
									 	<span class="little-title">日最低(UV)</span>
									 </div>
									 
									 <div class="circle-wrapper">
										 <div class="circle">
										 	<div class="circle-center">
										 			<h1>${uvSummary.total }</h1>
										 			<span class="subtitle">总独立访客数</span>
										 	</div>
										 </div>
									 </div>
									 
									 <div class="rt">
									 	<h2>${uvSummary.average }</h2>
									 	<span class="little-title">平均(UV)</span>
									 </div>
								 </div>
								 </div>
								 
							</div>
						</div>
					</div>
				</div> 
			</div>
		</article>
	</div>
	
	<div class="row">
		<article  class="col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget" id="wid-id-0" 
			data-widget-colorbutton="false" data-widget-editbutton="false" 
			data-widget-deletebutton="false"
			data-widget-custombutton="false"
			data-widget-sortable="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-globe"></i> </span>
					<h1  style="font-size:14px;letter-spacing: 1px;margin-left:25px;line-height:12px;">地域访问</h1>
				</header>
				<div>
					<div class="jarviswidget-editbox">
					</div>
					<div class="widget-body no-padding">
						<div class="dataTables_wrapper" style="border-bottom:0px solid #ddd;height:500px;"> 

							<div style="" class="stat-page">
								 <div id="map" style="display:inline-block;float:left;"></div>
								 
								 <div style="display:inline-block;height:500px;float:left;width:500px;">
								 	<b style="margin-top:20px;">浏览最高的5个城市</b>
									 <table width="100%" cellspacing="5px" style="margin-top:20px;">
										 <c:forEach items="${regionStatList}" var="stat" varStatus="s">
										 	<c:if test="${s.count<6 }">
											 	<tr style="margin:5px;">
											 		<td width="30px">${empty stat.name ? '未知':stat.name}</td>
											 		<td style="padding:5px;"> <div style="background: #59c7f9;height:25px;width:${stat.value}px;" title="${stat.value}"></div></td>
											 	</tr>
										 	</c:if>
					                     </c:forEach>
									 </table>
								 </div>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</article>
	</div>
</section>
<script type="text/javascript">
<!--
$(function(){
	var map = new FusionCharts({
        type: 'maps/china2',
        renderAt: 'map',
        width: '700',
        height: '500',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "animation": "1",
                "showbevel": "1",
                "usehovercolor": "1",
                "canvasbordercolor": "FFFFFF",
                "bordercolor": "FFFFFF",
                "showlegend": "1",
                "showshadow": "1",
                "useSNameInLabels": "1",
                "legendposition": "BOTTOM",
                "legendborderalpha": "0",
                "legendbordercolor": "ffffff",
                "legendallowdrag": "0",
                "legendshadow": "0",
                "caption": "地域访问统计",
                "connectorcolor": "000000",
                "fillalpha": "90",
                "hovercolor": "CCCCCC",
                "showborder": '1'
            },
            "colorrange": {
                "minvalue": "0",
                "startlabel": "低",
                "endlabel": "高",
                "code": "#eeeeee",
                "gradient": "1",
                "color": [{"maxvalue": "${regionStatSummary.maxValue/2}", "code": "8fadea"}, {"maxvalue": "${regionStatSummary.maxValue}", "code": "0c48c5"}]
            },
            "data": [
                     
                     //{"id":"CN.AH","value":2115},{"id":"CN.BJ","value":1874},{"id":"CN.CQ","value":1190},{"id":"CN.FJ","value":953},{"id":"CN.GS","value":1240},{"id":"CN.GD","value":3092},{"id":"CN.GX","value":1136},{"id":"CN.GZ","value":1099},{"id":"CN.HA","value":1042},{"id":"CN.HB","value":2840},{"id":"CN.HL","value":2016},{"id":"CN.HE","value":3396},{"id":"CN.HK","value":488},{"id":"CN.HU","value":2389},{"id":"CN.HN","value":1756},{"id":"CN.JS","value":1199},{"id":"CN.JX","value":3527},{"id":"CN.JL","value":2286},{"id":"CN.LN","value":840},{"id":"CN.MA","value":1055},{"id":"CN.NM","value":4065},{"id":"CN.NX","value":3858},{"id":"CN.QH","value":4176},{"id":"CN.SA","value":2422},{"id":"CN.SD","value":101},{"id":"CN.SH","value":2888},{"id":"CN.SX","value":3640},{"id":"CN.SC","value":419},{"id":"CN.TA","value":3414},{"id":"CN.TJ","value":1653},{"id":"CN.XZ","value":4492},{"id":"CN.XJ","value":2893},{"id":"CN.YN","value":4148},{"id":"CN.ZJ","value":1551}
                     <c:forEach items="${regionStatList}" var="stat" varStatus="s">
                         {"id":"${stat.id}","value":${stat.value}}<c:if test="${not s.last}">,</c:if>
                     </c:forEach>
                     
                     ]
        }
    });
	map.render();
});
//-->
</script>
<%@include file="/WEB-INF/jsp/common/pageSetJS.jsp" %>

<!--分页查询共用的页面-->
<%@ include file="/common/paginateUtil.jsp"%>

<%@ include file="/common/dateUtil.jsp"%>
  <%@ page language="java" pageEncoding="UTF-8"%>
	<style>
        select {
			width:80px;
	    }
		input [type="text"] 
		{
			width:100px;
		}

	</style>
</head>

		<script type="text/javascript" charset="utf-8">
			
			function getCardStateColumn(value, rowData, rowIndex)
			{
				if(value == 1)
					return "插卡";
				else if(value == 2)
					return "拔卡";
				return "未知:"+value;
			}

			function getReadResultColumn(value, rowData, rowIndex)
			{
				if(value == 0)
					return "成功";
				return "失败";
			}

			$(document).ready(function() {
				
				//创建下拉部门树
				Utility.createDepTree("depId");
					
			 	var now = Utility.today(1);
				  $("#endDate").val(now);
				  var now = Utility.today();
				  $("#startDate").val(now);

				
				$("#btnQuery").click(function(){
				        Utility.loadGridWithParams();
				});

			} );


		</script>
<body>
		<div id="toolbar">		
			
			<form id="queryForm" action="<%=ApplicationPath%>/report/driverCardList.action">
			   <input type="hidden" name="queryId" value="selectDriverCards" />		    	    
			   <input type="hidden" name="fileName" value="司机插卡拔卡记录" />	  	     
			  <table width="100%"  class="TableBlock">
			   			   <tr>
						    <td> 车牌号码 </td>
					<td>			   
					<input type="text" id="plateNo" name="plateNo" > 
					</td>
				   <td> 车组名称 </td>
					<td>			  
				<select id="depId" name="depId" style="width:200px;"></select>
               </td>
			   
				<td>操作类型</td>
			   <td> <select id="cardState" name="cardState" width="10">
			      <option value="">请选择</option>
			      <option value="1">插卡</option>
				  <option value="2">拔卡</option>
			   </select>
			   </td>
            </tr>
				<tr>						
						<td align="right">开始时间
							:</td>
						<td>
      <input type="text" name="startDate"  id="startDate"   class="datetimepicker" />
						</td>
						<td>结束时间:</td>
						<td align="left">
      <input type="text" name="endDate"   id="endDate"    class="datetimepicker" />
						</td>
				
        <td colspan="4" align="left">
	      <a id="btnQuery" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a>&nbsp;
		   <a id="btnReset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" >重置</a>&nbsp;
		   <a id="btnExport" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-excel'" onclick="Utility.excelExport('<%=ApplicationPath%>/data/excelExport.action');">导出</a><!--调用utility.js-->
        </td>
    </tr>
		</table>
		</form>	 
		
  </div>
				<table id="queryGrid" class="easyui-datagrid" title="" style="width:100%;"
						data-options="pagination:true,pageSize:15,singleSelect:true,rownumbers:true,striped:true,fitColumns: true,
						pageList: [15, 20, 50, 100, 150, 200],fit:true,toolbar:'#toolbar',
						url:'<%=ApplicationPath%>/report/driverCardList.action',method:'post'">
					<thead>
						<tr>
								<th data-options="field:'driverName'"  width="18%">驾驶员</th>
								<th data-options="field:'certificationCode'"  width="6%">驾驶证</th>
								<th data-options="field:'agencyName'"  width="6%">发证机构</th>
								<th data-options="field:'validateDate'"  width="10%">证件有效期</th>
								<th data-options="field:'operTime'"  width="15%">操作时间</th>
								<th data-options="field:'cardState',formatter:getCardStateColumn"  width="15%">IC卡状态</th>
								<th data-options="field:'readResult',formatter:getReadResultColumn"  width="10%">读卡结果</th>
								<th data-options="field:'createDate'"  width="15%">创建时间</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>					
				</table>

</body>


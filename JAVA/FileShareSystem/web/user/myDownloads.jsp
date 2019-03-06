<%--
  Created by IntelliJ IDEA.
  User: HuGang
  Date: 18.5.28
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../static/jsp/user-header.jsp"%>

<div class="am-cf am-padding">
    <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">下载的文件</strong> /
        <small>将显示下载过的文件</small>
    </div>
</div>
<div class="am-g">
    <div class="am-u-sm-12">
        <table class="am-table am-table-bd am-table-striped admin-content-table">
            <thead>
            <tr>
                <th>文件名</th>
                <th>文件类型</th>
                <th>下载时间</th>
                <th>管理</th>
            </tr>
            </thead>
            <% if ( DownList.size() > 0 ) { %>
            <tbody>
            <%
//                if( index*limit+limit >= files.size() ){
//                    limitMax = DownList.size();
//                } else {
//                    limitMax = index*limit+limit;
//                }
                for(int i = index*limit; i < DownList.size(); i++) {
            %>
            <tr>
                <td>
                    <%=DownList.get(i).getFid().getFileName()%>
                </td>
                <td>
                    <%=DownList.get(i).getFid().getFileType()%>
                </td>
                <td>
                    <%=DownList.get(i).getCreated_at()%>
                </td>
                <td>
                    <div class="am-dropdown" data-am-dropdown="">
                        <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle="">
                            <span class="am-icon-cog"></span>
                            <span class="am-icon-caret-down"></span>
                        </button>
                        <ul class="am-dropdown-content">
                            <li>
                                <a href="/user/Download.action?fid=<%=DownList.get(i).getFid()%>">1. 下载</a>
                            </li>
                            <li>
                                <a href="/user/CancelDownload.action?fid=<%=DownList.get(i).getFid().getFid()%>">2. 删除记录</a>
                            </li>
                        </ul>
                    </div>
                </td>
            </tr>
            <% } %>
            </tbody>
            <% } %>
        </table>
        <%--分页--%>

        <ul data-am-widget="pagination" class="am-pagination am-pagination-default">
            <li class="am-pagination-first ">
                <a href="myDownloads.jsp?index=0" class="">第一页</a>
            </li>

            <li class="am-pagination-prev ">
                <a href="myDownloads.jsp?index=<%=index-1%>" class=""> << </a>
            </li>

            <%
                int count = (int)Math.ceil( (double)DownList.size()/limit);
                for(int i = index; i < count; i++ ){
                    if(i < index + 3 || i > count - 4){
            %>
            <li class="">
                <a href="myDownloads.jsp?index=<%=i%>" class=""> <%=i+1%> </a>
            </li>
            <%
                    }
                }
            %>

            <li class="am-pagination-last ">
                <a href="myDownloads.jsp?index=<%=count-1%>" class="">最末页</a>
            </li>
        </ul>

    </div>
</div>

<%@include file="../static/jsp/user-footer.jsp"%>

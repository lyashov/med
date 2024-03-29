<#import "parts/common.ftl" as c>

<@c.page>

<form action="/history" method="post">
    <table class="table">
        <thead class="thead-dark">
        <tr>
<#--            <th scope="col">№</th>-->
            <th scope="col">Дата обращен vsdvcSDcSdcdия</th>
            <th scope="col">IDdcdcsdcSD</th>
            <th scope="col">ФИО</th>
            <th scope="col">Нейро-диагноз</th>
            <th scope="col">Процент точности</th>
            <th scope="col">Картинка</th>
            <th scope="col">Удалить</th>
            <th scope="col">Отправить на email</th>

        </tr>
        </thead>
        <tbody>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <#list medHistories as history>
        <tr>
<#--            <th scope="row">1</th>-->
            <td>${history.date_visit}</td>
            <td>${history.id}</td>
            <td>${history.user}</td>
            <td>
                <#if history.neiro_diagtose != " ">
                    ${history.neiro_diagtose}
                <#else>
                    <div class="spinner-border text-danger" role="status">
                        <span class="sr-only">Обработка нейросетью...</span>
                    </div>
                </#if>
            </td>
            <td>
                <#if history.accuracy != " ">
                    ${history.accuracy}%</td>
                <#else>
                    <div class="spinner-border text-danger" role="status">
                        <span class="sr-only">Обработка нейросетью..</span>
                    </div>
                </#if>
            <td>
                <img src="${filePath}/${history.id}.png">
            </td>
            <td>
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" name="customDel${history.id}" id="customDel${history.id}">
                    <label class="custom-control-label" for="customDel${history.id}">Удалить</label>
                </div>
            </td>
            <td>
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" name="customMail${history.id}" id="customMail${history.id}">
                    <label class="custom-control-label" for="customMail${history.id}">Отправить</label>
                </div>
            </td>
        </tr>
        </#list>

        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <button type="submit" class="btn btn-danger">Удалить</button>
            </td>
            <td>
                <input class="dws-submit" type="submit" name="submit" value="Отправить">
            </td>
        </tr>
        </tbody>
    </table>
</form>

</@c.page>
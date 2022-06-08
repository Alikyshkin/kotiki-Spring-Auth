<#macro postForm path>
    <div>
        <form method="post" action=${path}>
            <#nested>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>
    </div>
</#macro>

<#macro getForm path>
    <div>
        <form method="post" action=${path}>
            <#nested>
        </form>
    </div>
</#macro>
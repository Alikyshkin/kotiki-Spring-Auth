<#import 'macros/pageTemplate.ftlh' as tmp>
<#import 'macros/authorization.ftlh' as authorization>

<@tmp.page>
    <h2>Login</h2>
    <@authorization.login "/login"/>

    <div class="d-flex mt-4">
        <a href="/" class="el-of-line btn btn-primary">Go home</a>
        <a href="/register" class="btn btn-outline-dark">Register</a>
    </div>
</@tmp.page>
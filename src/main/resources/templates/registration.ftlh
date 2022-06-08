<#import 'macros/pageTemplate.ftlh' as tmp>
<#import 'macros/authorization.ftlh' as authorization>

<@tmp.page>
    <h2>Register</h2>
    <@authorization.login "/register"/>

    <div class="d-flex mt-4">
        <a href="/" class="el-of-line btn btn-primary">Go home</a>
        <a href="/login" class="btn btn-outline-dark">Login</a>
    </div>

    <br/>

    ${(message)!}
</@tmp.page>

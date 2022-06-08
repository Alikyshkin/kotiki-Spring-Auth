<#import '../macros/pageTemplate.ftlh' as tmp>
<#import '../macros/filters.ftlh' as filters>

<@tmp.page>
    <h2>Main Page</h2>

    <div class="row">
        <div class="col-6">
            <div class="d-flex mt-2 d-flex mt-2 flex-column align-items-start">
                <a href="/register" class="el-of-line btn btn-outline-dark mb-2">Register</a>
                <a href="/login" class="el-of-line btn btn-outline-dark mb-2">Login</a>
                <a href="/kotiki" class="el-of-line btn btn-outline-dark mb-2">Kotiki (admin)</a>
                <a href="/owners" class="el-of-line btn btn-outline-dark mb-2">Owners (admin)</a>
                <a href="/friends" class="el-of-line btn btn-outline-dark mb-2">Friends (admin)</a>
                <a href="/users" class="el-of-line btn btn-outline-dark mb-2">Users (admin)</a>
                <a href="/kotikiUser" class="el-of-line btn btn-outline-dark mb-2">Kotiki (user)</a>
                <@filters.logout "/logout"/>
            </div>
        </div>
        <div class="col-6">
            <#if user??>
                <h5>Current Logged User:</h5>
                <ul>
                    <li>Username = ${user.getUsername()!}</li>
                    <li>Password = ${user.getPassword()!}</li>
                    <li>
                        Roles =
                        <#list user.roles as role>
                            ${role!}
                        </#list>
                    </li>
                </ul>
            <#else>
                <h5>You are not logged</h5>
            </#if>
        </div>
    </div>

</@tmp.page>

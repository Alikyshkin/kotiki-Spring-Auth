<#macro login path>
    <form class="loginForm" method="post" action=${path}>
        <div class="form-group">
            <label>
                <input class="form-control" type="text" placeholder="username" name="username"/>
            </label>
        </div>

        <div class="form-group">
            <label>
                <input class="form-control" type="password" placeholder="password" name="password"/>
            </label>
        </div>

        <div class="form-group">
            <input class="form-control btn btn-outline-dark btn-block" type="submit" value="sign in"/>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </form>
</#macro>

<#macro logout>
    <div>
        <form method="post" action="/logout">
            <input class="form-control btn btn-outline-dark btn-block" type="submit" value="sign out"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>
    </div>
</#macro>
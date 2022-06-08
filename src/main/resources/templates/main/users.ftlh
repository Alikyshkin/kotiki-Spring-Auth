<#import '../macros/pageTemplate.ftlh' as tmp>
<#import '../macros/authorization.ftlh' as authorization>
<#import '../macros/forms.ftlh' as forms>
<#import '../macros/labels.ftlh' as labels>
<#import '../macros/filters.ftlh' as filters>

<@tmp.page>
    <h2>Users</h2>
    <div class="d-flex">
        <a href="/" class="el-of-line btn btn-primary">Go home</a>
        <a href="/users" class="el-of-line btn btn-outline-dark">Get All Users</a>
        <@filters.logout "/logout"/>
    </div>

    <table class="mt-2 table table-bordered">
        <tr>
            <th>id&emsp;</th>
            <th>username&emsp;</th>
            <th>password&emsp;</th>
            <th>active&emsp;</th>
            <th>roles&emsp;</th>
        </tr>
        <#list users as user>
            <tr>
                <td>${user.id!}</td>
                <td>${user.username!}</td>
                <td>${user.password!}</td>
                <td>${user.active?string('yes', 'no')!}</td>
                <td>
                    <#list user.roles as role>
                        ${role!}
                    </#list>
                </td>
            </tr>
        </#list>
    </table>

    <br>

    <div class="row">
        <div class="col-3">
            <h5>Create User</h5>

            <@forms.postForm "/users/create">
                <@labels.username/>
                <@labels.password/>
                <div class="form-group">
                    <label>
                        <select name="role" class="form-control" id="exampleFormControlSelect1">
                            <#list roles as role>
                                <option value="${role!}">${role!}</option>
                            </#list>
                        </select>
                    </label>
                </div>
                <button class="btn btn-block btn-primary" type="submit">addUser</button>
            </@forms.postForm>
        </div>
        <div class="col-3">
            <h5>Delete User</h5>

            <@forms.postForm "/users/delete">
                <div class="form-group">
                    <label>
                        <select name="id" class="form-control" id="exampleFormControlSelect1">
                            <#list users as user>
                                <option value="${user.getId()}">${user.getId()}</option>
                            </#list>
                        </select>
                    </label>
                </div>

                <button class="btn btn-block btn-primary" type="submit">deleteById</button>
            </@forms.postForm>
        </div>
        <div class="col-3">
            <h5>Get By Id</h5>

            <@forms.postForm "/users/getById">
                <div class="form-group">
                    <label>
                        <select name="id" class="form-control" id="exampleFormControlSelect1">
                            <#list users as user>
                                <option value="${user.getId()}">${user.getId()}</option>
                            </#list>
                        </select>
                    </label>
                </div>

                <button class="btn btn-block btn-primary" type="submit">getById</button>
            </@forms.postForm>
        </div>
    </div>
</@tmp.page>

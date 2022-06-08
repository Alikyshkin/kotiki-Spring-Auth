<#import '../macros/pageTemplate.ftlh' as tmp>
<#import '../macros/authorization.ftlh' as authorization>
<#import '../macros/forms.ftlh' as forms>
<#import '../macros/labels.ftlh' as labels>
<#import '../macros/filters.ftlh' as filters>

<@tmp.page>
    <h2>Friends</h2>
    <div class="d-flex">
        <a href="/" class="el-of-line btn btn-primary">Go home</a>
        <a href="/friends" class="el-of-line btn btn-outline-dark">Get All Friends</a>
        <@filters.logout "/logout"/>
    </div>

    <table class="mt-2 table table-bordered">
        <tr>
            <th>id&emsp;</th>
            <th>kotik1&emsp;</th>
            <th>kotik2&emsp;</th>
        </tr>
        <#list friends as friend>
            <tr>
                <td>${friend.id!}</td>
                <td>${friend.kotik1!}</td>
                <td>${friend.kotik2!}</td>
            </tr>
        </#list>
    </table>

    <br>

    <div class="row">
        <div class="col-3">
            <h5>Create Friend</h5>
            <@filters.createFriend "/friends/create"/>
        </div>
        <div class="col-3">
            <h5>Update Friend</h5>

            <@forms.postForm "/friends/update">
                <div class="form-group">
                    <label>
                        <select name="id" class="form-control" id="exampleFormControlSelect1">
                            <#list friends as friend>
                                <option value="${friend.getId()}">${friend.getId()}</option>
                            </#list>
                        </select>
                    </label>
                </div>

                <@labels.kotik1/>
                <@labels.kotik2/>
                <button class="btn btn-block btn-primary" type="submit">updateFriend</button>
            </@forms.postForm>
        </div>
        <div class="col-3">
            <h5>Delete Friend</h5>

            <@forms.postForm "/friends/delete">
                <div class="form-group">
                    <label>
                        <select name="id" class="form-control" id="exampleFormControlSelect1">
                            <#list friends as friend>
                                <option value="${friend.getId()}">${friend.getId()}</option>
                            </#list>
                        </select>
                    </label>
                </div>

                <button class="btn btn-block btn-primary" type="submit">deleteById</button>
            </@forms.postForm>

            <br>

            <h5>Get By Id</h5>

            <@forms.postForm "/friends/getById">
                <div class="form-group">
                    <label>
                        <select name="id" class="form-control" id="exampleFormControlSelect1">
                            <#list friends as friend>
                                <option value="${friend.getId()}">${friend.getId()}</option>
                            </#list>
                        </select>
                    </label>
                </div>

                <button class="btn btn-block btn-primary" type="submit">getById</button>
            </@forms.postForm>
        </div>

    </div>
</@tmp.page>

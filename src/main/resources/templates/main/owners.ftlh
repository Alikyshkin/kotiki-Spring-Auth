<#import '../macros/pageTemplate.ftlh' as tmp>
<#import '../macros/authorization.ftlh' as authorization>
<#import '../macros/forms.ftlh' as forms>
<#import '../macros/labels.ftlh' as labels>
<#import '../macros/filters.ftlh' as filters>

<@tmp.page>
    <h2>Owners</h2>
    <div class="d-flex">
        <a href="/" class="el-of-line btn btn-primary">Go home</a>
        <a href="/owners" class="el-of-line btn btn-outline-dark">Get All Owners</a>
        <@filters.logout "/logout"/>
    </div>

    <table class="mt-2 table table-bordered">
        <tr>
            <th>id&emsp;</th>
            <th>ownerName&emsp;</th>
            <th>ownerBirthday&emsp;</th>
            <th>userId</th>
        </tr>
        <#list owners as owner>
            <tr>
                <td>${owner.id!}</td>
                <td>${owner.ownerName!}</td>
                <td>${owner.ownerBirthday!}</td>
                <td>${owner.userId!}</td>
            </tr>
        </#list>
    </table>

    <br>

    <div class="row">
        <div class="col-3">
            <h5>Create Owner</h5>
            <@filters.createOwner "/owners/create"/>
        </div>
        <div class="col-3">
            <h5>Update Owner</h5>

            <@forms.postForm "/owners/update">
                <div class="form-group">
                    <label>
                        <select name="id" class="form-control" id="exampleFormControlSelect1">
                            <#list owners as owner>
                                <option value="${owner.getId()}">${owner.getId()}</option>
                            </#list>
                        </select>
                    </label>
                </div>

                <@labels.name/>
                <@labels.birthday/>
                <@labels.userId/>
                <button class="btn btn-block btn-primary" type="submit">updateOwner</button>
            </@forms.postForm>
        </div>
        <div class="col-3">
            <h5>Delete Owner</h5>

            <@forms.postForm "/owners/delete">
                <div class="form-group">
                    <label>
                        <select name="id" class="form-control" id="exampleFormControlSelect1">
                            <#list owners as owner>
                                <option value="${owner.getId()}">${owner.getId()}</option>
                            </#list>
                        </select>
                    </label>
                </div>
                <button class="btn btn-block btn-primary" type="submit">deleteById</button>
            </@forms.postForm>

            <br>

            <h5>Get By Id</h5>

            <@forms.postForm "/owners/getById">
                <div class="form-group">
                    <label>
                        <select name="id" class="form-control" id="exampleFormControlSelect1">
                            <#list owners as owner>
                                <option value="${owner.getId()}">${owner.getId()}</option>
                            </#list>
                        </select>
                    </label>
                </div>
                <button class="btn btn-block btn-primary" type="submit">getById</button>
            </@forms.postForm>
        </div>
        <div class="col-3">
            <h5>Get Owner Kotiki</h5>

            <@forms.postForm "/owners/getKotiki">
                <div class="form-group">
                    <label>
                        <select name="id" class="form-control" id="exampleFormControlSelect1">
                            <#list owners as owner>
                                <option value="${owner.getId()}">${owner.getId()}</option>
                            </#list>
                        </select>
                    </label>
                </div>
                <button class="btn btn-block btn-primary" type="submit">getOwnerKotiki</button>
            </@forms.postForm>
        </div>
    </div>
</@tmp.page>

<#import '../macros/pageTemplate.ftlh' as tmp>
<#import '../macros/authorization.ftlh' as authorization>
<#import '../macros/forms.ftlh' as forms>
<#import '../macros/labels.ftlh' as labels>
<#import '../macros/filters.ftlh' as filters>

<@tmp.page>
    <h2>Kotiki For User</h2>
    <div class="d-flex">
        <a href="/" class="el-of-line btn btn-primary">Go home</a>
        <a href="/kotikiUser" class="el-of-line btn btn-outline-dark">Get All Kotiki</a>
        <@filters.logout "/logout"/>
    </div>

    <table class="mt-2 table table-bordered">
        <tr>
            <th>id&emsp;</th>
            <th>kotikName&emsp;</th>
            <th>kotikBreed&emsp;</th>
            <th>kotikColor&emsp;</th>
            <th>ownerId&emsp;</th>
            <th>kotikBirthday&emsp;</th>
        </tr>
        <#list kotiki as kotik>
            <tr>
                <td>${kotik.id!}</td>
                <td>${kotik.kotikName!}</td>
                <td>${kotik.kotikBreed!}</td>
                <td>${kotik.kotikColor!}</td>
                <td>&emsp;${kotik.ownerId!}</td>
                <td>${kotik.kotikBirthday!}</td>
            </tr>
        </#list>
    </table>

    <br>

    <div class="row">
        <div class="col-3">
            <h5>Create Kotik</h5>

            <@forms.postForm "/kotikiUser/create">
                <@labels.name/>
                <@labels.birthday/>

                <div class="form-group">
                    <label>
                        <select name="breed" class="form-control" id="exampleFormControlSelect1">
                            <#list breeds as breed>
                                <option value="${breed}">${breed}</option>
                            </#list>
                        </select>
                    </label>
                </div>

                <div class="form-group">
                    <label>
                        <select name="color" class="form-control" id="exampleFormControlSelect1">
                            <#list colors as color>
                                <option value="${color}">${color}</option>
                            </#list>
                        </select>
                    </label>
                </div>
                <button class="btn btn-block btn-primary" type="submit">addKotik</button>
            </@forms.postForm>
        </div>
        <div class="col-3">
            <h5>Update Kotik</h5>

            <@forms.postForm "/kotikiUser/update">
                <div class="form-group">
                    <label>
                        <select name="id" class="form-control" id="exampleFormControlSelect1">
                            <#list kotiki as kotik>
                                <option value="${kotik.getId()}">${kotik.getId()}</option>
                            </#list>
                        </select>
                    </label>
                </div>

                <@labels.name/>
                <@labels.birthday/>

                <div class="form-group">
                    <label>
                        <select name="breed" class="form-control" id="exampleFormControlSelect1">
                            <#list breeds as breed>
                                <option value="${breed}">${breed}</option>
                            </#list>
                        </select>
                    </label>
                </div>

                <div class="form-group">
                    <label>
                        <select name="color" class="form-control" id="exampleFormControlSelect1">
                            <#list colors as color>
                                <option value="${color}">${color}</option>
                            </#list>
                        </select>
                    </label>
                </div>

                <button class="btn btn-block btn-primary" type="submit">updateKotik</button>
            </@forms.postForm>
        </div>
        <div class="col-3">
            <h5>Delete Kotik</h5>

            <@forms.postForm "/kotikiUser/delete">
                <div class="form-group">
                    <label>
                        <select name="id" class="form-control" id="exampleFormControlSelect1">
                            <#list kotiki as kotik>
                                <option value="${kotik.getId()}">${kotik.getId()}</option>
                            </#list>
                        </select>
                    </label>
                </div>
                <button class="btn btn-block btn-primary" type="submit">deleteById</button>
            </@forms.postForm>

            <br>

            <h5>Get By Id</h5>

            <@forms.postForm "/kotikiUser/getById">
                <div class="form-group">
                    <label>
                        <select name="id" class="form-control" id="exampleFormControlSelect1">
                            <#list kotiki as kotik>
                                <option value="${kotik.getId()}">${kotik.getId()}</option>
                            </#list>
                        </select>
                    </label>
                </div>
                <button class="btn btn-block btn-primary" type="submit">deleteById</button>
            </@forms.postForm>

        </div>
        <div class="col-3">
            <h5>Get By Color</h5>
            <@forms.postForm "/kotikiUser/getByColor">
                <div class="form-group">
                    <label>
                        <select name="color" class="form-control" id="exampleFormControlSelect1">
                            <#list colors as color>
                                <option value="${color}">${color}</option>
                            </#list>
                        </select>
                    </label>
                </div>
                <button class="btn btn-block btn-primary" type="submit">getKotikByColor</button>
            </@forms.postForm>

            <br>

            <h5>Get By Breed</h5>
            <@forms.postForm "/kotikiUser/getByBreed">
                <div class="form-group">
                    <label>
                        <select name="breed" class="form-control" id="exampleFormControlSelect1">
                            <#list breeds as breed>
                                <option value="${breed}">${breed}</option>
                            </#list>
                        </select>
                    </label>
                </div>
                <button class="btn btn-block btn-primary" type="submit">getKotikByBreed</button>
            </@forms.postForm>

            <br>

            <h5>Get Friends</h5>

            <@forms.postForm "/kotikiUser/getFriends">
                <div class="form-group">
                    <label>
                        <select name="id" class="form-control" id="exampleFormControlSelect1">
                            <#list kotiki as kotik>
                                <option value="${kotik.getId()}">${kotik.getId()}</option>
                            </#list>
                        </select>
                    </label>
                </div>
                <button class="btn btn-block btn-primary" type="submit">getKotikFriends</button>
            </@forms.postForm>

        </div>
    </div>
</@tmp.page>

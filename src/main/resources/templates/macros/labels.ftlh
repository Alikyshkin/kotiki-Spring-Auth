<#macro id>
    <div class="form-group">
        <label>
            <input class="form-control" type="number" name="id" placeholder="id">
        </label>
    </div>
</#macro>

<#macro fullName>
    <div class="form-group">
        <label>
            <input class="form-control" type="text" name="fullName" placeholder="full name"/>
        </label>
    </div>
</#macro>

<#macro birthday>
    <div class="form-group">
        <label>
            <input class="form-control" type="date" name="birthday" placeholder="birthday">
        </label>
    </div>
</#macro>

<#macro userId>
    <div class="form-group">
        <label>
            <input class="form-control" type="number" name="userId" placeholder="userId">
        </label>
    </div>
</#macro>

<#macro name>
    <div class="form-group">
        <label>
            <input class="form-control" type="text" name="name" placeholder="name"/>
        </label>
    </div>
</#macro>

<#macro kotik1>
    <div class="form-group">
        <label>
            <input class="form-control" type="text" name="kotik1" placeholder="kotik1"/>
        </label>
    </div>
</#macro>

<#macro kotik2>
    <div class="form-group">
        <label>
            <input class="form-control" type="text" name="kotik2" placeholder="kotik2"/>
        </label>
    </div>
</#macro>

<#macro breed>
    <div class="form-group">
        <label>
            <input class="form-control" type="text" name="breed" placeholder="breed">
        </label>
    </div>
</#macro>

<#macro color>
    <div class="form-group">
        <label>
            <input class="form-control" type="text" name="color" placeholder="color">
        </label>
    </div>
</#macro>

<#macro ownerId>
    <div class="form-group">
        <label>
            <input class="form-control" type="number" name="ownerId" placeholder="owner id">
        </label>
    </div>
</#macro>

<#macro username>
    <div class="form-group">
        <label>
            <input class="form-control" type="text" name="username" placeholder="username">
        </label>
    </div>
</#macro>

<#macro password>
    <div class="form-group">
        <label>
            <input class="form-control" type="password" name="password" placeholder="password">
        </label>
    </div>
</#macro>

<#macro colors>
    <#list kotiki.get as color>
        <div class="form-group">
            <label>
                ${color}
                <input class="form-control" type="checkbox" name=${color}>
            </label>
        </div>
    </#list>
</#macro>

<#macro roles>
    <#list roles as role>
        <div class="form-group">
            <label>
                ${role}
                <input class="form-control" type="checkbox" name=${role}>
            </label>
        </div>
    </#list>
</#macro>

<#macro role>
    <div class="form-group">
        <label>
            <input class="form-control" type="text" name="role" placeholder="role">
        </label>
    </div>
</#macro>

<#macro active>
    <div class="form-group">
        <label>
            is active
            <input class="form-control" type="checkbox" name="active" placeholder="active">
        </label>
    </div>
</#macro>

<#macro userId>
    <div class="form-group">
        <label>
            <input class="form-control" type="number" name="userId" placeholder="user id">
        </label>
    </div>
</#macro>
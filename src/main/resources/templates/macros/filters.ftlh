<#import 'labels.ftlh' as labels>
<#import 'forms.ftlh' as forms>

<#macro logout path>
    <@forms.postForm path>
        <input class="btn btn btn-outline-dark" type="submit" value="Log Out"/>
    </@forms.postForm>
</#macro>

<#macro createKotik path>
    <@forms.postForm path>
        <@labels.name/>
        <@labels.birthday/>
        <@labels.breed/>
        <@labels.color/>
        <button class="btn btn-block btn-primary" type="submit">addKotik</button>
    </@forms.postForm>
</#macro>

<#macro createKotikUser path>
    <@forms.postForm path>
        <@labels.name/>
        <@labels.birthday/>
        <@labels.breed/>
        <@labels.color/>
        <button class="btn btn-block btn-primary" type="submit">addKotik</button>
    </@forms.postForm>
</#macro>

<#macro createFriend path>
    <@forms.postForm path>
        <@labels.kotik1/>
        <@labels.kotik2/>
        <button class="btn btn-block btn-primary" type="submit">addFriend</button>
    </@forms.postForm>
</#macro>

<#macro createOwner path>
    <@forms.postForm path>
        <@labels.name/>
        <@labels.birthday/>
        <@labels.userId/>
        <button class="btn btn-block btn-primary" type="submit">addOwner</button>
    </@forms.postForm>
</#macro>

<#macro createUser path>
    <@forms.postForm path>
        <@labels.username/>
        <@labels.password/>
        <@labels.role/>
        <button class="btn btn-block btn-primary" type="submit">addUser</button>
    </@forms.postForm>
</#macro>

<#macro updateKotik path>
    <@forms.postForm path>
        <@labels.id/>
        <@labels.name/>
        <@labels.birthday/>
        <@labels.breed/>
        <@labels.color/>
        <@labels.ownerId/>
        <button class="btn btn-block btn-primary" type="submit">updateKotik</button>
    </@forms.postForm>
</#macro>

<#macro updateKotikUser path>
    <@forms.postForm path>
        <@labels.id/>
        <@labels.name/>
        <@labels.birthday/>
        <@labels.breed/>
        <@labels.color/>
        <button class="btn btn-block btn-primary" type="submit">updateKotik</button>
    </@forms.postForm>
</#macro>

<#macro updateFriend path>
    <@forms.postForm path>
        <@labels.id/>
        <@labels.kotik1/>
        <@labels.kotik2/>
        <button class="btn btn-block btn-primary" type="submit">updateFriend</button>
    </@forms.postForm>
</#macro>

<#macro updateOwner path>
    <@forms.postForm path>
        <@labels.id/>
        <@labels.name/>
        <@labels.birthday/>
        <@labels.userId/>
        <button class="btn btn-block btn-primary" type="submit">updateOwner</button>
    </@forms.postForm>
</#macro>

<#macro delete path>
    <@forms.postForm path>
        <@labels.id/>
        <button class="btn btn-block btn-primary" type="submit">deleteById</button>
    </@forms.postForm>
</#macro>

<#macro byId path>
    <@forms.postForm path>
        <@labels.id/>
        <button class="btn btn-block btn-primary" type="submit">getById</button>
    </@forms.postForm>
</#macro>

<#macro friendsbyId path>
    <@forms.postForm path>
        <@labels.id/>
        <button class="btn btn-block btn-primary" type="submit">getFriendsById</button>
    </@forms.postForm>
</#macro>

<#macro getOwnerKotiki path>
    <@forms.postForm path>
        <@labels.id/>
        <button class="btn btn-block btn-primary" type="submit">getOwnerKotiki</button>
    </@forms.postForm>
</#macro>

<#macro byBreed path>
    <@forms.postForm path>
        <@labels.breed/>
        <button class="btn btn-block btn-primary" type="submit">getKotikByBreed</button>
    </@forms.postForm>
</#macro>

<#macro byColor path>
    <@forms.postForm path>
        <@labels.color/>
        <button class="btn btn-block btn-primary" type="submit">getKotikByColor</button>
    </@forms.postForm>
</#macro>

<#macro byOwnerId path>
    <@forms.postForm path>
        <@labels.ownerId/>
        <button class="btn btn-block btn-primary" type="submit">getKotikByOwnerId</button>
    </@forms.postForm>
</#macro>


{* User - Edit *}

<div class="edit">
    <div class="class-user">

        <form enctype="multipart/form-data" method="post" action={concat("/content/edit/",$object.id,"/",$edit_version,"/",$edit_language|not|choose(array($edit_language,"/"),''))|ezurl}>

        <h1>{"Edit %1 - %2"|i18n("design/standard/content/edit",,array($class.name|wash,$object.name|wash))}</h1>

        {include uri="design:content/edit_validation.tpl"}

        <input type="hidden" name="MainNodeID" value="{$main_node_id}" />
        {include uri="design:content/edit_attribute.tpl"}
        <br/>

        <div class="buttonblock">
            <input class="defaultbutton" type="submit" name="PublishButton" value="{'Store'|i18n('design/standard/content/edit')}" />
            <input class="button" type="submit" name="DiscardButton" value="{'Cancel'|i18n('design/standard/content/edit')}" />
            <input type="hidden" name="RedirectURI" value="/" />
            <input type="hidden" name="DiscardConfirm" value="0" />
        </div>

        </form>
    </div>
</div>

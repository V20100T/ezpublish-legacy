{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{let content=$class_attribute.content
     class_list=$content.class_constraint_list
     default_placement=$content.default_placement
     type=$content.type
     all_class_list=fetch( class, list )}

<div class="block">
    <label>{'Type'|i18n( 'design/standard/class/datatype' )}:</label>
    <select name="ContentClass_ezobjectrelationlist_type_{$class_attribute.id}" title="{'Create or browse objects'|i18n( 'design/standard/class/datatype' )}">
    <option value="0" {section show=eq( $type, 0 )}selected="selected"{/section}>{'New and existing objects'|i18n( 'design/standard/class/datatype' )}</option>
    <option value="1" {section show=eq( $type, 1 )}selected="selected"{/section}>{'Only new objects'|i18n( 'design/standard/class/datatype' )}</option>
    <option value="2" {section show=eq( $type, 2 )}selected="selected"{/section}>{'Only existing objects'|i18n( 'design/standard/class/datatype' )}</option>
    </select>
</div>

<div class="block">
    <label>{'Allowed classes'|i18n( 'design/standard/class/datatype' )}:</label>
    <select name="ContentClass_ezobjectrelationlist_class_list_{$class_attribute.id}[]" multiple="multiple" title="{'Select which classes user can create'|i18n( 'design/standard/class/datatype' )}">
    <option value="" {section show=$class_list|lt(1)}selected="selected"{/section}>{'Any'|i18n( 'design/standard/class/datatype' )}</option>
    {section name=Class loop=$all_class_list}
    <option value="{$:item.identifier|wash}" {section show=$class_list|contains($:item.identifier)}selected="selected"{/section}>{$:item.name}</option>
    {/section}
    </select>
</div>

<div class="block">
<fieldset>
<legend>{'Default location for objects'|i18n( 'design/standard/class/datatype' )}</legend>
{section show=$default_placement}
{let default_location=fetch( content, node, hash( node_id, $default_placement.node_id ) )}
<table class="list" cellspacing="0">
<tr>
    <th>{'Name'|i18n( 'design/standard/class/datatype' )}</th>
    <th>{'Type'|i18n( 'design/standard/class/datatype' )}</th>
    <th>{'Section'|i18n( 'design/standard/class/datatype' )}</th>
</tr>
<tr>
    <td>{$default_location.class_identifier|class_icon( small, $default_location.class_name )}&nbsp;{$default_location.name|wash}</td>
    <td>{$default_location.class_name|wash}</td>
    <td>{let section_object=fetch( section, object, hash( section_id, $default_location.object.section_id ) )}{section show=$section_object}{$section_object.name|wash}{section-else}<i>{'Unknown section'|i18n( 'design/standard/class/datatype' )}</i>{/section}{/let}</td>
</tr>
</table>
{/let}

<input type="hidden" name="ContentClass_ezobjectrelationlist_placement_{$class_attribute.id}" value="{$default_placement.node_id}" />
{section-else}
<p>{'New objects will not be placed in the content tree.'|i18n( 'design/standard/class/datatype' )}</p>
<input type="hidden" name="ContentClass_ezobjectrelationlist_placement_{$class_attribute.id}" value="" />
{/section}

{section show=$default_placement}
    <input class="button" type="submit" name="CustomActionButton[{$class_attribute.id}_disable_placement]" value="{'Remove location'|i18n('design/standard/class/datatype')}" />
{section-else}
    <input class="button-disabled" type="submit" name="CustomActionButton[{$class_attribute.id}_disable_placement]" value="{'Remove location'|i18n('design/standard/class/datatype')}" disabled="disabled" />
{/section}

<input class="button" type="submit" name="CustomActionButton[{$class_attribute.id}_browse_for_placement]" value="{'Select location'|i18n('design/standard/class/datatype')}" />

</fieldset>

</div>
{/let}

{default attribute_base=ContentObjectAttribute}

{section show=$attribute.content.author_list}
<table class="list" cellspacing="0">
<tr>
    <th class="tight">&nbsp;</th>
    <th>{'Name'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Email'|i18n( 'design/standard/content/datatype' )}</th>
</tr>
{section name=Author loop=$attribute.content.author_list sequence=array( bglight, bgdark )}
<tr class="{$Author:sequence}">

{* Remove. *}
<td><input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_check_{$Author:index}" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="checkbox" name="{$attribute_base}_data_author_remove_{$attribute.id}[]" value="{$Author:item.id}" title="{'Select author row for removal.'|i18n( 'design/standard/content/datatype' )}" /></td>

{* Name. *}
<td>
<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_name_{$Author:index}" class="box ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_data_author_name_{$attribute.id}[]" value="{$Author:item.name|wash}" />
<input type="hidden" name="{$attribute_base}_data_author_id_{$attribute.id}[]" value="{$Author:item.id}" />
</td>

{* Email. *}
<td><input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_email_{$Author:index}" class="box ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_data_author_email_{$attribute.id}[]" value="{$Author:item.email|wash}" /></td>

</tr>
{/section}
</table>
{section-else}
<p>{'There are no authors in the author list.'|i18n( 'design/standard/content/datatype' )}</p>
{/section}


{section show=$attribute.content.author_list}
<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]" value="{'Remove selected'|i18n('design/standard/content/datatype')}" title="{'Remove selected rows from the author list.'|i18n( 'design/standard/content/datatype' )}" />
{section-else}
<input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]" value="{'Remove selected'|i18n('design/standard/content/datatype')}" disabled="disabled" />
{/section}

<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_new_author]" value="{'Add author'|i18n('design/standard/content/datatype')}" title="{'Add a new row to the author list.'|i18n( 'design/standard/content/datatype' )}" />

{/default}

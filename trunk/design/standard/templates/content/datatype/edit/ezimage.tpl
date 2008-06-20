{default attribute_base='ContentObjectAttribute'}
{let attribute_content=$attribute.content}

{* Current image. *}
<div class="block">
<label>{'Current image'|i18n( 'design/standard/content/datatype' )}:</label>
{section show=$attribute_content.original.is_valid}

<table class="list" cellspacing="0">
<tr>
    <th class="tight">{'Preview'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Filename'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'MIME type'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Size'|i18n( 'design/standard/content/datatype' )}</th>
</tr>
<tr>
    <td>{attribute_view_gui image_class=ezini( 'ImageSettings', 'DefaultEditAlias', 'content.ini' ) attribute=$attribute}</td>
    <td>{$attribute.content.original.original_filename|wash( xhtml )}</td>
    <td>{$attribute.content.original.mime_type|wash( xhtml )}</td>
    <td>{$attribute.content.original.filesize|si( byte )}</td>
</tr>
</table>
{section-else}
<p>{'There is no image file.'|i18n( 'design/standard/content/datatype' )}</p>
{/section}

{section show=$attribute_content.original.is_valid}
<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_delete_image]" value="{'Remove image'|i18n( 'design/standard/content/datatype' )}" />
{section-else}
<input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_delete_image]" value="{'Remove image'|i18n( 'design/standard/content/datatype' )}" disabled="disabled" />
{/section}
</div>

{* New image file for upload. *}
<div class="block">
    <input type="hidden" name="MAX_FILE_SIZE" value="{$attribute.contentclass_attribute.data_int1|mul( 1024, 1024 )}" />
    <label for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_file">{'New image file for upload'|i18n( 'design/standard/content/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_file" class="box ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_data_imagename_{$attribute.id}" type="file" />
</div>

{* Alternative image text. *}
<div class="block">
    <label for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_alttext">{'Alternative image text'|i18n( 'design/standard/content/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_alttext" class="box ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_data_imagealttext_{$attribute.id}" type="text" value="{$attribute_content.alternative_text|wash(xhtml)}" />
</div>

{/let}
{/default}


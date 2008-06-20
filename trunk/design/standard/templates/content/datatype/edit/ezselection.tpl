{default attribute_base=ContentObjectAttribute}
{let selected_id_array=$attribute.content}

{* Always set the .._selected_array_.. variable, this circumvents the problem when nothing is selected. *} 
<input type="hidden" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}" value="" />

<select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="ezccat-ezselection ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}{if $attribute.is_required} ezcca-required{/if}" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}[]" {section show=$attribute.class_content.is_multiselect}multiple{/section}>
{section var=Options loop=$attribute.class_content.options}
<option value="{$Options.item.id}" {section show=$selected_id_array|contains( $Options.item.id )}selected="selected"{/section}>{$Options.item.name|wash( xhtml )}</option>
{/section}
</select>
{/let}
{/default}

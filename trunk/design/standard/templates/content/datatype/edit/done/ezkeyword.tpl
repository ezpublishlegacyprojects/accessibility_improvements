{default attribute_base=ContentObjectAttribute}
<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="box ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}{if $attribute.is_required} x-required{/if}" type="text" size="70" name="{$attribute_base}_ezkeyword_data_text_{$attribute.id}" value="{$attribute.content.keyword_string|wash(xhtml)}"  />
{/default}

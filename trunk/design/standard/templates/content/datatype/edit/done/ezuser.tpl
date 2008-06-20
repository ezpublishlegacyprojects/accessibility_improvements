<fieldset class="useraccount">
  <legend>Account Details</legend>
{default attribute_base=ContentObjectAttribute}

{* work out which field the validation is with based on the message *}

{def $username_error=false()
     $password_error=false()
     $email_error=false()}
{if $attribute.has_validation_error}
  {if $attribute.validation_error|contains('username')}{set $username_error=true()}{/if}
  {if $attribute.validation_error|contains('email')}{set $email_error=true()}{/if}
  {if $attribute.validation_error|contains('password')}{set $password_error=true()}{/if}
{/if}

{* Username. *}
  <div class="register_attribute username{if $username_error} error{/if}">
    <label for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_login">{'Username'|i18n( 'design/standard/content/datatype' )}:</label>
    {section show=$attribute.content.has_stored_login}
        <input type="text" name="{$attribute_base}_data_user_login_{$attribute.id}_stored_login" size="16" value="{$attribute.content.login}" disabled="disabled" />
        <input type="hidden" name="{$attribute_base}_data_user_login_{$attribute.id}" value="{$attribute.content.login}" />
    {section-else}
        <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_login" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}{if $attribute.is_required} x-required{/if}" type="text" name="{$attribute_base}_data_user_login_{$attribute.id}" size="16" value="{$attribute.content.login}" />
    {/section}
    {if $username_error}<p class="error">{$attribute.validation_error|wash}</p>{/if}
  </div>

{* Password #1. *}
{if $password_error}<div class="error">{/if}
  <div class="register_attribute password">
    <label for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_password">{'Password'|i18n( 'design/standard/content/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_password" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}{if $attribute.is_required} x-required{/if}" type="password" name="{$attribute_base}_data_user_password_{$attribute.id}" size="16" value="{section show=$attribute.content.original_password}{$attribute.content.original_password}{section-else}{section show=$attribute.content.has_stored_login}_ezpassword{/section}{/section}" />
  </div>

{* Password #2. *}
  <div class="register_attribute password2">
    <label for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_password_confirm">{'Confirm password'|i18n( 'design/standard/content/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_password_confirm" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}{if $attribute.is_required} x-required{/if}" type="password" name="{$attribute_base}_data_user_password_confirm_{$attribute.id}" size="16" value="{section show=$attribute.content.original_password_confirm}{$attribute.content.original_password_confirm}{section-else}{section show=$attribute.content.has_stored_login}_ezpassword{/section}{/section}" />

    {if $password_error}<p class="error">{$attribute.validation_error|wash}</p>{/if}
  </div>
{if $password_error}</div>{/if}

{* Email. *}
{if $email_error}<div class="error">{/if}
  <div class="register_attribute email">
    <label for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_email">{'Email'|i18n( 'design/standard/content/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_email" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}{if $attribute.is_required} x-required{/if}" type="text" name="{$attribute_base}_data_user_email_{$attribute.id}" size="28" value="{$attribute.content.email|wash( xhtml )}" />
  </div>

  <div class="register_attribute email2">
    <label for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_email2">{'Confirm Email'|i18n( 'design/standard/content/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_email2" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}{if $attribute.is_required} x-required{/if}" type="text" name="{$attribute_base}_data_user_email2_{$attribute.id}" size="28" value="" />
    {if $email_error}<p class="error">{$attribute.validation_error|wash}</p>{/if}
  </div>
{if $email_error}</div>{/if}

</fieldset>

{/default}

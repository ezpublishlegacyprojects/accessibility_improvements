{if $attribute.has_content}
{def $Profile=$attribute.content}
<a href={concat('/profile/view/',$Profile.ProfileID)|ezurl}>{$Profile.ProfileName|wash} Profile for {$Profile.Institution.ProviderName|wash}</a>
{else}
<p>No associated Profile</p>
{/if}
{undef}

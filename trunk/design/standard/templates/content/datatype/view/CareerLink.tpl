{if $attribute.has_content}
<ul>
  {foreach $attribute.value as $careerSponsor}
  <li><a href={concat(/career/view/",$careerSponsor.ASCO)|ezurl}>{$careerSponsor.Career.OccupationName|wash}</a></li>
  {/foreach}
</ul>
{else}
<p>No Careers</p>
{/if}

<cfcomponent extends="mura.plugin.pluginGenericEventHandler">

<cffunction name="onRenderStart" output="false" returntype="any">
	<cfargument name="event">
	<cfset var str="">
	<cfif isNumeric(trim(pluginConfig.getSetting('PiwikID'))) AND Len(pluginConfig.getSetting('PiwikID'))>
		<cfsavecontent variable="str">
	<!-- Piwik -->
	<script type="text/javascript">
	  var _paq = _paq || [];
	  _paq.push(["trackPageView"]);
	  _paq.push(["enableLinkTracking"]);
	
	  (function() {
	    var u=(("https:" == document.location.protocol) ? "https" : "http") + "://<cfoutput>#pluginConfig.getSetting('Host')#</cfoutput>/";
	    _paq.push(["setTrackerUrl", u+"piwik.php"]);
	    _paq.push(["setSiteId", "<cfoutput>#pluginConfig.getSetting('PiwikID')#</cfoutput>"]);
	    var d=document, g=d.createElement("script"), s=d.getElementsByTagName("script")[0]; g.type="text/javascript";
	    g.defer=true; g.async=true; g.src=u+"piwik.js"; s.parentNode.insertBefore(g,s);
	  })();
	</script>
	<!-- End Piwik Code -->
		</cfsavecontent>
	
	<cfelse>
		<cfset str = "<!-- Piwikconfiguration wrong -->">
	</cfif>
	<cfhtmlhead text="#str#">
</cffunction>

</cfcomponent>

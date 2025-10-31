<?xml version="1.0" encoding="UTF-8"?>
<!--XSLT to group Records having same StateCode-->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--xsl:mode on-no-match="shallow-copy"/-->
	<xsl:key name="group-by-bol" match="Record" use="StateCode"/>
	<xsl:template match="Records">
	    <xsl:copy>
	        <!--Group Record Node based on key field StateCode-->
	        <xsl:for-each-group select="Record" group-by="StateCode">
	            <RecordGroup>
	                <xsl:copy-of select="current-group()"/>
	            </RecordGroup>
	        </xsl:for-each-group>
	    </xsl:copy>
	</xsl:template>
</xsl:stylesheet>
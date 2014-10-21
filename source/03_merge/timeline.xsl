<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

<xsl:include href="[utility/datasource.xsl]"/>
<xsl:include href="[utility/reference_commit.xsl]"/>

<xsl:variable name="meta">
	<datasource type="main" mode="full" source="02_augment/formatted_commits.xml" target="repositories"/>
	<target     mode="plain" value="timeline.xml"/>
</xsl:variable>

<xsl:template match="repositories">
	<xsl:apply-templates select="entry/commit[count(message/ul/li | message/ul/li/ul) &gt;= 2]" mode="commit">
		<xsl:sort select="date" data-type="text" order="descending"/>
	</xsl:apply-templates>
</xsl:template>

</xsl:stylesheet>

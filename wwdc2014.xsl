<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:xhtml="http://www.w3.org/1999/xhtml"
				xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">

    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/"> 
		<rss version="2.0" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
			<channel>
				<itunes:complete>yes</itunes:complete>
				<itunes:author>Justin Lee</itunes:author>
				<xsl:apply-templates select="xhtml:html/xhtml:head"></xsl:apply-templates>
				<xsl:apply-templates select="xhtml:html/xhtml:body"></xsl:apply-templates>
			</channel>
		</rss>
    </xsl:template>

	<xsl:template match="xhtml:html/xhtml:head">
        <title><xsl:value-of select="xhtml:title"/></title>
    </xsl:template> 

    <xsl:template match="xhtml:html/xhtml:body/xhtml:ul">
    	<xsl:apply-templates select="xhtml:li[@class='session']"></xsl:apply-templates>
    </xsl:template>

    <xsl:template match="xhtml:li[@class='session']">
    	<item>
    		<title><xsl:value-of select="xhtml:ul/xhtml:li[@class='title']"/></title>
    		<itunes:subtitle><xsl:value-of select="normalize-space(xhtml:div/xhtml:div[@class='description active']/xhtml:p[1])"/></itunes:subtitle>
    		<itunes:summary><xsl:value-of select="normalize-space(xhtml:div/xhtml:div[@class='description active']/xhtml:p[1])"/></itunes:summary>
    		<enclosure>
    			<xsl:attribute name="url">
    				<xsl:value-of select="xhtml:div/xhtml:div[@class='description active']/xhtml:p[@class='download']/xhtml:a[1]/@href" />
  				</xsl:attribute>
  				<xsl:attribute name="type">video/quicktime</xsl:attribute>
  			</enclosure>
  			<pubdate>Fri, 6 Jun 2014 00:00:00 GMT</pubdate>
    	</item>
    </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:xhtml="http://www.w3.org/1999/xhtml"
				xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:param name="quality" as="xs:string" select="'hd'"/>
    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/"> 
		<rss version="2.0" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
			<channel>
				<xsl:apply-templates select="xhtml:html/xhtml:head"></xsl:apply-templates>
				<xsl:apply-templates select="xhtml:html/xhtml:body"></xsl:apply-templates>
			</channel>
		</rss>
    </xsl:template>

	<xsl:template match="xhtml:html/xhtml:head">
        <title><xsl:value-of select="xhtml:title"/></title>
        <description><xsl:value-of select="xhtml:title"/></description>
        <link>https://developer.apple.com/videos/wwdc/2014/</link>
        <language>en-US</language>
        <itunes:complete>yes</itunes:complete>
        <itunes:author>Justin Lee</itunes:author>
        <itunes:explicit>clean</itunes:explicit>
        <itunes:image href="http://a5.mzstatic.com/us/r30/Purple4/v4/77/14/5b/77145bdf-5b2b-19c2-2805-08be02421dd2/mzl.zmbxpsdd.350x350-75.jpg"/>
    </xsl:template> 

    <xsl:template match="xhtml:html/xhtml:body/xhtml:ul">
    	<xsl:apply-templates select="xhtml:li[@class='session']"></xsl:apply-templates>
    </xsl:template>

    <xsl:template match="xhtml:li[@class='session']">
    	<item>
    		<title><xsl:value-of select="xhtml:ul/xhtml:li[@class='title']"/></title>
    		<itunes:subtitle><xsl:value-of select="normalize-space(xhtml:div/xhtml:div[@class='description active']/xhtml:p[1])"/></itunes:subtitle>
    		<itunes:summary><xsl:value-of select="normalize-space(xhtml:div/xhtml:div[@class='description active']/xhtml:p[1])"/></itunes:summary>
    		<xsl:if test="$quality = 'hd'">
                <enclosure>
        			<xsl:attribute name="url">
        				<xsl:value-of select="xhtml:div/xhtml:div[@class='description active']/xhtml:p[@class='download']/xhtml:a[1]/@href"/>
      				</xsl:attribute>
      				<xsl:attribute name="type">video/quicktime</xsl:attribute>
      			</enclosure>
                <guid><xsl:value-of select="xhtml:div/xhtml:div[@class='description active']/xhtml:p[@class='download']/xhtml:a[1]/@href"/></guid>
            </xsl:if>
            <xsl:if test="$quality = 'sd'">
                <enclosure>
                    <xsl:attribute name="url">
                        <xsl:value-of select="xhtml:div/xhtml:div[@class='description active']/xhtml:p[@class='download']/xhtml:a[2]/@href"/>
                    </xsl:attribute>
                    <xsl:attribute name="type">video/quicktime</xsl:attribute>
                </enclosure>
                <guid><xsl:value-of select="xhtml:div/xhtml:div[@class='description active']/xhtml:p[@class='download']/xhtml:a[2]/@href"/></guid>
            </xsl:if>
  			<pubDate>Sun, 15 Jun 2014 19:00:00 +0000</pubDate>
    	</item>
    </xsl:template>
</xsl:stylesheet>
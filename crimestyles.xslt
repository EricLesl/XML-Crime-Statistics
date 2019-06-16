<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

  <xsl:output method="html" indent="yes"/>

  <xsl:param name="selected" />
  
  <xsl:template match="/">

    <table style="width:720px" border="3">
      <tr>
        <th>
          <font face="Verdana" size="4">Crimes in: <xsl:value-of select="//region[@name=$selected]/@name"/></font>
        </th>
        <th>
          <font face="Verdana" size="4">Incidents</font>
        </th>
        <th>
          <font face="Verdana" size="4">Rate(Incidents/100,000)</font>
        </th>
      </tr>
      <xsl:apply-templates select ="//region[@name=$selected]/crime" />
    </table>
  </xsl:template>

  <xsl:template match="//region[@name=$selected]/crime">
    <tr>
      <td>
        <xsl:value-of select="@type"/>
      </td>
      <td>
        <xsl:value-of select="@incidents"/>  
      </td>
      <td>
        <xsl:value-of select="@incidents div ../population-millions div 10"/>  
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
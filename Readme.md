## Apple WWDC 2014 Videos RSS Feed Generator

### About

This is a quick and simple xsl transformation file to generate a comptible iTunes Podcast subscription RSS Feed for you to add to your podcasts.

### Files

__wwdc2014.xml__: This is a cleaned up version, using [HTML Tidy Online](http://infohound.net/tidy/), of the html saved from the [Apple WWDC 2014 Videos](https://developer.apple.com/videos/wwdc/2014/) website.

__wwdc2014.xsl__: This is the xsl transformation file that is required to transform the _wwdc2014.xml_ to the RSS feed. This supports generating both HD and SD RSS feeds.

__wwdc2014-hd.xml__ & __wwdc2014-sd.xml__: These files are the generated RSS feeds which you can directly get the raw and subscribe to.

### Adding the RSS Feed link to your iTunes

You can subscribe to the podcast with the RSS feeds from the following links:

[WWDC 2014 HD Videos](https://raw.githubusercontent.com/juslee/wwdc2014rssfeed/master/wwdc2014-hd.rss)  
[WWDC 2014 SD Videos](https://raw.githubusercontent.com/juslee/wwdc2014rssfeed/master/wwdc2014-sd.rss)

### Generating from the XSL file

You can use any xslt processors to do this. I use _xsltproc_ on my Mac. Just do the following commands:

```Shell
xsltproc wwdc2014.xsl wwdc2014.xml > wwdc2014-hd.xml
```

If you do not provide any parameters, it will default to HD quality.

There is one parameter called _quality_ which you can use to toggle between generating HD and SD RSS feeds.

```Shell
xsltproc -stringparam quality hd wwdc2014.xsl wwdc2014.xml > wwdc2014-hd.xml
xsltproc -stringparam quality sd wwdc2014.xsl wwdc2014.xml > wwdc2014-hd.xml
```

### LICENSE

Except as otherwise noted, this code is licensed under the [New BSD License](http://opensource.org/licenses/BSD-3-Clause).
# README

## Sources

```lang-none
css/
  banner.css [1]

ico/
  favicon.ico
images/
  this_site.png
```

## How the UCSF C4 logo was created

1. Download [`ucsf_logo_K_OTL_9,1200dpi,003366,transparent.png`](https://github.com/UCSF-CBI/UCSF-logo/);

```sh
$ wget https://github.com/UCSF-CBI/UCSF-logo/raw/master/images/ucsf_logo_K_OTL_9%2C1200dpi%2C003366%2Ctransparent.png
```

2. In [Krita](https://krita.org/) on Linux,

  * resize the canvas from 3099x1522 to 3099x3999 by anchoring to the top
  * add text `C4` using font `Courier 10 Pitch`, weight `600` and size `1300` filled with `#003366`;

```svg
<text style="font-family:Courier 10 Pitch; font-weight:600; font-size:1300px; fill: #003366;">
    <tspan x="0">C4</tspan>
</text>
```

  * align 'C4' text relative to the 'UCSF' logo
  * adjust image vertically by offsetting +150px in 'Resize canvas'


## How the UCSF C4 was rescaled

```sh
$ convert -geometry 1136x1136 UCSF-C4_logo_K_OTL_9,1200dpi,003366,transparent.png this_site.png
```


## How the favicon was created

The favicon was created from the logo using [ImageMagick](http://www.imagemagick.org/):
```sh
$ cd assets
$ convert images/this_site.png -geometry 128x128 -define icon:auto-resize=64,48,32,16 ico/favicon.ico
```


## References

* [1] <https://github.com/ucsf-web-services/ucsf_identity_web_banner_templates>

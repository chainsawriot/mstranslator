# mstranslator

An R wrapper for the Microsoft Translator API

## installation

```R
require(devtools)
install_github("mstranslator", "chainsawriot")
```

## Example

```R
chitrans <- translator(client_id="yourclient_id", client_secret="yourSecret", default_toLang="en")
chitrans$translate("Hong Kong R User Group", toLang="ja")
```

## More information

http://msdn.microsoft.com/en-us/library/hh454949.aspx

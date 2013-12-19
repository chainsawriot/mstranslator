### Wrapper for the Microsoft Translator API
### Written by Chung-hong Chan (chainsawtiney@gmail.com)
### License: MIT
### Will be packaged for CRAN later


require(XML)
require(httr)
Translator <- setRefClass("Translator",
                          fields = list(
                              client_id = "character",
                              client_secret = "character",
                              default_toLang="character",
                              token="character",
                              expiry="POSIXct"),
                          methods = list(
                              req_token = function() {
                                  res <- POST("https://datamarket.accesscontrol.windows.net/v2/OAuth2-13", body=list(client_id = client_id, client_secret=client_secret, scope='http://api.microsofttranslator.com', grant_type='client_credentials'), multipart=FALSE)
                                  acc_token <- content(res)$access_token
                                  token <<- acc_token
                                  expiry <<- Sys.time() + as.numeric(content(res)$expires_in)
                              },
                              check_expire = function() {
                                  if (Sys.time() > expiry || is.null(expiry)) {
                                      return(TRUE)
                                  } else {
                                      return(FALSE)
                                  }
                              },
                              translate = function(text, toLang=NA) {
                                  if (check_expire()) {
                                      #cat("Need to update")
                                      req_token()
                                  }
                                  if (length(default_toLang) == 0 & is.na(toLang)) {
                                      stop("Please provide toLang")
                                  } else if (length(default_toLang) > 0 & is.na(toLang)) {
                                      toLang <- default_toLang
                                  }
                                  xml_content <- content(GET(url="http://api.microsofttranslator.com/V2/Http.svc/Translate", query=list(text = text, to = toLang), add_headers(Authorization = paste0("bearer ", token))), type="text", encoding="utf-8")
                                  return(xmlToList(xml_content))
                              })
                          
)

#client_id = ""
#client_secret = ""

#chi_trans <- Translator$new(client_id=client_id, client_secret=client_secret, default_toLang="zh-CHS")
#chi_trans$translate("クリエイティブ コモンズ帰属-シェアも 3 の全文は、契約の条件の下で利用可能な追加条項も適用されます。")

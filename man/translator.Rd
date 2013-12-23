\name{translator}
\alias{translator}
\title{Constructor for the Translator instance}
\usage{
  translator(client_id, client_secret, default_toLang = "",
    default_fromLang = "")
}
\arguments{
  \item{client_id}{Client ID}

  \item{client_secret}{Client secret}

  \item{default_toLang}{Default Language to output}

  \item{default_fromLang}{Default Language input}
}
\description{
  This function generates a new Translator instance to use
  the Microsoft Translator API
}
\examples{
## use your own client id and client secret
# chi_trans <- translator(client_id="yourclientid", client_secret="yourclientsecret", default_toLang="zh-CHS")
# chi_trans$translate( "曼德拉是無神論者", fromLang="zh-CHT", toLang="en")
}


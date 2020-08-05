module ISX.Test (
    module TPX.Com.API.Test,
    withSrv
    ) where


import              ISX.Plugin.Elasticsearch.Route
import              Network.URI
import              System.Environment                      (getEnv)
import              TPX.Com.API.Test
import qualified    TPX.Com.Net                             as  Net


withSrv :: RequestBuilder IO () -> IO Response
withSrv r = do
    Just dUrl <- parseAbsoluteURI <$> getEnv "_TEST_ELASTICSEARCH_HOST"
    n <- Net.openConn
    runHandler r $ site dUrl n

module Main (main) where

import qualified Data.Text          as T
import           Maestro.Client.Env
import           Maestro.Run.Datum
import           Maestro.Run.Epochs
import           Maestro.Run.Pools
import           Maestro.Run.Scripts
import           Maestro.Run.Tx
import           System.Environment (getEnv)


main :: IO ()

main = do
    apiId <- maestroId
    env <- mkMaestroEnv (T.pack apiId) Preprod
    runPoolsAPI env
    runTxApi env
    runEpochsAPI env
    runDatumAPI env
    runScriptsAPI env

    where
      maestroId = getEnv  "MAESTRO_API_KEY"

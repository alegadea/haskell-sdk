module Maestro.API.Address where

import           Data.Text               (Text)
import           Maestro.Types.Address
import           Maestro.Types.Common    (Utxo)
import           Maestro.Client.Core.Pagination
import           Servant.API
import           Servant.API.Generic

data AddressAPI route = AddressAPI
  {

    _addressesUtxos
      :: route
      :- "utxos"
      :> QueryParam "resolve_datums"  Bool
      :> QueryParam "with_cbor"  Bool
      :> Pagination
      :> ReqBody '[JSON] [Text]
      :> Post '[JSON] [Utxo]

  , _addressUtxo
      :: route
      :- Capture "address" Text
      :> "utxos"
      :> QueryParam "resolve_datums"  Bool
      :> QueryParam "with_cbor"  Bool
      :> Pagination
      :> Get  '[JSON] [Utxo]

  , _addressUtxoRefs
      :: route
      :- Capture "address" Text
      :> "utxo_refs"
      :> Pagination
      :> Get  '[JSON] [UtxoRef]

  , _addressTransactionCount
      :: route
      :- Capture "address" Text
      :> "transactions"
      :> "count"
      :> Get  '[JSON] [AddressTxCount]

  } deriving (Generic)

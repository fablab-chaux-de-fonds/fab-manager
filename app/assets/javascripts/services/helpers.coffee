'use strict'

Application.Services.factory 'helpers', [()->
    getAmountToPay: (price, walletAmount) ->
      if (walletAmount - price) >= -9900/100 then 0 else price - walletAmount
  ]

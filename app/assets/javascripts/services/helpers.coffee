'use strict'

Application.Services.factory 'helpers', [()->
    getAmountToPay: (price, walletAmount) ->
      if (walletAmount - price) >= -Fablab.authorized_user_credit then 0 else price - walletAmount
  ]

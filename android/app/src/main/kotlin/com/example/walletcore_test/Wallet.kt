package com.example.walletcore_test

import android.util.Log
import wallet.core.jni.CoinType
import wallet.core.jni.HDWallet
import java.lang.System.loadLibrary

class Wallet {

    init {
        loadLibrary("TrustWalletCore")
    }
    
    private val pass = ""

    fun testEth(seed : String) : String {
        val wall = HDWallet(seed,pass)
        println("Mnemonic: \n${wall.mnemonic()}")
        val coinEth : CoinType = CoinType.ETHEREUM
        val addressEth = wall.getAddressForCoin(coinEth)
        println("Default ETH address: \n$addressEth")
        return addressEth
    }
}
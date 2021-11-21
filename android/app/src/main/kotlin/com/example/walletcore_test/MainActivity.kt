package com.example.walletcore_test

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "test.wallet/eth"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "testEth") {
                val seed : String = (call.argument("seed") as? String) ?: ""
                val eth = Wallet().testEth(seed)
                result.success(eth)
            } else {
                result.notImplemented()
            }

        }
    }

}

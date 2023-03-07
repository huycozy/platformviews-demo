package com.example.test_platformviews

import android.content.Context
import android.graphics.Color
import android.view.Gravity
import android.view.View
import android.widget.FrameLayout
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

internal class MapView(context: Context?, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private lateinit var textView: TextView
    private lateinit var frameLayout: FrameLayout

    override fun getView(): View {
        return frameLayout
    }

    override fun dispose() {}

    init {
        context?.let { ct ->

            textView = TextView(ct)
            textView.textSize = 20f
            textView.setTextColor(Color.WHITE)
            textView.text = "Rendered on a native Android view (id: $id)"

            frameLayout = FrameLayout(ct)
            val params = FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT,
                FrameLayout.LayoutParams.WRAP_CONTENT)
            params.gravity = Gravity.CENTER
            frameLayout.setBackgroundColor(Color.BLUE)
            frameLayout.addView(textView, params)
        }

    }
}
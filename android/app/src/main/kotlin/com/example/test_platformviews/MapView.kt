package com.example.test_platformviews

import android.content.Context
import android.graphics.Color
import android.view.Gravity
import android.view.View
import android.widget.EditText
import android.widget.FrameLayout
import io.flutter.plugin.platform.PlatformView

internal class MapView(context: Context?, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private lateinit var editText: EditText
    private lateinit var frameLayout: FrameLayout

    override fun getView(): View {
        return frameLayout
    }

    override fun dispose() {}

    init {
        context?.let { ct ->

            editText = EditText(ct)
            editText.setHint("Enter text here")

            frameLayout = FrameLayout(ct)
            val params = FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT,
                FrameLayout.LayoutParams.WRAP_CONTENT)
            params.gravity = Gravity.CENTER;
            frameLayout.setBackgroundColor(Color.BLUE)
            frameLayout.addView(editText, params)
        }

    }
}
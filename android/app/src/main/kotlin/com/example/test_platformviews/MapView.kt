package com.example.test_platformviews

import android.content.Context
import android.graphics.Color
import android.view.Gravity
import android.view.View
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.TextView
import android.widget.Toast
import io.flutter.plugin.platform.PlatformView

internal class MapView(context: Context?, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private lateinit var textView: TextView
    private lateinit var editText: EditText
    private lateinit var linearLayout: LinearLayout

    override fun getView(): View {
        return linearLayout
    }

    override fun dispose() {}

    init {
        context?.let { ct ->

            textView = TextView(ct)
            textView.textSize = 20f
            textView.setTextColor(Color.WHITE)
            textView.text = "Rendered on a native Android view (id: $id)"
            textView.setTextIsSelectable(true)
            textView.setOnClickListener {
                Toast.makeText(ct, "Hello from Android!", Toast.LENGTH_SHORT).show();
            }

            editText = EditText(ct)
            editText.hint = "Enter your name"
            editText.textSize = 20f
            editText.setTextColor(Color.BLACK)
            editText.setBackgroundColor(Color.WHITE)
            editText.setPadding(10, 10, 10, 10)
            editText.gravity = Gravity.CENTER

            // create a new LinearLayout and add both textview and edittext to it
            linearLayout = LinearLayout(ct)
            linearLayout.layoutParams = LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.MATCH_PARENT)
            linearLayout.gravity = Gravity.CENTER
            linearLayout.orientation = LinearLayout.VERTICAL
            linearLayout.setBackgroundColor(Color.BLUE)
            linearLayout.addView(textView)
            linearLayout.addView(editText)
        }

    }
}
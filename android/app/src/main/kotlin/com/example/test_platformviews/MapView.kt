package com.example.test_platformviews

import android.content.Context
import android.media.MediaPlayer
import android.net.Uri
import android.util.Log
import android.view.LayoutInflater
import android.view.SurfaceHolder
import android.view.SurfaceView
import android.view.View
import android.widget.LinearLayout
import io.flutter.plugin.platform.PlatformView
import java.io.IOException


internal class MapView(context: Context?, id: Int, creationParams: Map<String?, Any?>?) :
    PlatformView, SurfaceHolder.Callback {

    private val TAG = "VideoSurfaceView"
    private var context: Context? = null
    private var rootView: LinearLayout? = null
    private var mediaPlayer: MediaPlayer? = null

    override fun getView(): View {
        return rootView!!
    }

    override fun dispose() {
        mediaPlayer?.let {
            if (it.isPlaying) {
                it.stop()
            }
            it.release()
        }
    }

    init {
        context?.let { ct ->
            this.context = ct
            mediaPlayer = MediaPlayer()
            initializeMediaPlayer()
            initializeView()
        }

    }

    private fun initializeMediaPlayer() {
        try {
            mediaPlayer!!.setDataSource(
                context!!,
                Uri.parse("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
            )
            mediaPlayer!!.prepareAsync()
            mediaPlayer!!.setOnPreparedListener { obj: MediaPlayer -> obj.start() }
            mediaPlayer!!.isLooping = true
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    private fun initializeView() {
        rootView = LayoutInflater.from(context).inflate(R.layout.layout, null) as LinearLayout
        val surfaceView = rootView!!.findViewById<SurfaceView>(R.id.surfaceView)
        surfaceView.holder.addCallback(this)
    }

    override fun surfaceCreated(holder: SurfaceHolder) {
        mediaPlayer?.setDisplay(holder);
        Log.d(TAG, "Surface created")
    }

    override fun surfaceChanged(holder: SurfaceHolder, format: Int, width: Int, height: Int) {
        Log.d(
            TAG,
            "Surface changed to format: " + format + " width: " + width + " height: " + height
        )
    }

    override fun surfaceDestroyed(holder: SurfaceHolder) {
        Log.d(TAG, "Surface destroyed")
    }
}
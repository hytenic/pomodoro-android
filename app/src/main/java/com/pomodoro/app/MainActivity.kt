package com.pomodoro.app

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.pomodoro.app.ui.theme.PomodoroTheme
import kotlinx.coroutines.delay

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            PomodoroTheme {
                PomodoroApp()
            }
        }
    }
}

@Composable
fun PomodoroApp() {
    var remainingTime by remember { mutableStateOf(25 * 60) }
    var isRunning by remember { mutableStateOf(false) }

    LaunchedEffect(isRunning) {
        if (isRunning) {
            while (remainingTime > 0) {
                delay(1000)
                remainingTime--
            }
            isRunning = false
        }
    }

    Surface(
        modifier = Modifier.fillMaxSize(),
        color = if (isRunning) Color(0xFFFFCDD2) else MaterialTheme.colorScheme.background
    ) {
        Box(contentAlignment = Alignment.Center) {
            if (isRunning) {
                val progress = remainingTime / (25f * 60f)
                Canvas(modifier = Modifier.fillMaxSize()) {
                    val diameter = size.minDimension * 0.8f
                    val strokeWidth = 16.dp.toPx()
                    val topLeft = Offset(
                        x = (size.width - diameter) / 2,
                        y = (size.height - diameter) / 2
                    )

                    // 반시계 방향으로 사라지도록 시작 각도 계산
                    val startAngle = -90f - (360f * (1f - progress))

                    drawArc(
                        color = Color.Red,
                        startAngle = startAngle,
                        sweepAngle = 360f * progress,
                        useCenter = false,
                        topLeft = topLeft,
                        size = Size(diameter, diameter),
                        style = Stroke(width = strokeWidth)
                    )
                }
            }

            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Text(
                    text = "%02d:%02d".format(remainingTime / 60, remainingTime % 60),
                    fontSize = 80.sp,
                    color = if (isRunning) Color.Black else MaterialTheme.colorScheme.onSurface
                )

                Button(onClick = { isRunning = !isRunning }) {
                    Text(text = if (isRunning) "정지" else "시작")
                }

                Spacer(modifier = Modifier.height(8.dp))

                Button(
                    onClick = {
                        isRunning = false
                        remainingTime = 25 * 60
                    },
                    enabled = !isRunning && remainingTime < 25 * 60
                ) {
                    Text(text = "초기화")
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun PomodoroAppPreview() {
    PomodoroTheme {
        PomodoroApp()
    }
}

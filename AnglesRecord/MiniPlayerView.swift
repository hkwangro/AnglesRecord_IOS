import SwiftUI

struct MiniPlayerView: View {
    let record: AudioRecord
    @ObservedObject var audioPlayer: AudioPlayerManager
    let onDelete: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            // Progress Bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 3)
                    
                    Rectangle()
                        .fill(Color.primary)
                        .frame(width: geometry.size.width * (audioPlayer.currentTime / max(audioPlayer.duration, 1)), height: 3)
                }
            }
            .frame(height: 3)
            
            HStack(spacing: 20) {
                // Waveform Icon
                Image(systemName: "waveform")
                    .font(.title2)
                    .foregroundColor(.primary)
                    .symbolEffect(.variableColor.iterative, options: .repeating, isActive: audioPlayer.isPlaying)
                
                // Skip Backward
                Button(action: {
                    audioPlayer.skip(seconds: -15)
                }) {
                    ZStack {
                        Circle()
                            .stroke(Color.primary, lineWidth: 2)
                            .frame(width: 44, height: 44)
                        
                        VStack(spacing: 0) {
                            Image(systemName: "gobackward")
                                .font(.system(size: 16))
                            Text("15")
                                .font(.system(size: 10))
                        }
                    }
                }
                .foregroundColor(.primary)
                
                // Play/Pause
                Button(action: {
                    audioPlayer.togglePlayPause()
                }) {
                    ZStack {
                        Circle()
                            .stroke(Color.primary, lineWidth: 2)
                            .frame(width: 56, height: 56)
                        
                        Image(systemName: audioPlayer.isPlaying ? "pause.fill" : "play.fill")
                            .font(.title2)
                    }
                }
                .foregroundColor(.primary)
                
                // Skip Forward
                Button(action: {
                    audioPlayer.skip(seconds: 15)
                }) {
                    ZStack {
                        Circle()
                            .stroke(Color.primary, lineWidth: 2)
                            .frame(width: 44, height: 44)
                        
                        VStack(spacing: 0) {
                            Image(systemName: "goforward")
                                .font(.system(size: 16))
                            Text("15")
                                .font(.system(size: 10))
                        }
                    }
                }
                .foregroundColor(.primary)
                
                Spacer()
                
                // Time Display
                Text("\(formatTime(audioPlayer.currentTime)) / \(formatTime(audioPlayer.duration))")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .monospacedDigit()
                
                // Delete Button
                Button(action: onDelete) {
                    Image(systemName: "trash")
                        .font(.title2)
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
        .background(
            Color(UIColor.systemBackground)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
        )
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
} 
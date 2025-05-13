//
//  ContentView.swift
//  iQuizPart2
//
//  Created by Maansi Surve on 5/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTopic: QuizTopic? = nil
    @State private var isQuizActive = false
    
    var body: some View {
        NavigationView {
            if isQuizActive, let topic = selectedTopic {
                QuizView(topic: topic, isQuizActive: $isQuizActive)
            } else {
                TopicListView(selectedTopic: $selectedTopic, isQuizActive: $isQuizActive)
            }
        }
    }
}

struct TopicListView: View {
    @Binding var selectedTopic: QuizTopic?
    @Binding var isQuizActive: Bool
    
    let topics = [
        QuizTopic(name: "Music 🎶", questions: [
            Question(text: "Who sings the song 'good 4 u'?", answers: ["Tate Mcrae", "Olivia Rodrigo", "Selena Gomez", "Taylor Swift"], correctAnswer: 1),
            Question(text: "Who sings the song 'we can't be friends'?", answers: ["Ariana Grande", "Taylor Swift", "The Weeknd", "Harry Styles"], correctAnswer: 0),
            Question(text: "Who sings the song 'Super Bass'?", answers: ["Latto", "21 Savage", "Nicki Minaj", "Hasan Minhaj"], correctAnswer: 2)
        ]),
        QuizTopic(name: "Math 🧮", questions: [
            Question(text: "What is the square root of 64?", answers: ["8", "9", "6", "5"], correctAnswer: 0),
            Question(text: "What is the square root of 16?", answers: ["7", "4", "3", "10"], correctAnswer: 1),
            Question(text: "What is the square root of 25?", answers: ["5", "7", "4", "6"], correctAnswer: 0)
        ]),
        QuizTopic(name: "UW Fun Facts 📚", questions: [
            Question(text: "What are UW's school colors?", answers: ["Blue & White", "Purple & White", "Purple & Gold", "Gold & White"], correctAnswer: 2),
            Question(text: "What is the UW mascot?", answers: ["Bears", "Huskies", "Trees", "Banana Slugs"], correctAnswer: 1),
            Question(text: "What the the UW Seattle zip code?", answers: ["98105", "98108", "98195", "98189"], correctAnswer: 2)
        ])
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            
            Spacer().frame(height: 20)
            
            ForEach(topics) { topic in
                Button(action: {
                    selectedTopic = topic
                    isQuizActive = true
                }) {
                    HStack {
                        Text(topic.name)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 255/255, green: 218/255, blue: 243/255))
                    )
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationTitle("Pick a topic!")
    }
}

#Preview {
    ContentView()
}

//
//  UserAgreementView.swift

//
//  Created by Maksim on 20.03.2025.
//

import SwiftUI
import WebKit

struct UserAgreementView: View {
    @Environment(\.dismiss) var dismiss
    static var urlString = "https://yandex.ru/legal/practicum_offer"
      var body: some View {
          VStack {
              WebView(urlString: UserAgreementView.urlString)
          }
          .navigationTitle("Пользовательское соглашение")
          .navigationBarStyle(dismissAction: {
              dismiss()
          })
          .background(.whiteDay)
          .ignoresSafeArea(.container, edges: .bottom)

      }
  }

  struct WebView: UIViewRepresentable {
      let urlString: String
      
      func makeUIView(context: Context) -> WKWebView {
          let webView = WKWebView()
          loadURL(webView: webView)
          return webView
      }
      
      func updateUIView(_ uiView: WKWebView, context: Context) {
          loadURL(webView: uiView)
      }
      
      private func loadURL(webView: WKWebView) {
          if let url = URL(string: urlString), webView.url != url {
              webView.load(URLRequest(url: url))
          }
      }
  }
#Preview {
    UserAgreementView()
}

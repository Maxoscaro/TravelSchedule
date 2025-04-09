//
//  UserAgreementView.swift

//
//  Created by Maksim on 20.03.2025.
//

import SwiftUI
import WebKit

struct UserAgreementView: View {
    @Environment(\.dismiss) var dismiss
      var body: some View {
          VStack {
              WebView(urlString: Constants.urlString)
          }
          .navigationTitle("Пользовательское соглашение")
          .customBackButtonStyle(dismissAction: {
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
      
      @MainActor private func loadURL(webView: WKWebView) {
          if let url = URL(string: urlString), webView.url != url {
              webView.load(URLRequest(url: url))
          }
      }
  }
#Preview {
    UserAgreementView()
}

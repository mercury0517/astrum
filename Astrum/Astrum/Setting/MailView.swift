//
//  MailView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/28.
//

import SwiftUI

import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    @Binding var isShowing: Bool

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> UIViewController {
        let controller = MFMailComposeViewController()
        controller.mailComposeDelegate = context.coordinator
        controller.setSubject("")
        controller.setToRecipients(["astrum6444@gmail.com"])
        controller.setMessageBody("", isHTML: false)
        return controller
    }

    func makeCoordinator() -> MailView.Coordinator {
        return Coordinator(parent: self)
    }

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
        let parent: MailView
        init(parent: MailView) {
            self.parent = parent
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            self.parent.isShowing = false
        }
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<MailView>) {
    }
}

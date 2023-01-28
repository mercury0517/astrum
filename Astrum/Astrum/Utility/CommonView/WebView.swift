//
//  WebView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/28.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let isprivacyPolicy: Bool

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let html = isprivacyPolicy ? privacyPolicyHTML : termOfUseHTML
        
        uiView.loadHTMLString(html, baseURL: nil)
    }

    private var privacyPolicyHTML: String {
        return """
        <!DOCTYPE html>
            <html>
            <head>
              <meta charset='utf-8'>
              <meta name='viewport' content='width=device-width'>
              <title><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">プライバシーポリシー</font></font></title>
              <style> body { font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; padding:1em; background-color: black; color: #fff; } a { color: #99CCFF; } </style>
            </head>
            <body>
            <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">プライバシーポリシー</font></font></strong> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          [開発者/会社名] は、Astrum アプリを [オープン ソース/無料/フリーミアム/広告サポート/商用] アプリとして構築しました。</font><font style="vertical-align: inherit;">このサービスは、[開発者/会社名] によって [無料] で提供され、そのまま使用することを目的としています。
                        </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          このページは、誰かが [my/our] サービスを使用することを決定した場合に、個人情報の収集、使用、および開示に関する [my/our] ポリシーについて訪問者に通知するために使用されます。
                        </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          [my/our] サービスの使用を選択した場合、このポリシーに関連する情報の収集と使用に同意したことになります。</font><font style="vertical-align: inherit;">[私/私たち] が収集する個人情報は、本サービスの提供および改善のために使用されます。</font><font style="vertical-align: inherit;">[私/私たち] は、このプライバシー ポリシーに記載されている場合を除き、お客様の情報を使用または共有しません。
                        </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          このプライバシー ポリシーで使用される用語は、このプライバシー ポリシーで別段の定義がない限り、Astrum でアクセス可能な利用規約と同じ意味を持ちます。
                        </font></font></p> <p><strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">情報の収集と使用</font></font></strong></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          より良い体験のために、私たちのサービスを使用している間、[私/私たちは]特定の個人を特定できる情報を提供するようにあなたに要求する場合があります. [私たち] の要求は [あなたのデバイスに保持され、[私/私たち] によって収集されることはありません]/[私たちによって保持され、このプライバシー ポリシーに記載されているとおりに使用されます].
                        </font></font></p> <div><p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                            アプリは、あなたを識別するために使用される情報を収集する可能性のあるサードパーティのサービスを使用します.
                          </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                            アプリが使用するサードパーティ サービス プロバイダーのプライバシー ポリシーへのリンク
                          </font></font></p> <ul><!----><li><a href="https://support.google.com/admob/answer/6128543?hl=en" target="_blank" rel="noopener noreferrer"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">AdMob</font></font></a></li><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></ul></div> <p><strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">ログデータ</font></font></strong></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          [私/私たち] は、[私/私たちの] サービスを使用するたびに、アプリでエラーが発生した場合に [私/私たち] はログと呼ばれる電話でデータと情報を (サードパーティ製品を通じて) 収集することをお知らせしますデータ。</font><font style="vertical-align: inherit;">このログ データには、デバイスのインターネット プロトコル (「IP」) アドレス、デバイス名、オペレーティング システムのバージョン、[my/our] サービスを利用する際のアプリの構成、サービスの使用日時などの情報が含まれる場合があります。 、およびその他の統計。
                        </font></font></p> <p><strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">クッキー</font></font></strong></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          Cookie は、匿名の一意の識別子として一般的に使用される少量のデータを含むファイルです。</font><font style="vertical-align: inherit;">これらは、アクセスした Web サイトからブラウザに送信され、デバイスの内部メモリに保存されます。
                        </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          このサービスは、これらの「Cookie」を明示的に使用しません。</font><font style="vertical-align: inherit;">ただし、アプリは、「Cookie」を使用して情報を収集し、サービスを改善するサードパーティのコードとライブラリを使用する場合があります。</font><font style="vertical-align: inherit;">これらの Cookie を受け入れるか拒否するかを選択でき、いつ Cookie がデバイスに送信されるかを知ることができます。</font><font style="vertical-align: inherit;">当社のクッキーを拒否することを選択した場合、本サービスの一部を使用できない場合があります。
                        </font></font></p> <p><strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">サービスプロバイダー</font></font></strong></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          [私/私たち] は、次の理由により、サードパーティの企業および個人を雇用する場合があります。
                        </font></font></p> <ul><li><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">当社のサービスを促進するため。</font></font></li> <li><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">当社に代わってサービスを提供するため。</font></font></li> <li><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">サービスに関連するサービスを実行するため。</font><font style="vertical-align: inherit;">また</font></font></li> <li><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">当社のサービスがどのように使用されているかを分析するのに役立ちます。</font></font></li></ul> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          [私/私たち] は、これらの第三者がユーザーの個人情報にアクセスできることを、このサービスのユーザーに通知したいと考えています。</font><font style="vertical-align: inherit;">その理由は、私たちに代わって彼らに割り当てられたタスクを実行するためです。</font><font style="vertical-align: inherit;">ただし、他の目的で情報を開示または使用しないことが義務付けられています。
                        </font></font></p> <p><strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">安全</font></font></strong></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          [私/私たち] は、お客様の個人情報を提供してくださるお客様の信頼を尊重しており、商業的に許容される手段を使用して保護するよう努めています。</font><font style="vertical-align: inherit;">ただし、インターネットを介した送信方法や電子ストレージの方法は 100% 安全で信頼できるものではなく、[私/私たち] は絶対的なセキュリティを保証できないことを忘れないでください。
                        </font></font></p> <p><strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">他のサイトへのリンク</font></font></strong></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          本サービスには、他のサイトへのリンクが含まれている場合があります。</font><font style="vertical-align: inherit;">サードパーティのリンクをクリックすると、そのサイトに移動します。</font><font style="vertical-align: inherit;">これらの外部サイトは [me/us] によって運営されていないことに注意してください。</font><font style="vertical-align: inherit;">したがって、[私/私たち] は、これらの Web サイトのプライバシー ポリシーを確認することを強くお勧めします。</font><font style="vertical-align: inherit;">[私/私たちは] 第三者のサイトまたはサービスのコンテンツ、プライバシー ポリシー、または慣行を管理することはできず、責任を負うこともありません。
                        </font></font></p> <p><strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">子供のプライバシー</font></font></strong></p> <div><p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                            これらのサービスは、13 歳未満の者には対応していません。[私/私たち] は、13 歳未満の子供から故意に個人を特定できる情報を収集しません。</font><font style="vertical-align: inherit;">[私/私たち] が 13 歳未満の子供が [私/私たち] に個人情報を提供したことを発見した場合、[私/私たち] は直ちにサーバーからこれを削除します。</font><font style="vertical-align: inherit;">あなたが親または保護者であり、お子様が個人情報を当社に提供したことを認識している場合は、[私/私たち] が必要な措置を講じられるように、[私/私たち] に連絡してください。
                          </font></font></p></div> <!----> <p><strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">このプライバシーポリシーの変更</font></font></strong></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          [私/私たち] は、プライバシー ポリシーを随時更新する場合があります。</font><font style="vertical-align: inherit;">したがって、変更がないか定期的にこのページを確認することをお勧めします。</font><font style="vertical-align: inherit;">[私/私たち] は、このページに新しいプライバシー ポリシーを掲載することにより、変更を通知します。
                        </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">このポリシーは 2023 年 1 月 28 日から有効です</font></font></p> <p><strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">お問い合わせ</font></font></strong></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          [my/our] のプライバシー ポリシーについてご質問やご提案がございましたら、[me/us] astrum6444@gmail.com までお気軽にお問い合わせください。
                        </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">このプライバシー ポリシー ページは、</font></font><a href="https://privacypolicytemplate.net" target="_blank" rel="noopener noreferrer"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">privacypolicytemplate.netで作成され、 </font></font></a><font style="vertical-align: inherit;"><a href="https://app-privacy-policy-generator.nisrulz.com/" target="_blank" rel="noopener noreferrer"><font style="vertical-align: inherit;">App Privacy Policy Generator</font></a><font style="vertical-align: inherit;">によって変更/生成されました</font></font><a href="https://app-privacy-policy-generator.nisrulz.com/" target="_blank" rel="noopener noreferrer"><font style="vertical-align: inherit;"></font></a></p>
            </body>
            </html>
        """
    }
    private var termOfUseHTML: String {
        return """
        <!DOCTYPE html>
            <html>
            <head>
              <meta charset='utf-8'>
              <meta name='viewport' content='width=device-width'>
              <title><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">利用規約</font></font></title>
              <style> body { font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; padding:1em; background-color: black; color: #fff; } a { color: #99CCFF; } </style>
            </head>
            <body>
            <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">利用規約</font></font></strong> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          アプリをダウンロードまたは使用することにより、これらの条件が自動的に適用されます。そのため、アプリを使用する前に、これらの条件をよくお読みください。</font><font style="vertical-align: inherit;">アプリ、アプリの一部、または当社の商標をコピーまたは変更することは、いかなる方法でも許可されていません。</font><font style="vertical-align: inherit;">アプリのソース コードを抽出することは許可されていません。また、アプリを他の言語に翻訳したり、派生バージョンを作成したりすることもできません。</font><font style="vertical-align: inherit;">アプリ自体、およびそれに関連するすべての商標、著作権、データベース権、およびその他の知的財産権は、引き続き [開発者/会社名] に属します。
                        </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          [開発者/会社名] は、アプリができる限り便利で効率的なものになるよう努めています。</font><font style="vertical-align: inherit;">そのため、当社はいつでも理由の如何を問わず、アプリを変更したり、そのサービスの料金を請求したりする権利を留保します。</font><font style="vertical-align: inherit;">アプリまたはそのサービスに対して料金を請求することは決してありません。
                        </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          Astrum アプリは、[my/our] サービスを提供するために、お客様が提供した個人データを保存および処理します。</font><font style="vertical-align: inherit;">携帯電話とアプリへのアクセスを安全に保つことは、あなたの責任です。</font><font style="vertical-align: inherit;">したがって、デバイスの公式オペレーティング システムによって課せられたソフトウェアの制限と制限を削除するプロセスである、電話をジェイルブレイクまたはルート化しないことをお勧めします。</font><font style="vertical-align: inherit;">お使いの携帯電話がマルウェア/ウイルス/悪意のあるプログラムに対して脆弱になり、携帯電話のセキュリティ機能が損なわれ、Astrum アプリが正常に動作しなくなるか、まったく動作しなくなる可能性があります。
                        </font></font></p> <div><p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                            アプリは、利用規約を宣言するサードパーティ サービスを使用します。
                          </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                            アプリが使用するサードパーティ サービス プロバイダーの利用規約へのリンク
                          </font></font></p> <ul><!----><li><a href="https://developers.google.com/admob/terms" target="_blank" rel="noopener noreferrer"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">AdMob</font></font></a></li><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></ul></div> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          [開発者/会社名] が責任を負わない特定の事項があることに注意してください。</font><font style="vertical-align: inherit;">アプリの特定の機能では、アプリがアクティブなインターネット接続を持っている必要があります。</font><font style="vertical-align: inherit;">接続は Wi-Fi またはモバイル ネットワーク プロバイダーによって提供されますが、[開発者/会社名] は、Wi-Fi にアクセスできない場合にアプリが完全な機能で動作しないことについて責任を負うことはできません。データ許容量が残っています。
                        </font></font></p> <p></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          Wi-Fi のないエリアでアプリを使用している場合でも、モバイル ネットワーク プロバイダーとの契約条件が適用されることに注意してください。</font><font style="vertical-align: inherit;">その結果、アプリへのアクセス中の接続中のデータのコスト、またはその他のサードパーティの料金について、携帯電話会社から請求される場合があります。</font><font style="vertical-align: inherit;">アプリを使用する際、データ ローミングをオフにせずにホーム テリトリー (地域または国) 以外でアプリを使用した場合のローミング データ料金を含む、そのような料金の責任を負うことになります。</font><font style="vertical-align: inherit;">アプリを使用しているデバイスの請求書の支払者でない場合は、
                        </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          同様に、[開発者/会社名] は、アプリの使用方法について常に責任を負うことはできません。つまり、デバイスが充電されていることを確認する必要があります。バッテリーが切れて、電源を入れて利用できない場合です。本サービスに関して、[開発者/会社名]は責任を負いかねます。
                        </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          アプリの使用に対する [開発者/会社名] の責任に関して、アプリを使用している場合は、アプリが常に最新で正しいものであるように努めていますが、お客様が情報を利用できるようにするために、第三者に情報を提供していただく必要があります。</font><font style="vertical-align: inherit;">[開発者/会社名] は、アプリのこの機能に完全に依存した結果として発生する、直接的または間接的な損失について一切の責任を負いません。
                        </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          ある時点で、アプリの更新が必要になる場合があります。</font><font style="vertical-align: inherit;">アプリは現在 iOS で利用できます。システムの要件 (およびアプリの可用性を拡張することを決定した追加のシステム) は変更される可能性があり、アプリを引き続き使用する場合は、更新をダウンロードする必要があります。 . </font><font style="vertical-align: inherit;">[開発者/会社名] は、常にアプリを更新して、ユーザーに関連するようにしたり、デバイスにインストールされている iOS バージョンで動作することを約束するものではありません。</font><font style="vertical-align: inherit;">ただし、提供されたアプリケーションの更新を常に受け​​入れることを約束してください。また、アプリの提供を停止したい場合もあります。</font><font style="vertical-align: inherit;">また、お客様に終了の通知をすることなく、いつでもその使用を終了することができます。</font><font style="vertical-align: inherit;">別段の通知がない限り、契約が終了すると、(a) これらの条件で付与された権利とライセンスは終了します。</font><font style="vertical-align: inherit;">(b) アプリの使用を停止し、(必要に応じて) デバイスからアプリを削除する必要があります。
                        </font></font></p> <p><strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">この利用規約の変更</font></font></strong></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          [私/私たち] は、利用規約を随時更新する場合があります。</font><font style="vertical-align: inherit;">したがって、変更がないか定期的にこのページを確認することをお勧めします。</font><font style="vertical-align: inherit;">[私/私たち] は、このページに新しい利用規約を掲載することにより、変更を通知します。
                        </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          これらの利用規約は 2023 年 1 月 28 日から有効です。
                        </font></font></p> <p><strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">お問い合わせ</font></font></strong></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          [my/our] の利用規約についてご質問やご提案がございましたら、[me/us] astrum6444@gmail.com までお気軽にお問い合わせください。
                        </font></font></p> <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">この利用規約ページは、</font></font><a href="https://app-privacy-policy-generator.nisrulz.com/" target="_blank" rel="noopener noreferrer"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">App Privacy Policy Generatorによって生成されました</font></font></a></p>
            </body>
            </html>
        """
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(isprivacyPolicy: true)
    }
}

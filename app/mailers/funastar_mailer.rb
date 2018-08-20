class FunastarMailer < ApplicationMailer
  layout 'mailer'
  def funastar_mail(funastar)
    @funastar = funastar
    mail to: "自分のメールアドレス", subject: "お問い合わせの確認メール"
  end
end

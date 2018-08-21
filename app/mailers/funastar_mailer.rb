class FunastarMailer < ApplicationMailer
  layout 'mailer'
  def funastar_mail(funastar)
    @funastar = funastar
    mail to: "  @funastar.user_id = current_user.id", subject: "投稿確認メール"
  end
end

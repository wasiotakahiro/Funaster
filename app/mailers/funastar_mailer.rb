class FunastarMailer < ApplicationMailer
  layout 'mailer'
  def funastar_mail(funastar)
    @funastar = funastar
    @url = 'https://sheltered-scrubland-71446.herokuapp.com/'
      mail(to: funastar.user.email, subject: '投稿しました')
  end
end

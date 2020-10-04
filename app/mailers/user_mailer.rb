class UserMailer < Devise::Mailer
  default from: 'Bao Chinh website <baochinh0392@gmail.com>'

  def headers_for(action, opts)
    super.merge!(template_path: 'recruiter/auth/mailer')
  end
end
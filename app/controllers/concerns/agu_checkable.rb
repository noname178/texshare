module AguCheckable
  require 'mechanize'
  require 'nokogiri'

  def agu_authenticate?(num, pass)
    student_num = num
    password = pass
    confirm(student_num, password)
  end

  def confirm(num, pass)
    agent = Mechanize.new
    agent.get("https://aoyama-portal.aoyama.ac.jp/aogaku_auth/jsp/AUTH01.jsp") do |page|
      response = page.form_with(action: '/siteminderagent/forms/login.fcc') do |form|
        form.field_with(name: 'USER').value = num
        form.field_with(name: 'PASSWORD').value = pass
      end.submit
    end
    agent.get("https://aguinfo.jm.aoyama.ac.jp/AGUInfo/") do |page|
      if page.at('#fra_header')
        return true
      else
        return false
      end
    end
  end

end
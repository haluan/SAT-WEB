module SessionsHelper
  
  def kategori_choice
    @options = Category.only(:name).no_timeout.map do |s, k|
      [s.name, s.name]
    end
  end

  def organisasi_choice
    @options = Organisasi.only(:name).no_timeout.map do |s, k|
      [s.name, s.name]
    end
  end
	def sign_in(nama, pass)    
	    cookies.permanent[:ingat_aku] = nama<<pass
	    self.user_sekarang = nama
	end

  def signed_in?
    !user_sekarang.nil?
  end

  def user_sekarang=(user)
    @user_sekarang = user
  end

  def user_sekarang
    @user_sekarang ||= cookies[:ingat_aku] if cookies[:ingat_aku]
  end


  def sign_out
    user_sekarang = nil
    cookies.delete(:ingat_aku)
    cookies.delete(:admin)
  end
end

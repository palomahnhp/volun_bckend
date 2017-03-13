class UwebAuthenticator

  attr_accessor :uweb_user_data

  def initialize(data = {})
    @user_params = { login: data[:login] }.with_indifferent_access
  end

  def authenticate!
    return nil unless @user_params[:login]
    return uweb_user_data if user_exists?
    nil
  end

  private

    def user_exists?
      response        = client.call(:get_user_data_by_login, message: { ub: { login: @user_params[:login] } }).body
      parsed_response = parser.parse(response[:get_user_data_by_login_response][:get_user_data_by_login_return])
      self.uweb_user_data = get_uweb_user_data!(parsed_response)
      @user_params[:login] == uweb_user_data[:login]
    rescue  Exception  => e
      Rails.logger.error('UwebAuthenticator#user_exists?') do
        "Error llamada UWEB: get_user_data_by_login - #{@user_params}: \n#{e}"
      end
      false
    end

    def get_uweb_user_data!(parsed_response)
      user_data = parsed_response.fetch('USUARIO')
      {
        login:             user_data['LOGIN'],
        uweb_id:           user_data['CLAVE_IND'],
        name:              user_data['NOMBRE_USUARIO'],
        surname:           user_data['APELLIDO1_USUARIO'],
        last_name_alt:     user_data['APELLIDO2_USUARIO'],
        document:          user_data['DNI'],
        phone:             user_data['TELEFONO'],
        email:             user_data['MAIL'],
        official_position: user_data['CARGO'],
        personal_number:   user_data['NUM_PERSONAL']
      }
    end

    def client
      @client ||= Savon.client(wsdl: Rails.application.secrets.uweb_wsdl, raise_errors: true)
    end

    def parser
      @parser ||= Nori.new
    end
end 

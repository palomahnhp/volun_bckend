class UwebAuthenticator

  attr_accessor :errors, :uweb_user_data

  def initialize(data = {})
    @user_params = { login: data[:login] }.with_indifferent_access
    @errors      = []
  end

  def valid?
    unless @user_params[:login].present?
      errors << I18n.t('errors.missing_required_fields', default: 'Missing required fields' )
    end
    errors.blank?
  end

  def authenticate
    valid? && user_exists?
  end

  def user_exists?
    # response            = client.call(:get_user_data_by_login, message: { ub: { login: @user_params[:login] } }).body
    # parsed_response     = parser.parse(response[:get_user_data_by_login_response][:get_user_data_by_login_return])
    # self.uweb_user_data = Hash.deep_strip! get_uweb_user_data(parsed_response)
    self.uweb_user_data = Hash.deep_strip! :login=>"MGM108", :uweb_id=>"11414069", :name=>"MARIA LUZ           ", :last_name=>"GARCIA                   ", :last_name_alt=>"MATEO                                             ", :document=>"51323885Y", :phone_number=>"914801123 (41123)", :email=>nil, :official_position=>nil, :personal_number=>"0"
    uweb_user_data[:login].present?
  rescue  Exception  => e
    Rails.logger.error('UwebAuthenticator#user_exists?') do
      "Error llamada UWEB: get_user_data_by_login - #{@user_params}: \n#{e}"
    end
    errors << generate_error_message(e.message)
    false
  end

  private

    def generate_error_message(message)
      not_found_error_pattern = 'Usuario .* no encontrado'
      if /#{not_found_error_pattern}/ === message
        message.sub(/(?:(?!\b#{not_found_error_pattern}\b).)*/, '')
      else
        I18n.t('errors.service_temporally_unavailable',
               default: 'Service temporally unavailable. Please, try later.')
      end
    end

    def get_uweb_user_data(parsed_response)
      user_data = parsed_response.fetch('USUARIO')
      {
        login:             user_data['LOGIN'],
        uweb_id:           user_data['CLAVE_IND'],
        name:              user_data['NOMBRE_USUARIO'],
        last_name:         user_data['APELLIDO1_USUARIO'],
        last_name_alt:     user_data['APELLIDO2_USUARIO'],
        document:          user_data['DNI'],
        phone_number:      user_data['TELEFONO'],
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

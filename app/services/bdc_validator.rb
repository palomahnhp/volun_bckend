class BdcValidator

  def initialize(data = {})
    @user_params = { login: data[:login] }.with_indifferent_access
  end

  def clean_hash(hash)
    return '' unless hash
    __hash = hash.inject({}) do |_hash, (k, v)|
       value = if v.is_a?(Hash)
                 clean_hash(value)
               elsif v.is_a?(String)
                 v.strip
               else
                 v
               end

       puts "++++++++++++++++++++++++ __hash #{value.inspect}"
      _hash.merge(k => value )

    end
    puts "++++++++++++++++++++++++ __hash #{__hash.inspect}"
    __hash
  end

  def extract_bdc_fields(address)
    bdc_fields_array = [
      :postal_code,
      :road_type,
      :road_name,
      :number_type,
      :number,
      :grader,
      :stairs_number,
      :floor_number,
      :door_number,
    ]
    address

    client = Savon.client(wsdl: "http://desa6inter.munimadrid.es/WSValidacionBDC/services/WSValidacionBDC/wsdl/WSValidacionBDC.wsdl", raise_errors: true)
    response = client.call(:validar_direccion, message: {nom_pais: "ESPAÑA", nom_provincia: "madrid", nom_pueblo: "madrid", nom_clase: "", nom_vial: "nuñez de balboa", nom_app: "", num_app: "2", cal_app: "", escalera: "", planta: "", puerta: "", intercambioBDC: "", aplicacion: 'VOLUN'})
    bdc_fields = response.body[:validar_direccion_response][:validar_direccion_return]
    parsed_body = clean_hash(bdc_fields)
  end

  private

    def user_exists?
      response        = client.call(:get_user_data_by_login, message: { ub: { login: @user_params[:login] } }).body
      parsed_response = parser.parse(response[:get_user_data_by_login_response][:get_user_data_by_login_return])
      self.uweb_user_data = get_uweb_user_data(parsed_response)
      @user_params[:login] == uweb_user_data[:login]
    rescue  Exception  => e
      Rails.logger.error('UwebAuthenticator#user_exists?') do
        "Error llamada UWEB: get_user_data_by_login - #{@user_params}: \n#{e}"
      end
      false
    end

    def get_uweb_user_data(parsed_response)
      user_data = parsed_response.fetch('USUARIO')
      {
        login:             user_data['LOGIN'],
        uweb_id:           user_data['CLAVE_IND'],
        name:              user_data['NOMBRE_USUARIO'],
        surname:           user_data['APELLIDO1_USUARIO'],
        second_surname:    user_data['APELLIDO2_USUARIO'],
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

class BdcValidator

  attr_accessor :bdc_fields, :clean_bdc_fields

  def initialize(bdc_fields = {})
    self.bdc_fields = bdc_fields.with_indifferent_access
  end

  def ndp_code
    clean_bdc_fields.dig(
      :bloquedireccion,
      :datosdireccion,
      :bloquepais,
      :bloqueprovincia,
      :bloquepoblacion,
      :bloquevial,
      :bloquenumero,
      :coddireccion
    )
  end

  def address_normalized?
    bdc_fields_msg = {
        nom_pais:       bdc_fields[:country],
        nom_provincia:  bdc_fields[:province],
        nom_pueblo:     bdc_fields[:town],
        nom_clase:      bdc_fields[:road_type],
        nom_vial:       bdc_fields[:road_name],
        nom_app:        bdc_fields[:road_number_type],
        num_app:        bdc_fields[:road_number],
        cal_app:        bdc_fields[:grader].present? ? bdc_fields[:grader] : '  ',
        escalera:       bdc_fields[:stairs],
        planta:         bdc_fields[:floor],
        puerta:         bdc_fields[:door],
        intercambioBDC: '',
        aplicacion:     Rails.application.secrets.bdc_app_name
    }

    response = client.call(:validar_direccion, message: bdc_fields_msg)
    self.clean_bdc_fields = deep_strip!(response.body[:validar_direccion_response][:validar_direccion_return])
    ndp_code.present?
  rescue  Exception  => e
    Rails.logger.error('BdcValidator#address_is_valid?') do
      "Error when calling BDC: \"validar_direccion\" - #{bdc_fields}: \n#{e}"
    end
    false
  end

  private

    # TODO move strip methods to a module or a helper

    def strip_hash_values(hash)
      hash.each { |_key, value| deep_strip!(value) }
    end

    def strip_array_values(array)
      array.each { |value| deep_strip!(value) }
    end

    def deep_strip!(value)
      case value
      when Hash   then strip_hash_values(value)
      when Array  then strip_array_values(value)
      when String then value.strip!
      else value
      end
    end

    # END TODO

    def one_country?
      @address_data[:estadopais] == '0'
    end

    def one_province?
      @address_data[:estadoprovincia] == '0'
    end

    def one_town?
      @address_data[:estadopoblacion] == '0'
    end

    def one_road_name?
      @address_data[:estadovial] == '0'
    end

    def one_road_number?
      @address_data[:estadonumero] == '0'
    end

    def road_number
      @address_data[:bloquepais][:bloqueprovincia][:bloquepoblacion][:bloquevial][:bloquenumero]
    end

    def road_numbers
      @address_data[:bloquepais][:bloqueprovincia][:bloquepoblacion][:bloquevial][:numeros][:numero]
    end

    def road_names
      @address_data[:bloquepais][:bloqueprovincia][:bloquepoblacion][:viales][:vial]
    end

    def road_towns
      @address_data[:bloquepais][:bloqueprovincia][:poblaciones][:poblacion]
    end

    def road_provinces
      @address_data[:bloquepais][:provincias][:provincia]
    end

    def road_countries
      @address_data[:paises][:pais]
    end

    def valid?
      @address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion, :bloquevial, :bloquenumero).present?
    end

    def address_result
      return road_countries unless one_country?
      return road_provinces unless one_province?
      return road_towns     unless one_town?
      return road_names     unless one_road_name?
      return road_numbers   unless one_road_number?
      road_number
    end

    def client
      @client ||= Savon.client(wsdl: Rails.application.secrets.bdc_wsdl, raise_errors: true)
    end
end 

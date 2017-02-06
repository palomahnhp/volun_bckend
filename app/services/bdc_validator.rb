class BdcValidator

  attr_accessor :bdc_fields, :response_data, :address_data

  def initialize(bdc_fields = {})
    self.bdc_fields    = bdc_fields.with_indifferent_access
    self.response_data = {}
    self.address_data  = {}
  end

  def validate_address(bdc_fields = self.bdc_fields)
    response           = client.call(:validar_direccion, message: bdc_fields)
    self.response_data = deep_strip!(response.body[:validar_direccion_response][:validar_direccion_return])
    self.address_data  = response_data.present? ? response_data.dig(:bloquedireccion, :datosdireccion) : {}
    response_data
  rescue  Exception  => e
    Rails.logger.error('BdcValidator#validate_address') do
      "Error when calling BDC: \"validar_direccion\" - #{bdc_fields}: \n#{e}"
    end
    {}
  end

  def bloquevial
    road_name || {}
  end

  def bloquenumero
    bloquevial[:bloquenumero] || {}
  end

  def bloquelocal
    bloquenumero[:bloquelocal] || {}
  end

  def road_type
    bloquevial[:nomclase]
  end

  def ndp_code
    bloquenumero[:coddireccion]
  end

  def latitude
    bloquenumero[:coordx]
  end

  def longitude
    bloquenumero[:coordy]
  end

  def local_code
    bloquelocal[:codlocal]
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

    validate_address(bdc_fields_msg)
    ndp_code.present?
  end

  def road_number
    address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion, :bloquevial, :bloquenumero)
  end

  def road_name
    address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion, :bloquevial)
  end

  def road_town
    address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion)
  end

  def road_province
    address_data.dig(:bloquepais, :bloqueprovincia)
  end

  def road_country
    address_data.dig(:bloquepais)
  end

  def road_numbers
    address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion, :bloquevial, :numeros, :numero) || [road_number].compact
  end

  def road_names
    address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion, :viales, :vial) || [road_name].compact
  end

  def road_towns
    address_data.dig(:bloquepais, :bloqueprovincia, :poblaciones, :poblacion) || [road_town].compact
  end

  def road_provinces
    address_data.dig(:bloquepais, :provincias, :provincia) || [road_province].compact
  end

  def road_countries
    address_data.dig(:paises, :pais) || [road_country].compact
  end

  def valid?
    address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion, :bloquevial, :bloquenumero).present?
  end

  def search_towns
    return [] if bdc_fields[:country].blank? && bdc_fields[:province].blank? && bdc_fields[:town].blank?
    validate_address(bdc_fields_msg)
    road_towns.map { |town| town[:nompoblacion] }
  end

  def search_roads
    return if bdc_fields[:country].blank? && bdc_fields[:province].blank?
    validate_address(bdc_fields_msg)
    _road_names = [road_names].flatten
    _road_names.select! { |road| road[:nomclase] == bdc_fields[:road_type] } if bdc_fields[:road_type].present?
    _road_names.sort_by { |road| road[:nomvial] }
  end

  def search_road_numbers
    return if bdc_fields[:country].blank? && bdc_fields[:province].blank?
    validate_address(bdc_fields_msg.merge(nom_clase: bdc_fields[:road_type] || ''))
    road_numbers
  end

  private

    def bdc_fields_msg
      {
        nom_pais:       bdc_fields[:country],
        nom_provincia:  bdc_fields[:province],
        nom_pueblo:     bdc_fields[:town],
        nom_clase:      '',
        nom_vial:       bdc_fields[:road_name].present? ? bdc_fields[:road_name] : 'X',
        nom_app:        '',
        num_app:        '0',
        cal_app:        '',
        escalera:       '',
        planta:         '',
        puerta:         '',
        intercambioBDC: '',
        aplicacion:     Rails.application.secrets.bdc_app_name
      }
    end

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

    def client
      @client ||= Savon.client(wsdl: Rails.application.secrets.bdc_wsdl, raise_errors: true)
    end
end 

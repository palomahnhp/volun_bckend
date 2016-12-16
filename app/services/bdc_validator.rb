class BdcValidator

  attr_accessor :bdc_fields, :clean_bdc_fields, :address_data

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

  def country_unique?
    address_data.dig(:estadopais) == '0'
  end

  def province_unique?
    country_unique? && address_data.dig(:bloquepais, :estadoprovincia) == '0'
  end

  def town_unique?
    province_unique? && address_data.dig(:bloquepais, :bloqueprovincia, :estadopoblacion) == '0'
  end

  def road_name_unique?
    town_unique? && address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion, :estadovial) == '0'
  end

  def road_number_unique?
    road_name_unique? && address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion, :bloquevial, :estadonumero) == '0'
  end

  def road_number
    address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion, :bloquevial, :bloquenumero)
  end

  def road_numbers
    address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion, :bloquevial, :numeros, :numero)
  end

  def road_names
    address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion, :viales, :vial)
  end

  def road_name
    address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion, :bloquevial)
  end

  def road_towns
    address_data.dig(:bloquepais, :bloqueprovincia, :poblaciones, :poblacion)
  end

  def road_town
    address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion)
  end

  def road_provinces
    address_data.dig(:bloquepais, :bloqueprovincia, :provincias, :provincia)
  end

  def road_countries
    address_data.dig(:paises, :pais)
  end

  def valid?
    address_data.dig(:bloquepais, :bloqueprovincia, :bloquepoblacion, :bloquevial, :bloquenumero).present?
  end

  def address_result
    self.address_data = clean_bdc_fields[:bloquedireccion][:datosdireccion]
    return road_countries unless country_unique?
    return road_provinces unless province_unique?
    return road_towns     unless town_unique?
    return road_names     unless road_name_unique?
    return road_numbers   unless road_number_unique?
    road_number
  end

  def search_towns
    return [] if bdc_fields[:country].blank? && bdc_fields[:province].blank? && bdc_fields[:town].blank?
    bdc_fields_msg = {
      nom_pais:       bdc_fields[:country],
      nom_provincia:  bdc_fields[:province],
      nom_pueblo:     bdc_fields[:town],
      nom_clase:      '',
      nom_vial:       bdc_fields[:road_name].present? ? bdc_fields[:road_name] : 'X',
      nom_app:        '',
      num_app:        bdc_fields[:road_number].present? ? bdc_fields[:road_number] : '0',
      cal_app:        '',
      escalera:       '',
      planta:         '',
      puerta:         '',
      intercambioBDC: '',
      aplicacion:     Rails.application.secrets.bdc_app_name
    }
    response = client.call(:validar_direccion, message: bdc_fields_msg)
    self.clean_bdc_fields = deep_strip!(response.body[:validar_direccion_response][:validar_direccion_return])
    self.address_data = clean_bdc_fields[:bloquedireccion][:datosdireccion]
    if town_unique?
      [road_town[:nompoblacion]]
    elsif province_unique?
      road_towns.map { |town| town[:nompoblacion] }
    else
      []
    end
  end

  def search_roads
    return if bdc_fields[:country].blank? && bdc_fields[:province].blank?
    bdc_fields_msg = {
      nom_pais:       bdc_fields[:country],
      nom_provincia:  bdc_fields[:province],
      nom_pueblo:     bdc_fields[:town],
      nom_clase:      '',
      nom_vial:       bdc_fields[:road_name].present? ? bdc_fields[:road_name] : 'X',
      nom_app:        '',
      num_app:        bdc_fields[:road_number].present? ? bdc_fields[:road_number] : '0',
      cal_app:        '',
      escalera:       '',
      planta:         '',
      puerta:         '',
      intercambioBDC: '',
      aplicacion:     Rails.application.secrets.bdc_app_name
    }
    response = client.call(:validar_direccion, message: bdc_fields_msg)
    self.clean_bdc_fields = deep_strip!(response.body[:validar_direccion_response][:validar_direccion_return])
    self.address_data = clean_bdc_fields[:bloquedireccion][:datosdireccion]
    if road_name_unique?
      [road_name[:nomvial]]
    elsif town_unique?
      road_names.map { |town| town[:nomvial] }
    else
      []
    end
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

    def client
      @client ||= Savon.client(wsdl: Rails.application.secrets.bdc_wsdl, raise_errors: true)
    end
end 

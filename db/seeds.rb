ROAD_TYPES = %w(
  ACCESO ARROYO AUTOVIA AUTOPISTA AVENIDA BARRANCO BARRIO BULEVAR CARRERA CAÐADA CARRIL CALLEJON CALLE
  CAMINO CANAL COLONIA COMPLEJO CARRETERA COSTANILLA CANTON CUESTA EDIFICIO ESCALINATA ESTACION FINCA FUENTE
  GALERIA GRUPO GLORIETA GRAN JARDIN LUGAR MONUMENTO MONTE MERCADO PLAZUELA POBLADO PASADIZO PUENTE POLIGONO
  PISTA PASAJE PASEO PARQUE PARTICULAR PUERTA PLAZA RONDA RIO TRASERA TRAVESIA TRANSVERSAL URBANIZACION VIA
)

Setting.create(key: 'default_country', value: 'España')
Setting.create(key: 'default_province', value: 'Madrid')
Setting.create(key: 'road_types', value: ROAD_TYPES.join(','))

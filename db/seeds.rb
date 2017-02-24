ROAD_TYPES = %w(ACCESO ARROYO AUTOPISTA AUTOVIA AVENIDA BULEVAR CALLE CALLEJON CAMINO
                CAMINOALTO CARRERA CARRETERA CAÑADA COLONIA COSTANILLA CUESTA GALERIA GLORIETA
                PARQUE PARTICULAR PASADIZO PASAJE PASEO PISTA PLAZA PLAZUELA PUENTE RONDA TRAVESIA)

Setting.create(key: 'default_country', value: 'España')
Setting.create(key: 'default_province', value: 'Madrid')
Setting.create(key: 'road_types', value: ROAD_TYPES.join(','))

[NoticeType, Req::Status, ProjectType, RequestType, EventType, UnsubscribeLevel].each do |model|
  puts "#{I18n.t('creating')} #{model.model_name.human}"
  model.kinds.each do |kind_name , kind_num|
    model.create!(id: kind_num, kind: kind_num, description: kind_name)
  end
end

# The following data has been obtained from an access data base

## areas
puts "#{I18n.t('creating')} #{Area.model_name.human}"

Area.create!(id: 1,  name: 'Educación'             , active: true)
Area.create!(id: 2,  name: 'Acción Sanitaria'      , active: true)
Area.create!(id: 3,  name: 'Familia'               , active: true)
Area.create!(id: 4,  name: 'Orientación Laboral'   , active: true)
Area.create!(id: 5,  name: 'Enfermedad Mental'     , active: true)
Area.create!(id: 6,  name: 'Talleres Formación'    , active: true)
Area.create!(id: 7,  name: 'Cooperación'           , active: true)
Area.create!(id: 8,  name: 'Sensibilización'       , active: true)
Area.create!(id: 9,  name: 'Participación'         , active: true)
Area.create!(id: 10, name: 'Medio Ambiente'        , active: true)
Area.create!(id: 11, name: 'Emergencias'           , active: true)
Area.create!(id: 12, name: 'Actividades Culturales', active: true)
Area.create!(id: 13, name: 'Actividades Deportivas', active: true)
Area.create!(id: 14, name: 'Nuevas Tecnologías'    , active: true)
Area.create!(id: 15, name: 'Actuaciones Puntuales' , active: true)
Area.create!(id: 16, name: 'Gestión Administrativa', active: true)
Area.create!(id: 17, name: 'Indiferente'           , active: true)
Area.create!(id: 18, name: 'Otros'                 , active: true)




## degree_types
puts "#{I18n.t('creating')} #{DegreeType.model_name.human}"

DegreeType.create!(id: 1,  name: 'Ciencias Experimentales (PA)'      , active: true) # educational_type: 'A',
DegreeType.create!(id: 2,  name: 'Ciencias Sociales y Jurídicas (PA)', active: true) # educational_type: 'A',
DegreeType.create!(id: 3,  name: 'Enseñanzas Técnicas (PA)'          , active: true) # educational_type: 'A',
DegreeType.create!(id: 4,  name: 'Ciencias de la Salud (PA)'         , active: true) # educational_type: 'A',
DegreeType.create!(id: 5,  name: 'Humanidades'                       , active: true) # educational_type: 'N',
DegreeType.create!(id: 6,  name: 'Ciencias Experimentales'           , active: true) # educational_type: 'N',
DegreeType.create!(id: 7,  name: 'Ciencias Sociales y Jurídicas'     , active: true) # educational_type: 'N',
DegreeType.create!(id: 8,  name: 'Enseñanzas Técnicas'               , active: true) # educational_type: 'N',
DegreeType.create!(id: 9,  name: 'Ciencias de la Salud'              , active: true) # educational_type: 'N',
DegreeType.create!(id: 10, name: 'Otra Formación'                    , active: true) # educational_type: 'N',




##  languages
puts "#{I18n.t('creating')} #{Language.model_name.human}"

Language.create!(id: 1,  name: 'ALEMÁN'             , active: true)
Language.create!(id: 2,  name: 'ÁRABE'              , active: true)
Language.create!(id: 3,  name: 'BENGALÍ'            , active: true)
Language.create!(id: 4,  name: 'BEREBER'            , active: true)
Language.create!(id: 5,  name: 'BUBI'               , active: true)
Language.create!(id: 6,  name: 'BÚLGARO'            , active: true)
Language.create!(id: 7,  name: 'CANTONÉS'           , active: true)
Language.create!(id: 8,  name: 'CATALÁN'            , active: true)
Language.create!(id: 9,  name: 'CHECO'              , active: true)
Language.create!(id: 10, name: 'CHINO'              , active: true)
Language.create!(id: 11, name: 'COREANO'            , active: true)
Language.create!(id: 12, name: 'CROATA'             , active: true)
Language.create!(id: 13, name: 'DANÉS'              , active: true)
Language.create!(id: 14, name: 'ESPAÑOL'            , active: true)
Language.create!(id: 15, name: 'EUSKERA'            , active: true)
Language.create!(id: 16, name: 'FINLANDÉS'          , active: true)
Language.create!(id: 17, name: 'FRANCÉS'            , active: true)
Language.create!(id: 18, name: 'GALLEGO'            , active: true)
Language.create!(id: 19, name: 'GRIEGO'             , active: true)
Language.create!(id: 20, name: 'GUJARATI'           , active: true)
Language.create!(id: 21, name: 'HEBREO'             , active: true)
Language.create!(id: 22, name: 'HINDI'              , active: true)
Language.create!(id: 23, name: 'HOLANDÉS'           , active: true)
Language.create!(id: 24, name: 'HÚNGARO'            , active: true)
Language.create!(id: 25, name: 'INDONESIO'          , active: true)
Language.create!(id: 26, name: 'INGLÉS'             , active: true)
Language.create!(id: 27, name: 'ITALIANO'           , active: true)
Language.create!(id: 28, name: 'JAPONÉS'            , active: true)
Language.create!(id: 29, name: 'JAVENÉS'            , active: true)
Language.create!(id: 30, name: 'MALAYALAM'          , active: true)
Language.create!(id: 31, name: 'MARATHÍ'            , active: true)
Language.create!(id: 32, name: 'NORUEGO'            , active: true)
Language.create!(id: 33, name: 'PERSA (FARSI)'      , active: true)
Language.create!(id: 34, name: 'POLACO'             , active: true)
Language.create!(id: 35, name: 'PORTUGUÉS'          , active: true)
Language.create!(id: 36, name: 'PUNJABI'            , active: true)
Language.create!(id: 37, name: 'RUMANO'             , active: true)
Language.create!(id: 38, name: 'RUSO'               , active: true)
Language.create!(id: 39, name: 'SERBIO'             , active: true)
Language.create!(id: 40, name: 'SUECO'              , active: true)
Language.create!(id: 41, name: 'TAGALOG'            , active: true)
Language.create!(id: 42, name: 'TAILANDÉS'          , active: true)
Language.create!(id: 43, name: 'TAMIL'              , active: true)
Language.create!(id: 44, name: 'TELUGU'             , active: true)
Language.create!(id: 45, name: 'UCRANIANO'          , active: true)
Language.create!(id: 46, name: 'VIETNAMÉS'          , active: true)
Language.create!(id: 47, name: 'WU'                 , active: true)
Language.create!(id: 48, name: 'TURCO'              , active: true)
Language.create!(id: 49, name: 'QUECHUA'            , active: true)
Language.create!(id: 50, name: 'GUARANÍ'            , active: true)
Language.create!(id: 51, name: 'DIALECTOS AFRICANOS', active: true)
Language.create!(id: 52, name: 'GEORGIANO'          , active: true)
Language.create!(id: 53, name: 'OSETIANO'           , active: true)
Language.create!(id: 54, name: 'MANDINGA'           , active: true)
Language.create!(id: 55, name: 'LITUANO'            , active: true)
Language.create!(id: 56, name: 'ARMENIO'            , active: true)
Language.create!(id: 57, name: 'ESLOVENO'           , active: true)
Language.create!(id: 58, name: 'ESLOVACO'           , active: true)
Language.create!(id: 59, name: 'LETON'              , active: true)
Language.create!(id: 60, name: 'ESTONIO'            , active: true)
Language.create!(id: 61, name: 'FILIPINO'           , active: true)
Language.create!(id: 62, name: 'IRLANDES'           , active: true)
Language.create!(id: 63, name: 'VALENCIANO'         , active: true)
Language.create!(id: 64, name: 'URDU'               , active: true)
Language.create!(id: 65, name: 'PUSHTU'             , active: true)
Language.create!(id: 66, name: 'WOLOF'              , active: true)
Language.create!(id: 98, name: 'SIGNOS'             , active: true)
Language.create!(id: 99, name: 'OTROS'              , active: true)




## motivations
puts "#{I18n.t('creating')} #{Motivation.model_name.human}"

Motivation.create!(id: 1 , name: 'Sensibilidad hacia el otro'                              , active: true)
Motivation.create!(id: 2 , name: 'Búsqueda de satisfacción personal'                       , active: true)
Motivation.create!(id: 3 , name: 'Necesidad de sentirse útil'                              , active: true)
Motivation.create!(id: 4 , name: 'Distracción en el tiempo libre'                          , active: true)
Motivation.create!(id: 5 , name: 'Oportunidad de conocer gente nueva'                      , active: true)
Motivation.create!(id: 6 , name: 'Influencia de personas cercanas'                         , active: true)
Motivation.create!(id: 7 , name: 'Búsqueda de justicia social'                             , active: true)
Motivation.create!(id: 8 , name: 'Motivos religiosos'                                      , active: true)
Motivation.create!(id: 9 , name: 'Búsqueda de una transformación del sistema'              , active: true)
Motivation.create!(id: 10, name: 'Prestar ayuda'                                           , active: true)
Motivation.create!(id: 11, name: 'Búsqueda de experiencia laboral'                         , active: true)
Motivation.create!(id: 12, name: 'Identificación/pertenencia al colectivo objeto de ayuda' , active: true)
Motivation.create!(id: 13, name: 'Campaña de sensibilización ante situaciones coyunturales', active: true)
Motivation.create!(id: 14, name: 'Participación en actuaciones puntuales de voluntariado'  , active: true)
Motivation.create!(id: 15, name: 'Para recibir información sobre voluntariado'             , active: true)
Motivation.create!(id: 16, name: 'Prescripción facultativa'                                , active: true)
Motivation.create!(id: 99, name: 'Otras Motivaciones'                                      , active: true)




## unsubscribe_reasons
puts "#{I18n.t('creating')} #{UnsubscribeReason.model_name.human}"

UnsubscribeReason.create!(id: 1, name: 'Baja voluntaria'                  , active: true)
UnsubscribeReason.create!(id: 2, name: 'Incumplimiento de los compromisos', active: true)
UnsubscribeReason.create!(id: 3, name: 'Falta de integración'             , active: true)




## nationalities
puts "#{I18n.t('creating')} #{Nationality.model_name.human}"

Nationality.create!(id: 1,   name: 'ALEMANA'                     , active: true)
Nationality.create!(id: 2,   name: 'ÁRABE'                       , active: true)
Nationality.create!(id: 3,   name: 'ARGELINA'                    , active: true)
Nationality.create!(id: 4,   name: 'ARGENTINA'                   , active: true)
Nationality.create!(id: 5,   name: 'ARMENIA'                     , active: true)
Nationality.create!(id: 6,   name: 'AUSTRALIANA'                 , active: true)
Nationality.create!(id: 7,   name: 'AUSTRÍACA'                   , active: true)
Nationality.create!(id: 8,   name: 'AZERBAIYANA'                 , active: true)
Nationality.create!(id: 9,   name: 'BAHAMAS'                     , active: true)
Nationality.create!(id: 10,  name: 'BAHREIN'                     , active: true)
Nationality.create!(id: 11,  name: 'BANGLADESH'                  , active: true)
Nationality.create!(id: 12,  name: 'BELGA'                       , active: true)
Nationality.create!(id: 13,  name: 'BELICE'                      , active: true)
Nationality.create!(id: 14,  name: 'BERMUDAS'                    , active: true)
Nationality.create!(id: 15,  name: 'BIELORRUSIA'                 , active: true)
Nationality.create!(id: 16,  name: 'BOLIVIANA'                   , active: true)
Nationality.create!(id: 17,  name: 'BOSNIA'                      , active: true)
Nationality.create!(id: 18,  name: 'BRASILEÑA'                   , active: true)
Nationality.create!(id: 19,  name: 'BRUNEI'                      , active: true)
Nationality.create!(id: 20,  name: 'BÚLGARA'                     , active: true)
Nationality.create!(id: 21,  name: 'CAMERÚN'                     , active: true)
Nationality.create!(id: 22,  name: 'CANADIENSE'                  , active: true)
Nationality.create!(id: 23,  name: 'CHILENA'                     , active: true)
Nationality.create!(id: 24,  name: 'CHINA'                       , active: true)
Nationality.create!(id: 25,  name: 'CHIPRIOTA'                   , active: true)
Nationality.create!(id: 26,  name: 'COSTA DE MARFIL'             , active: true)
Nationality.create!(id: 27,  name: 'COLOMBIANA'                  , active: true)
Nationality.create!(id: 28,  name: 'COREANA'                     , active: true)
Nationality.create!(id: 29,  name: 'COSTARRICENSE'               , active: true)
Nationality.create!(id: 30,  name: 'CROATA'                      , active: true)
Nationality.create!(id: 31,  name: 'DANESA'                      , active: true)
Nationality.create!(id: 32,  name: 'EMIRATOS ÁRABES'             , active: true)
Nationality.create!(id: 33,  name: 'ECUATORIANA'                 , active: true)
Nationality.create!(id: 34,  name: 'activeUNIDENSE'              , active: true)
Nationality.create!(id: 35,  name: 'EGIPCIA'                     , active: true)
Nationality.create!(id: 36,  name: 'ESLOVACA'                    , active: true)
Nationality.create!(id: 37,  name: 'ESLOVENA'                    , active: true)
Nationality.create!(id: 38,  name: 'ESPAÑOLA'                    , active: true)
Nationality.create!(id: 39,  name: 'ESTONIANA'                   , active: true)
Nationality.create!(id: 40,  name: 'ETÍOPE'                      , active: true)
Nationality.create!(id: 41,  name: 'FILIPINA'                    , active: true)
Nationality.create!(id: 42,  name: 'FINLANDESA'                  , active: true)
Nationality.create!(id: 43,  name: 'FIYI'                        , active: true)
Nationality.create!(id: 44,  name: 'FRANCESA'                    , active: true)
Nationality.create!(id: 45,  name: 'GABÓN'                       , active: true)
Nationality.create!(id: 46,  name: 'GAMBIA'                      , active: true)
Nationality.create!(id: 47,  name: 'GEORGIANA'                   , active: true)
Nationality.create!(id: 48,  name: 'GRIEGA'                      , active: true)
Nationality.create!(id: 49,  name: 'GUATEMALTECA'                , active: true)
Nationality.create!(id: 50,  name: 'GUYANA'                      , active: true)
Nationality.create!(id: 51,  name: 'GUYANA FRANCESA'             , active: true)
Nationality.create!(id: 52,  name: 'HAITIANA'                    , active: true)
Nationality.create!(id: 53,  name: 'HOLANDESA'                   , active: true)
Nationality.create!(id: 54,  name: 'HONDUREÑA'                   , active: true)
Nationality.create!(id: 55,  name: 'HONG KONG'                   , active: true)
Nationality.create!(id: 56,  name: 'HÚNGARA'                     , active: true)
Nationality.create!(id: 57,  name: 'INDIA'                       , active: true)
Nationality.create!(id: 58,  name: 'INDONESIA'                   , active: true)
Nationality.create!(id: 59,  name: 'IRAKÍ'                       , active: true)
Nationality.create!(id: 60,  name: 'IRANÍ'                       , active: true)
Nationality.create!(id: 61,  name: 'IRLANDESA'                   , active: true)
Nationality.create!(id: 62,  name: 'ISLANDESA'                   , active: true)
Nationality.create!(id: 63,  name: 'ISRAELÍ'                     , active: true)
Nationality.create!(id: 64,  name: 'ITALIANA'                    , active: true)
Nationality.create!(id: 65,  name: 'JAMAICANA'                   , active: true)
Nationality.create!(id: 66,  name: 'JAPONESA'                    , active: true)
Nationality.create!(id: 67,  name: 'JORDANA'                     , active: true)
Nationality.create!(id: 68,  name: 'KAZAJSTÁN'                   , active: true)
Nationality.create!(id: 69,  name: 'KENIATA'                     , active: true)
Nationality.create!(id: 70,  name: 'KIRGUIZISTÁN'                , active: true)
Nationality.create!(id: 71,  name: 'KUWAITÍ'                     , active: true)
Nationality.create!(id: 72,  name: 'LETONIANA'                   , active: true)
Nationality.create!(id: 73,  name: 'LIBERIANA'                   , active: true)
Nationality.create!(id: 74,  name: 'LIBANESA'                    , active: true)
Nationality.create!(id: 75,  name: 'LIECHTENSTEIN'               , active: true)
Nationality.create!(id: 76,  name: 'LITUANA'                     , active: true)
Nationality.create!(id: 77,  name: 'LUXEMBURGUESA'               , active: true)
Nationality.create!(id: 78,  name: 'MACEDONIA'                   , active: true)
Nationality.create!(id: 79,  name: 'MALAISIA'                    , active: true)
Nationality.create!(id: 80,  name: 'MALAUI'                      , active: true)
Nationality.create!(id: 81,  name: 'MALTA'                       , active: true)
Nationality.create!(id: 82,  name: 'MARROQUÍ'                    , active: true)
Nationality.create!(id: 83,  name: 'MARTINICA'                   , active: true)
Nationality.create!(id: 84,  name: 'MAURITANA'                   , active: true)
Nationality.create!(id: 85,  name: 'MEXICANA'                    , active: true)
Nationality.create!(id: 86,  name: 'MOLDAVA'                     , active: true)
Nationality.create!(id: 87,  name: 'MONAGUESCA'                  , active: true)
Nationality.create!(id: 88,  name: 'NAMIBIA'                     , active: true)
Nationality.create!(id: 89,  name: 'NICARAGÜENSE'                , active: true)
Nationality.create!(id: 90,  name: 'NIGERIANA'                   , active: true)
Nationality.create!(id: 91,  name: 'NORUEGA'                     , active: true)
Nationality.create!(id: 92,  name: 'NEOZELANDESA'                , active: true)
Nationality.create!(id: 93,  name: 'OMÁN'                        , active: true)
Nationality.create!(id: 94,  name: 'PAKISTANÍ'                   , active: true)
Nationality.create!(id: 95,  name: 'PANAMEÑA'                    , active: true)
Nationality.create!(id: 96,  name: 'PAPÚA N GUINEA'              , active: true)
Nationality.create!(id: 97,  name: 'PARAGUAYA'                   , active: true)
Nationality.create!(id: 98,  name: 'PERUANA'                     , active: true)
Nationality.create!(id: 99,  name: 'POLACA'                      , active: true)
Nationality.create!(id: 100, name: 'PORTUGUESA'                  , active: true)
Nationality.create!(id: 101, name: 'PORTORRIQUEÑA'               , active: true)
Nationality.create!(id: 102, name: 'QATAR'                       , active: true)
Nationality.create!(id: 103, name: 'CHECA'                       , active: true)
Nationality.create!(id: 104, name: 'DOMINICANA'                  , active: true)
Nationality.create!(id: 105, name: 'RUMANA'                      , active: true)
Nationality.create!(id: 106, name: 'INGLESA'                     , active: true)
Nationality.create!(id: 107, name: 'RUSA'                        , active: true)
Nationality.create!(id: 108, name: 'SALVADOREÑA'                 , active: true)
Nationality.create!(id: 109, name: 'SENEGALESA'                  , active: true)
Nationality.create!(id: 110, name: 'SINGAPUR'                    , active: true)
Nationality.create!(id: 111, name: 'SRI LANKA'                   , active: true)
Nationality.create!(id: 112, name: 'SAN MARINO'                  , active: true)
Nationality.create!(id: 113, name: 'SUAZILANDIA'                 , active: true)
Nationality.create!(id: 114, name: 'SUECA'                       , active: true)
Nationality.create!(id: 115, name: 'SUIZA'                       , active: true)
Nationality.create!(id: 116, name: 'SURAFRICANA'                 , active: true)
Nationality.create!(id: 117, name: 'TAILANDESA'                  , active: true)
Nationality.create!(id: 118, name: 'TAIWANESA'                   , active: true)
Nationality.create!(id: 119, name: 'TANZANIA'                    , active: true)
Nationality.create!(id: 120, name: 'TAYIKISTÁN'                  , active: true)
Nationality.create!(id: 121, name: 'TRINIDAD TOBAGO'             , active: true)
Nationality.create!(id: 122, name: 'TUNECINA'                    , active: true)
Nationality.create!(id: 123, name: 'TURKMENISTÁN'                , active: true)
Nationality.create!(id: 124, name: 'TURCA'                       , active: true)
Nationality.create!(id: 125, name: 'UCRANIANA'                   , active: true)
Nationality.create!(id: 126, name: 'UGANDESA'                    , active: true)
Nationality.create!(id: 127, name: 'URUGUAYA'                    , active: true)
Nationality.create!(id: 128, name: 'UZBEKISTÁN'                  , active: true)
Nationality.create!(id: 129, name: 'VATICANA'                    , active: true)
Nationality.create!(id: 130, name: 'VENEZOLANA'                  , active: true)
Nationality.create!(id: 131, name: 'ZAIREÑA'                     , active: true)
Nationality.create!(id: 132, name: 'ZAMBIA'                      , active: true)
Nationality.create!(id: 133, name: 'ZIMBAUE'                     , active: true)
Nationality.create!(id: 134, name: 'CUBANA'                      , active: true)
Nationality.create!(id: 135, name: 'SUDANÉS'                     , active: true)
Nationality.create!(id: 136, name: 'APATRIDA'                    , active: true)
Nationality.create!(id: 137, name: 'GUINEANO'                    , active: true)
Nationality.create!(id: 138, name: 'MOZANBIQUEÑA'                , active: true)
Nationality.create!(id: 139, name: 'CABOVERDIANA'                , active: true)
Nationality.create!(id: 140, name: 'PENDIENTE'                   , active: true)
Nationality.create!(id: 142, name: 'CONGOLEÑO'                   , active: true)
Nationality.create!(id: 143, name: 'GHANA'                       , active: true)
Nationality.create!(id: 144, name: 'MALI'                        , active: true)
Nationality.create!(id: 145, name: 'SIRIA'                       , active: true)
Nationality.create!(id: 146, name: 'ANGOLEÑA'                    , active: true)
Nationality.create!(id: 147, name: 'NEPALÍ'                      , active: true)
Nationality.create!(id: 148, name: 'AFGANISTÁN'                  , active: true)
Nationality.create!(id: 149, name: 'ALBANIA'                     , active: true)
Nationality.create!(id: 150, name: 'ANDORRA'                     , active: true)
Nationality.create!(id: 151, name: 'ANGUILA'                     , active: true)
Nationality.create!(id: 152, name: 'ANTÁRTIDA'                   , active: true)
Nationality.create!(id: 153, name: 'ANTIGUA Y BARBUDA'           , active: true)
Nationality.create!(id: 154, name: 'ANTILLAS NEERLANDESAS'       , active: true)
Nationality.create!(id: 155, name: 'ARUBA'                       , active: true)
Nationality.create!(id: 156, name: 'BARBADOS'                    , active: true)
Nationality.create!(id: 157, name: 'BENÍN'                       , active: true)
Nationality.create!(id: 158, name: 'BOTSUANA'                    , active: true)
Nationality.create!(id: 159, name: 'BOUVET,ISLA'                 , active: true)
Nationality.create!(id: 160, name: 'BURKINESA'                   , active: true)
Nationality.create!(id: 161, name: 'BURUNDI'                     , active: true)
Nationality.create!(id: 162, name: 'BUTANESA'                    , active: true)
Nationality.create!(id: 163, name: 'CAIMÁN,ISLAS'                , active: true)
Nationality.create!(id: 164, name: 'CAMBOYA'                     , active: true)
Nationality.create!(id: 165, name: 'CENTROAFRICANA,REPÚBLICA'    , active: true)
Nationality.create!(id: 166, name: 'CEUTA'                       , active: true)
Nationality.create!(id: 167, name: 'COCOS (KEELING),ISLAS'       , active: true)
Nationality.create!(id: 168, name: 'COMORAS'                     , active: true)
Nationality.create!(id: 169, name: 'CONGO DEMOCRÁTICO'           , active: true)
Nationality.create!(id: 170, name: 'COOK,ISLAS'                  , active: true)
Nationality.create!(id: 171, name: 'NORCORENA'                   , active: true)
Nationality.create!(id: 172, name: 'CHAD'                        , active: true)
Nationality.create!(id: 173, name: 'DOMINICA'                    , active: true)
Nationality.create!(id: 174, name: 'ERITREA'                     , active: true)
Nationality.create!(id: 175, name: 'FEROE,ISLAS'                 , active: true)
Nationality.create!(id: 176, name: 'GEORGIA DEL SUR'             , active: true)
Nationality.create!(id: 177, name: 'GIBRALTAR'                   , active: true)
Nationality.create!(id: 178, name: 'GRANADA'                     , active: true)
Nationality.create!(id: 179, name: 'GROENLANDIA'                 , active: true)
Nationality.create!(id: 180, name: 'GUAM'                        , active: true)
Nationality.create!(id: 181, name: 'GUINEA ECUATORIAL'           , active: true)
Nationality.create!(id: 182, name: 'GUINEA-BISSAU'               , active: true)
Nationality.create!(id: 183, name: 'HEARD,ISLA Y MCDONALD,ISLAS' , active: true)
Nationality.create!(id: 184, name: 'KIRIBATI'                    , active: true)
Nationality.create!(id: 185, name: 'LAOSIANA'                    , active: true)
Nationality.create!(id: 186, name: 'LESOTO'                      , active: true)
Nationality.create!(id: 187, name: 'LIBIA,JAMAHIRIYA ÁRABE'      , active: true)
Nationality.create!(id: 188, name: 'MACAO'                       , active: true)
Nationality.create!(id: 189, name: 'MADAGASCAR'                  , active: true)
Nationality.create!(id: 190, name: 'MALDIVAS'                    , active: true)
Nationality.create!(id: 191, name: 'MALVINAS,ISLAS (FALKLAND)'   , active: true)
Nationality.create!(id: 192, name: 'MARIANAS DEL NORTE,ISLAS'    , active: true)
Nationality.create!(id: 193, name: 'MARSHALL,ISLAS'              , active: true)
Nationality.create!(id: 194, name: 'MAURICIO'                    , active: true)
Nationality.create!(id: 195, name: 'MAYOTTE'                     , active: true)
Nationality.create!(id: 196, name: 'MELILLA'                     , active: true)
Nationality.create!(id: 197, name: 'ISLAS MENORES DE EEUU'       , active: true)
Nationality.create!(id: 198, name: 'MICRONESIA,activeS FEDERADOS', active: true)
Nationality.create!(id: 199, name: 'MONGOLIA'                    , active: true)
Nationality.create!(id: 200, name: 'MONTSERRAT'                  , active: true)
Nationality.create!(id: 201, name: 'MYANMAR'                     , active: true)
Nationality.create!(id: 202, name: 'NAURU'                       , active: true)
Nationality.create!(id: 203, name: 'NAVIDAD,ISLA'                , active: true)
Nationality.create!(id: 204, name: 'NIGERIA'                     , active: true)
Nationality.create!(id: 205, name: 'NIUE'                        , active: true)
Nationality.create!(id: 206, name: 'NORFOLK,ISLA'                , active: true)
Nationality.create!(id: 207, name: 'NUEVA CALEDONIA'             , active: true)
Nationality.create!(id: 208, name: 'OCÉANO INDICO BRITÁNICO'     , active: true)
Nationality.create!(id: 209, name: 'PALAOS'                      , active: true)
Nationality.create!(id: 210, name: 'PITCAIRN'                    , active: true)
Nationality.create!(id: 211, name: 'POLINESIA FRANCESA'          , active: true)
Nationality.create!(id: 212, name: 'RUANDA'                      , active: true)
Nationality.create!(id: 213, name: 'SALOMÓN,ISLAS'               , active: true)
Nationality.create!(id: 214, name: 'SAMOA'                       , active: true)
Nationality.create!(id: 215, name: 'SAMOA AMERICANA'             , active: true)
Nationality.create!(id: 216, name: 'SAN CRISTÓBAL Y NIEVES'      , active: true)
Nationality.create!(id: 217, name: 'SAN PEDRO Y MIQUELÓN'        , active: true)
Nationality.create!(id: 218, name: 'SAN VICENTE Y LAS GRANADINAS', active: true)
Nationality.create!(id: 219, name: 'SANTA ELENA'                 , active: true)
Nationality.create!(id: 220, name: 'SANTA LUCÍA'                 , active: true)
Nationality.create!(id: 221, name: 'SANTA SEDE'                  , active: true)
Nationality.create!(id: 222, name: 'SANTO TOMÉ Y PRÍNCIPE'       , active: true)
Nationality.create!(id: 223, name: 'SEYCHELLES'                  , active: true)
Nationality.create!(id: 224, name: 'SIERRA LEONA'                , active: true)
Nationality.create!(id: 225, name: 'SOMALIA'                     , active: true)
Nationality.create!(id: 226, name: 'SURINAM'                     , active: true)
Nationality.create!(id: 227, name: 'TERRITORIO PALESTINO OCUPADO', active: true)
Nationality.create!(id: 228, name: 'TIERRAS AUSTRALES FRANCESAS' , active: true)
Nationality.create!(id: 229, name: 'TIMOR-LESTE'                 , active: true)
Nationality.create!(id: 230, name: 'TOGO'                        , active: true)
Nationality.create!(id: 231, name: 'TOKELAU'                     , active: true)
Nationality.create!(id: 232, name: 'TONGA'                       , active: true)
Nationality.create!(id: 233, name: 'TURCAS Y CAICOS,ISLAS'       , active: true)
Nationality.create!(id: 234, name: 'TUVALU'                      , active: true)
Nationality.create!(id: 235, name: 'VANUATU'                     , active: true)
Nationality.create!(id: 236, name: 'VIETNAMITA'                  , active: true)
Nationality.create!(id: 237, name: 'ISLAS VÍRGENES BRITÁNICAS'   , active: true)
Nationality.create!(id: 238, name: 'ISLAS VÍRGENES DE EEUU'      , active: true)
Nationality.create!(id: 239, name: 'WALLIS Y FUTUNA'             , active: true)
Nationality.create!(id: 240, name: 'YEMEN'                       , active: true)
Nationality.create!(id: 241, name: 'YIBUTI'                      , active: true)
Nationality.create!(id: 242, name: 'YUGOSLAVIA'                  , active: true)
Nationality.create!(id: 243, name: 'SERBIA,REPÚBLICA DE'         , active: true)
Nationality.create!(id: 244, name: 'MONTENEGRO,REPÚBLICA DE'     , active: true)
Nationality.create!(id: 999, name: 'NO IDENTIFICADO'             , active: true)



## academic_levels
puts "#{I18n.t('creating')} #{AcademicLevel.model_name.human}"

AcademicLevel.create!(id: 1  , name: '01-A Sin Estudios'                   , educational_type: 'A', active: true)
AcademicLevel.create!(id: 2  , name: '02-A EGB/Graduado Escolar'           , educational_type: 'A', active: true)
AcademicLevel.create!(id: 3  , name: '03-A BUP/Bachillerato'               , educational_type: 'A', active: true)
AcademicLevel.create!(id: 4  , name: '04-A FP'                             , educational_type: 'A', active: true)
AcademicLevel.create!(id: 5  , name: '05-A COU'                            , educational_type: 'A', active: true)
AcademicLevel.create!(id: 6  , name: '06-A Módulo Profesional'             , educational_type: 'A', active: true)
AcademicLevel.create!(id: 7  , name: '07-A Diplomado Universitario'        , educational_type: 'A', active: true)
AcademicLevel.create!(id: 8  , name: '08-A Licenciado Universitario'       , educational_type: 'A', active: true)
AcademicLevel.create!(id: 100, name: '100-N Educación Primaria'            , educational_type: 'N', active: true)
AcademicLevel.create!(id: 101, name: '101-N ESO Educación Secundaria'      , educational_type: 'N', active: true)
AcademicLevel.create!(id: 102, name: '102-N Bachillerato'                  , educational_type: 'N', active: true)
AcademicLevel.create!(id: 103, name: '103-N Ciclo Formativo Grado Medio'   , educational_type: 'N', active: true)
AcademicLevel.create!(id: 104, name: '104-N Ciclo Formativo Grado Superior', educational_type: 'N', active: true)
AcademicLevel.create!(id: 105, name: '105-N Diplomado Universitario'       , educational_type: 'N', active: true)
AcademicLevel.create!(id: 106, name: '106-N Licenciado Universitario'      , educational_type: 'N', active: true)
AcademicLevel.create!(id: 107, name: '107-N Doctorado Universitario'       , educational_type: 'N', active: true)
AcademicLevel.create!(id: 200, name: '200-N NS/NC'                         , educational_type: 'N', active: true)



## profiles
puts "#{I18n.t('creating')} #{Profile.model_name.human}"

Profile.create!(id: 1, name: 'ADMINISTRADOR', active: true)
Profile.create!(id: 2, name: 'TECNICO'      , active: true)
Profile.create!(id: 3, name: 'EMPRESA'      , active: true)
Profile.create!(id: 4, name: 'VOLUNTARIO'   , active: true)



## sectors
puts "#{I18n.t('creating')} #{Sector.model_name.human}"

Sector.create!(id: 1,  name: 'Discapacidad física',              active: true)
Sector.create!(id: 2,  name: 'Discapacidad psíquica',            active: true)
Sector.create!(id: 3,  name: 'Discapacidad sensorial',           active: true)
Sector.create!(id: 4,  name: 'Enfermos crónicos o degenerativos',active: true)
Sector.create!(id: 5,  name: 'Enfermos mentales',                active: true)
Sector.create!(id: 6,  name: 'Exclusión social',                 active: true)
Sector.create!(id: 7,  name: 'Minorías étnicas',                 active: true)
Sector.create!(id: 8,  name: 'Inmigración',                      active: true)
Sector.create!(id: 9,  name: 'Refugiados',                       active: true)
Sector.create!(id: 10, name: 'Reclusos y exreclusos',            active: true)
Sector.create!(id: 11, name: 'Sin hogar',                        active: true)
Sector.create!(id: 12, name: 'Juventud',                         active: true)
Sector.create!(id: 13, name: 'Infancia',                         active: true)
Sector.create!(id: 14, name: 'Mayores',                          active: true)
Sector.create!(id: 15, name: 'Mujeres',                          active: true)
Sector.create!(id: 16, name: 'Drogodependientes',                active: true)
Sector.create!(id: 17, name: 'Enfermos de SIDA',                 active: true)
Sector.create!(id: 18, name: 'Animales',                         active: true)
Sector.create!(id: 19, name: 'Indiferente',                      active: true)
Sector.create!(id: 20, name: 'Otros',                            active: true)



## statuses
puts "#{I18n.t('creating')} #{Status.model_name.human}"

Status.create!(id: 1 , name: 'Activo'                    , active: true)
Status.create!(id: 2 , name: 'Baja sin tramitar'         , active: true)
Status.create!(id: 3 , name: 'Derivado'                  , active: true)
Status.create!(id: 4 , name: 'Ilocalizable'              , active: true)
Status.create!(id: 5 , name: 'Ilocalizable temporalmente', active: true)
Status.create!(id: 6 , name: 'No disponible'             , active: true)
Status.create!(id: 7 , name: 'No Apto'                   , active: true)
Status.create!(id: 8 , name: 'Sin recurso'               , active: true)
Status.create!(id: 9 , name: 'Situacion CM'              , active: true)
Status.create!(id: 10, name: 'VOCNE'                     , active: true)



## managers
puts "#{I18n.t('creating')} #{Manager.model_name.human}"

Manager.create!(id: 1, name: 'TSV 1', alias_name: 'TSV 1', phone_number: '915880000', active: true, profile_id: 2)
Manager.create!(id: 2, name: 'TSV 2', alias_name: 'TSV 2', phone_number: '915880000', active: true, profile_id: 2)
Manager.create!(id: 3, name: 'TSV 3', alias_name: 'TSV 3', phone_number: '915880000', active: true, profile_id: 2)
Manager.create!(id: 4, name: 'TSV 4', alias_name: 'TSV 4', phone_number: '915880000', active: true, profile_id: 2)
Manager.create!(id: 5, name: 'TSV 5', alias_name: 'TSV 5', phone_number: '915880000', active: true, profile_id: 2)
Manager.create!(id: 6, name: 'TSV 6', alias_name: 'TSV 6', phone_number: '915880000', active: true, profile_id: 2)
Manager.create!(id: 7, name: 'TSV 7', alias_name: 'TSV 7', phone_number: '915880000', active: true, profile_id: 2)




## id_number_types
puts "#{I18n.t('creating')} #{IdNumberType.model_name.human}"

IdNumberType.create!(id: 1, name: 'DNI'      , active: true)
IdNumberType.create!(id: 2, name: 'CIF'      , active: true)
IdNumberType.create!(id: 3, name: 'NIE'      , active: true)
IdNumberType.create!(id: 4, name: 'PASAPORTE', active: true)
IdNumberType.create!(id: 5, name: 'OTROS'    , active: true)




## entity_types
puts "#{I18n.t('creating')} #{EntityType.model_name.human}"

EntityType.create!(id: 1, kind: 1, description: 'AYUNTAMIENTO MADRID',active: true)
EntityType.create!(id: 2, kind: 2, description: 'OTROS ORGANISMOS',   active: true)
EntityType.create!(id: 3, kind: 3, description: 'ENTIDAD',            active: true)
EntityType.create!(id: 4, kind: 4, description: 'EMPRESA',            active: true)




## tracking_types
puts "#{I18n.t('creating')} #{TrackingType.model_name.human}"

TrackingType.create!(id: 1,  name: 'Alta'                                           , active: true)
TrackingType.create!(id: 2,  name: 'Primera entrevista'                             , active: true)
TrackingType.create!(id: 3,  name: 'Derivación'                                     , active: true)
TrackingType.create!(id: 4,  name: 'Seguimientos individuales grado de satisfacción', active: true)
TrackingType.create!(id: 5,  name: 'Participación reuniones grupales'               , active: true)
TrackingType.create!(id: 6,  name: 'Notificaciones/avisos/incidencias'              , active: true)
TrackingType.create!(id: 7,  name: 'Reunión inicial'                                , active: true)
TrackingType.create!(id: 8,  name: 'Reunión seguimiento'                            , active: true)
TrackingType.create!(id: 9,  name: 'Reunión voluntarios'                            , active: true)
TrackingType.create!(id: 10, name: 'Cuestionarios satisfacción'                     , active: true)
TrackingType.create!(id: 11, name: 'Evaluación'                                     , active: true)
TrackingType.create!(id: 12, name: 'Seguimiento periódico rutinario'                , active: true)
TrackingType.create!(id: 13, name: 'Presentación de nuevo proyecto'                 , active: true)
TrackingType.create!(id: 14, name: 'Seguimiento de proyecto'                        , active: true)
TrackingType.create!(id: 15, name: 'Actualización de datos de contacto'             , active: true)
TrackingType.create!(id: 16, name: 'Incidencia'                                     , active: true)
TrackingType.create!(id: 17, name: 'Departamento Voluntariado'                      , active: true)
TrackingType.create!(id: 18, name: 'Otros'                                          , active: true)





## degrees
puts "#{I18n.t('creating')} #{Degree.model_name.human}"

Degree.create!(id: 1  , degree_type_id: 1 , name: 'Estadística'                                  , active: true)
Degree.create!(id: 2  , degree_type_id: 1 , name: 'Nutrición Humana y Dietética'                 , active: true)
Degree.create!(id: 3  , degree_type_id: 2 , name: 'Biblioteconomía y Documentación'              , active: true)
Degree.create!(id: 4  , degree_type_id: 2 , name: 'Ciencias Empresariales'                       , active: true)
Degree.create!(id: 5  , degree_type_id: 2 , name: 'Educación Social'                             , active: true)
Degree.create!(id: 6  , degree_type_id: 2 , name: 'Magisterio'                                   , active: true)
Degree.create!(id: 7  , degree_type_id: 2 , name: 'Gestión y Administración Pública'             , active: true)
Degree.create!(id: 8  , degree_type_id: 2 , name: 'Relaciones Laborales'                         , active: true)
Degree.create!(id: 9  , degree_type_id: 2 , name: 'Trabajo Social'                               , active: true)
Degree.create!(id: 10 , degree_type_id: 2 , name: 'Turismo'                                      , active: true)
Degree.create!(id: 11 , degree_type_id: 3 , name: 'Arquitecto Técnico'                           , active: true)
Degree.create!(id: 12 , degree_type_id: 3 , name: 'Ingeniero Técnico de Obras Públicas'          , active: true)
Degree.create!(id: 13 , degree_type_id: 3 , name: 'Ingeniero Técnico de Telecomunicaciones'      , active: true)
Degree.create!(id: 14 , degree_type_id: 3 , name: 'Ingeniero Técnico en Informática'             , active: true)
Degree.create!(id: 15 , degree_type_id: 4 , name: 'Enfermería'                                   , active: true)
Degree.create!(id: 16 , degree_type_id: 4 , name: 'Fisioterapia'                                 , active: true)
Degree.create!(id: 17 , degree_type_id: 4 , name: 'Logopedia'                                    , active: true)
Degree.create!(id: 18 , degree_type_id: 4 , name: 'Podología'                                    , active: true)
Degree.create!(id: 19 , degree_type_id: 4 , name: 'Terapia Ocupacional'                          , active: true)
Degree.create!(id: 20 , degree_type_id: 5 , name: 'Bellas Artes'                                 , active: true)
Degree.create!(id: 21 , degree_type_id: 5 , name: 'Filología Alemana'                            , active: true)
Degree.create!(id: 22 , degree_type_id: 5 , name: 'Filología Árabe'                              , active: true)
Degree.create!(id: 23 , degree_type_id: 5 , name: 'Filología Catalana'                           , active: true)
Degree.create!(id: 24 , degree_type_id: 5 , name: 'Filología Clásica'                            , active: true)
Degree.create!(id: 25 , degree_type_id: 5 , name: 'Filología Eslava'                             , active: true)
Degree.create!(id: 26 , degree_type_id: 5 , name: 'Filología Francesa'                           , active: true)
Degree.create!(id: 27 , degree_type_id: 5 , name: 'Filología Gallega'                            , active: true)
Degree.create!(id: 28 , degree_type_id: 5 , name: 'Filología Hebrea'                             , active: true)
Degree.create!(id: 29 , degree_type_id: 5 , name: 'Filología Hispánica'                          , active: true)
Degree.create!(id: 30 , degree_type_id: 5 , name: 'Filología Inglesa'                            , active: true)
Degree.create!(id: 31 , degree_type_id: 5 , name: 'Filología Italiana'                           , active: true)
Degree.create!(id: 32 , degree_type_id: 5 , name: 'Filología Portuguesa'                         , active: true)
Degree.create!(id: 33 , degree_type_id: 5 , name: 'Filología Románica'                           , active: true)
Degree.create!(id: 34 , degree_type_id: 5 , name: 'Filología Vasca'                              , active: true)
Degree.create!(id: 35 , degree_type_id: 5 , name: 'Filosofía'                                    , active: true)
Degree.create!(id: 36 , degree_type_id: 5 , name: 'Historia del Arte'                            , active: true)
Degree.create!(id: 37 , degree_type_id: 5 , name: 'Humanidades'                                  , active: true)
Degree.create!(id: 38 , degree_type_id: 5 , name: 'Traducción e Interpretación'                  , active: true)
Degree.create!(id: 39 , degree_type_id: 5 , name: 'Antropología Social y Cultural'               , active: true)
Degree.create!(id: 40 , degree_type_id: 6 , name: 'Biología'                                     , active: true)
Degree.create!(id: 41 , degree_type_id: 6 , name: 'Ciencias Ambientales'                         , active: true)
Degree.create!(id: 42 , degree_type_id: 6 , name: 'Física'                                       , active: true)
Degree.create!(id: 43 , degree_type_id: 6 , name: 'Geología'                                     , active: true)
Degree.create!(id: 44 , degree_type_id: 6 , name: 'Matemáticas'                                  , active: true)
Degree.create!(id: 45 , degree_type_id: 6 , name: 'Química'                                      , active: true)
Degree.create!(id: 46 , degree_type_id: 7 , name: 'Administración y Dirección de Empresas'       , active: true)
Degree.create!(id: 47 , degree_type_id: 7 , name: 'Ciencias de la Actividad Física y del Deporte', active: true)
Degree.create!(id: 48 , degree_type_id: 7 , name: 'Ciencias Políticas y de la Administración'    , active: true)
Degree.create!(id: 49 , degree_type_id: 7 , name: 'Comunicación Audiovisual'                     , active: true)
Degree.create!(id: 50 , degree_type_id: 7 , name: 'Derecho'                                      , active: true)
Degree.create!(id: 51 , degree_type_id: 7 , name: 'Economía'                                     , active: true)
Degree.create!(id: 52 , degree_type_id: 7 , name: 'Pedagogía'                                    , active: true)
Degree.create!(id: 53 , degree_type_id: 7 , name: 'Publicidad y Relaciones Públicas'             , active: true)
Degree.create!(id: 54 , degree_type_id: 7 , name: 'Estudios sociales'                            , active: true)
Degree.create!(id: 55 , degree_type_id: 7 , name: 'Documentación'                                , active: true)
Degree.create!(id: 56 , degree_type_id: 8 , name: 'Arquitectura'                                 , active: true)
Degree.create!(id: 57 , degree_type_id: 8 , name: 'Ingeniero Aeronáutico'                        , active: true)
Degree.create!(id: 58 , degree_type_id: 8 , name: 'Ingeniero Agrónomo'                           , active: true)
Degree.create!(id: 59 , degree_type_id: 8 , name: 'Ingeniero de Caminos Canales y Puertos'       , active: true)
Degree.create!(id: 60 , degree_type_id: 8 , name: 'Ingeniero de Telecomunicación'                , active: true)
Degree.create!(id: 61 , degree_type_id: 8 , name: 'Ingeniero en Informática'                     , active: true)
Degree.create!(id: 62 , degree_type_id: 8 , name: 'Ingeniero en Electrónica'                     , active: true)
Degree.create!(id: 63 , degree_type_id: 9 , name: 'Farmacia'                                     , active: true)
Degree.create!(id: 64 , degree_type_id: 9 , name: 'Medicina'                                     , active: true)
Degree.create!(id: 65 , degree_type_id: 9 , name: 'Odontología'                                  , active: true)
Degree.create!(id: 66 , degree_type_id: 9 , name: 'Veterinaria'                                  , active: true)
Degree.create!(id: 67 , degree_type_id: 10, name: 'Monitor Ocio y Tiempo Libre'                  , active: true)
Degree.create!(id: 68 , degree_type_id: 10, name: 'Masajista'                                    , active: true)
Degree.create!(id: 69 , degree_type_id: 10, name: 'Técnico Integración Social'                   , active: true)
Degree.create!(id: 70 , degree_type_id: 10, name: 'Talleres Manualidades'                        , active: true)
Degree.create!(id: 71 , degree_type_id: 10, name: 'Actividades Deportivas'                       , active: true)
Degree.create!(id: 72 , degree_type_id: 10, name: 'Terápias Alternativas'                        , active: true)
Degree.create!(id: 73 , degree_type_id: 10, name: 'Artistas'                                     , active: true)
Degree.create!(id: 74 , degree_type_id: 1 , name: 'Oceanografía'                                 , active: true)
Degree.create!(id: 75 , degree_type_id: 1 , name: 'Gemología'                                    , active: true)
Degree.create!(id: 76 , degree_type_id: 1 , name: 'Óptica'                                       , active: true)
Degree.create!(id: 77 , degree_type_id: 2 , name: 'Periodismo'                                   , active: true)
Degree.create!(id: 78 , degree_type_id: 2 , name: 'Contabilidad'                                 , active: true)
Degree.create!(id: 79 , degree_type_id: 2 , name: 'Técnico Comercial'                            , active: true)
Degree.create!(id: 80 , degree_type_id: 2 , name: 'Comunicación y Relaciones Públicas'           , active: true)
Degree.create!(id: 81 , degree_type_id: 2 , name: 'Administración y Finanzas'                    , active: true)
Degree.create!(id: 82 , degree_type_id: 2 , name: 'Marketing y Publicidad'                       , active: true)
Degree.create!(id: 83 , degree_type_id: 2 , name: 'Ciencias del Trabajo'                         , active: true)
Degree.create!(id: 84 , degree_type_id: 2 , name: 'Relaciones Internacionales'                   , active: true)
Degree.create!(id: 85 , degree_type_id: 2 , name: 'Ciencias de la Información'                   , active: true)
Degree.create!(id: 86 , degree_type_id: 2 , name: 'Educación Infantil'                           , active: true)
Degree.create!(id: 87 , degree_type_id: 3 , name: 'Ingeniero Técnico Industrial'                 , active: true)
Degree.create!(id: 88 , degree_type_id: 3 , name: 'Ingeniero Técnico en Topografía'              , active: true)
Degree.create!(id: 89 , degree_type_id: 3 , name: 'Ingeniero Técnico en Alimentos'               , active: true)
Degree.create!(id: 90 , degree_type_id: 3 , name: 'Ingeniero Técnico Forestal'                   , active: true)
Degree.create!(id: 91 , degree_type_id: 3 , name: 'Grado en Edificación'                         , active: true)
Degree.create!(id: 92 , degree_type_id: 3 , name: 'Perito Industrial'                            , active: true)
Degree.create!(id: 93 , degree_type_id: 4 , name: 'Psicología'                                   , active: true)
Degree.create!(id: 94 , degree_type_id: 4 , name: 'Psiquiatría'                                  , active: true)
Degree.create!(id: 95 , degree_type_id: 4 , name: 'Sociología'                                   , active: true)
Degree.create!(id: 96 , degree_type_id: 4 , name: 'Psicopedagogía'                               , active: true)
Degree.create!(id: 97 , degree_type_id: 4 , name: 'Anatomía Patológica'                          , active: true)
Degree.create!(id: 98 , degree_type_id: 5 , name: 'Lengua y Literatura'                          , active: true)
Degree.create!(id: 99 , degree_type_id: 5 , name: 'Geografía e Historia'                         , active: true)
Degree.create!(id: 100, degree_type_id: 5 , name: 'Geografía'                                    , active: true)
Degree.create!(id: 101, degree_type_id: 5 , name: 'Historia'                                     , active: true)
Degree.create!(id: 102, degree_type_id: 5 , name: 'Idiomas'                                      , active: true)
Degree.create!(id: 103, degree_type_id: 5 , name: 'Estudios de Asia Oriental'                    , active: true)
Degree.create!(id: 104, degree_type_id: 5 , name: 'Arqueología'                                  , active: true)
Degree.create!(id: 105, degree_type_id: 10, name: 'Arte Dramático'                               , active: true)
Degree.create!(id: 106, degree_type_id: 10, name: 'Música'                                       , active: true)
Degree.create!(id: 107, degree_type_id: 10, name: 'Animador Sociocultural'                       , active: true)
Degree.create!(id: 999, degree_type_id: 10, name: 'Otros'                                        , active: true)




## employment_statuses
puts "#{I18n.t('creating')} #{EmploymentStatus.model_name.human}"

EmploymentStatus.create!(id: 1, name: 'Trabajando',        active: true)
EmploymentStatus.create!(id: 2, name: 'Estudiando',        active: true)
EmploymentStatus.create!(id: 3, name: 'Jubilado/a',        active: true)
EmploymentStatus.create!(id: 4, name: 'Labores domésticas',active: true)
EmploymentStatus.create!(id: 5, name: 'Desempleado/a',     active: true)
EmploymentStatus.create!(id: 6, name: 'Otra situación',    active: true)




## language_levels
puts "#{I18n.t('creating')} #{LanguageLevel.model_name.human}"

LanguageLevel.create!(id: 1, name: 'Básico'         , active: true)
LanguageLevel.create!(id: 2, name: 'Intermedio'     , active: true)
LanguageLevel.create!(id: 3, name: 'Alto'           , active: true)
LanguageLevel.create!(id: 4, name: 'Bilingüe'       , active: true)
LanguageLevel.create!(id: 5, name: 'Nativo'         , active: true)
LanguageLevel.create!(id: 6, name: 'No especificado', active: true)




## contact_results
puts "#{I18n.t('creating')} #{ContactResult.model_name.human}"

ContactResult.create!(id: 1, name: 'No localizado', active: true)
ContactResult.create!(id: 2, name: 'No disponible', active: true)
ContactResult.create!(id: 3, name: 'No acepta'    , active: true)




## contact_types
puts "#{I18n.t('creating')} #{ContactType.model_name.human}"

ContactType.create!(id: 1, name: 'Presencial'        , active: true)
ContactType.create!(id: 2, name: 'Telefónico'        , active: true)
ContactType.create!(id: 3, name: 'Correo electrónico', active: true)
ContactType.create!(id: 4, name: 'Mensaje SMS'       , active: true)




## traits
puts "#{I18n.t('creating')} #{Trait.model_name.human}"

Trait.create!(id: 1, name: 'Empatía'                    , active: true)
Trait.create!(id: 2, name: 'Adaptabilidad a los cambios', active: true)
Trait.create!(id: 3, name: 'Trabajo en equipo'          , active: true)
Trait.create!(id: 4, name: 'Asunción de normas'         , active: true)
Trait.create!(id: 5, name: 'Dinamismo'                  , active: true)
Trait.create!(id: 6, name: 'Liderazgo positivo'         , active: true)
Trait.create!(id: 7, name: 'Conducta disruptiva'        , active: true)
Trait.create!(id: 8, name: 'Capacidad de acogida'       , active: true)
Trait.create!(id: 9, name: 'Otros'                      , active: true)




## info_sources
puts "#{I18n.t('creating')} #{InfoSource.model_name.human}"

InfoSource.create!(id: 1, name: 'Internet'                          , active: true)
InfoSource.create!(id: 2, name: 'Plataforma Virtual'                , active: true)
InfoSource.create!(id: 3, name: 'Amigos/conocidos'                  , active: true)
InfoSource.create!(id: 4, name: 'Otros voluntarios'                 , active: true)
InfoSource.create!(id: 5, name: 'Redes Sociales'                    , active: true)
InfoSource.create!(id: 6, name: 'Medios de comunicación'            , active: true)
InfoSource.create!(id: 7, name: 'Acciones de Voluntarios Por Madrid', active: true)
InfoSource.create!(id: 8, name: 'Otros'                             , active: true)



puts "#{I18n.t('creating')} admin user"
User.first_or_create!(
  login: 'admin',
  email: 'admin@madrid.es',
  password: 'Wordpass1',
  password_confirmation: 'Wordpass1',
  loggable: Manager.first_or_create!(name: 'admin'),
  notice_type: NoticeType.all.sample
)

puts "#{I18n.t('creating')} manager user"
user = User.first_or_create!(
  login: 'manager',
  email: 'manager@madrid.es',
  password: 'Wordpass1',
  password_confirmation: 'Wordpass1',
  loggable: Manager.first_or_create!(name: 'manager'),
  notice_type: NoticeType.all.sample
)
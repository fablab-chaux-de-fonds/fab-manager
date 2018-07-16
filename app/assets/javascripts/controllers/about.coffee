'use strict'

Application.Controllers.controller "AboutController", ['$scope', 'Setting', 'CustomAsset', ($scope, Setting, CustomAsset)->

  ### PUBLIC SCOPE ###

  Setting.get { name: 'about_title'}, (data)->
    $scope.aboutTitle = data.setting

  Setting.get { name: 'about_body'}, (data)->
    $scope.aboutBody = data.setting

  Setting.get { name: 'about_contacts'}, (data)->
    $scope.aboutContacts = data.setting

  # retrieve the CGU
  CustomAsset.get {name: 'cgu-file'}, (cgu) ->
    $scope.cgu = cgu.custom_asset

  # retrieve the CGV
  CustomAsset.get {name: 'cgv-file'}, (cgv) ->
    $scope.cgv = cgv.custom_asset

  initialize = ->
    $scope.what_is_a_fablab = {
      title: 'Qu’est ce qu’un fablab?',
      content: [
        'Contraction de ‘Laboratoire de Fabrication‘, les FabLabs sont un réseau mondial de laboratoires locaux qui mutualisent un ensemble de ressources permettant à chacun de fabriquer à peu près tout ce que l’on veut et de diffuser des connaissances, des savoir-faire et des projets.',
        ],
      link_url: 'http://www.fabfoundation.org/index.php/the-fab-charter/index.html',
      link_body: 'Voir la charte',
      }

    $scope.fablab_chaux_de_fonds = {
      title: 'Le FabLab La Chaux-de-Fonds',
      content: [
        'Logé au coeur des Montagnes neuchâteloises, le FabLab La Chaux-de-Fonds est organisé en association et jouit d’un espace du plus de 200m2 en plein centre ville.',
        'Nous sommes heureux de pouvoir également vous proposer, en plus des éléments de base qui composent un fablab, des équipements plus “conventionnels” tels qu’un atelier de mécanique ainsi qu’un atelier pour travailler le bois.',
        'Les locaux ont été pensé dans le but que les divers projets puissent se réaliser de A à Z agréablement, tant autant au niveau de la diversité des équipements que de leur agencement.',
        ],
      }

    $scope.how_to = {
      title: 'Comment cela se passe concrètement ?',
      content : [
        'Le FabLab est disponible pour un public de tout âge et de toute culture, comme ressource communautaire et a une vocation d’éducation par la réalisation. Très rapidement les membres gagnent de l’indépendance vis-à-vis des technologies qu’ils apprennent à maîtriser. Ainsi ils peuvent transmettre leurs connaissances aux nouveaux utilisateurs et deviennent de réels acteurs animant le lieu.',
        'Chaque utilisateur prend soin du lieu et de ses infrastructures, participe à son entretien et contribue à la capitalisation des acquis en partageant ses connaissances, compétences et en documentant ses travaux.',
        'Une participation financière raisonnable est demandée pour l’utilisation des machines, des équipements et pour certains ateliers ou formations spécifiques. Et, si vous le souhaitez, vous pouvez devenir membre de l’association et la soutenir au travers d’une cotisation annuelle qui permettra, entre autre, d’assumer les charges fixes.',
      ],
    }

    $scope.conclusion = {
      content : [
        'On se réjouit de vous rencontrer dès le 1er septembre dans nos locaux à la Chaux-de-Fonds ! Dès cette date, un calendrier avec des horaires d’ouverture sera en ligne.',
      ],
    }

  ## !!! MUST BE CALLED AT THE END of the controller
  initialize()


]




exports.getIndex = (req, res, next) => {
    res.render('cliente/index', {
      titulo: 'SOOS - Sistema Online Ordem Serviço',
    });
  };

exports.getLogin = (req, res, next) =>{
  res.render('cliente/login', {
    titulo: 'Cliente Login',
  });
  };

  exports.getLoginColaborador = (req, res, next) =>{
    res.render('colaborador/login', {
      titulo: 'Colaborador Login',
    });
  };
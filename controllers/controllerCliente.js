


exports.getIndex = (req, res, next) => {
    res.render('cliente/index', {
      titulo: 'SOOS - Pagina do cliente',
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
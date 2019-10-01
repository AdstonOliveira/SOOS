


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

 
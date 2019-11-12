exports.getLogin = (req, res, next) =>{
    res.render('colaborador/login', {
      titulo: 'Colaborador Login',
    });
  };

  exports.getIndex = (req, res, next) =>{
    res.render('colaborador/index', {
    });
  };
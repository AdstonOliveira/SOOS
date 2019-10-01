exports.getLogin = (req, res, next) =>{
    res.render('colaborador/login', {
      titulo: 'Colaborador Login',
    });
  };
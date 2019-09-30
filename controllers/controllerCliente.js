


exports.getIndex = (req, res, next) => {
    res.render('cliente/index', {
      titulo: 'SOOS - Sistema Online Ordem Serviço',
    });
  };
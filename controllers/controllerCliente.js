


exports.getIndex = (req, res, next) => {
    res.render('cliente/index', {
      titulo: 'SOOS - Pagina do cliente',
    });
  };
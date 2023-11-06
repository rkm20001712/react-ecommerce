'use strict';
module.exports = (sequelize, DataTypes) => {
  const Address = sequelize.define('Address', {
    fullname: DataTypes.STRING,
    phone: DataTypes.STRING,
    orderId: DataTypes.INTEGER,
    custId: DataTypes.INTEGER,
    discrict: DataTypes.STRING,
    city: DataTypes.STRING,
    states: DataTypes.STRING,
    area: DataTypes.STRING,
    shipping: DataTypes.TEXT,
    StreetAddress: DataTypes.TEXT
  }, {});
  Address.associate = function(models) {
    // associations can be defined here
    models.Address.belongsTo(models.Order, { foreignKey: 'orderId' });  
         
  };
  return Address;
};
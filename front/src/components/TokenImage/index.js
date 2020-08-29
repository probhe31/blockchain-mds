import React from "react";
import PropTypes from "prop-types";

const IMAGE_SIZE = 100;

const TokenImage = ({ nameCat, dnaCat, size }) => {
  const gradId = `${nameCat}${dnaCat}`.replace(/#/g, "");
  const imageSize = size || IMAGE_SIZE;

  //const colors = ["#add5d2","#ecd1eb","#f7bc56","#fcfc95", "#f4a792", "#b1b1be"];
  const body = dnaCat.substring(0, 2) % 6 + 1;
  const eye = dnaCat.substring(2, 4) % 4 + 1;
  const mouth = dnaCat.substring(2, 4) % 5 + 1;
  
  
  const bodyImg = "bodies/bodyk"+body+".svg"
  const eyeImg = "eyes/eye"+eye+".svg"
  const mouthImg = "mouths/mouth"+mouth+".svg"

  
  const eyeStyle = {
    position : 'absolute',
    left : '67px',
    top: '35px'
  };

  const mouthStyle = {
    position : 'absolute',
    left : '67px',
    top: '35px'
  };

  return (
    <div>
      <img src={bodyImg} width = '300px' height = '300px' ></img>
      <img src={eyeImg} width = '300px' height = '300px' style={eyeStyle}></img>
      <img src={mouthImg} width = '300px' height = '300px' style={mouthStyle}></img>
    </div>
    

  );
};

TokenImage.propTypes = {
  nameCat: PropTypes.string.isRequired,
  dnaCat: PropTypes.string.isRequired,
  size: PropTypes.number
};

export default TokenImage;

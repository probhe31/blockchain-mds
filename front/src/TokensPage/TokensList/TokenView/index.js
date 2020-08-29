import React from "react";
import { PropTypes as MobxPropTypes } from "mobx-react";
import TokenImage from "components/TokenImage";
import "./TokenView.css";

const TokenView = ({ token }) => (
  <div>
    <div className="TokenView-image_wrapper">
      <TokenImage size={200} nameCat={token[0]} dnaCat={token[1]} />
    </div>
    <div className="TokenView-label">{`${token[0]} – ${token[1]}`}</div>
  </div>
);

TokenView.propTypes = {
  token: MobxPropTypes.arrayOrObservableArray
};

export default TokenView;

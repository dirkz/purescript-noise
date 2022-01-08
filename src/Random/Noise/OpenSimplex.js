"strict";

const noise = require('open-simplex-noise');

exports._makeNoise2D = function(seed) {
    return noise.makeNoise2D(seed);
};

exports._makeNoise3D = function(seed) {
    return noise.makeNoise3D(seed);
};

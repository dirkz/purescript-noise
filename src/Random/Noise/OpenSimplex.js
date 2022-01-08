"strict";

const noise = require('open-simplex-noise');

exports._makeNoise2D = function(seed) {
    return noise.makeNoise2D(seed);
};

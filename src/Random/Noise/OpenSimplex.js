const {Noise} = require('open-simplex-noise');

exports._makeNoise2D = function(seed) {
    return Noise.makeNoise2D(seed);
};

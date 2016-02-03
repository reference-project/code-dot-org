var msg = require('./locale');
var api = require('./apiJavascript.js');

var COLOR_LIGHT_GREEN = '#D3E965';
var COLOR_BLUE = '#19C3E1';
var COLOR_RED = '#F78183';
var COLOR_CYAN = '#4DD0E1';
var COLOR_YELLOW = '#FFF176';
var COLOR_PINK = '#F57AC6';
var COLOR_PURPLE = '#BB77C7';
var COLOR_GREEN = '#68D995';
var COLOR_WHITE = '#FFFFFF';
var COLOR_BLUE = '#64B5F6';
var COLOR_ORANGE = '#FFB74D';

module.exports.blocks = [
  // Game Lab
  {func: 'loadImage', category: 'Game Lab', blockPrefix: 'var img = loadImage', paletteParams: ['url'], params: ['"https://code.org/images/logo.png"'] },
  {func: 'image', category: 'Game Lab', paletteParams: ['image','srcX','srcY','srcW','srcH','x','y'], params: ["img", "0", "0", "img.width", "img.height", "0", "0"] },
  {func: 'fill', category: 'Game Lab', paletteParams: ['color'], params: ["'yellow'"] },
  {func: 'noFill', category: 'Game Lab' },
  {func: 'stroke', category: 'Game Lab', paletteParams: ['color'], params: ["'blue'"] },
  {func: 'noStroke', category: 'Game Lab' },
  {func: 'arc', category: 'Game Lab', paletteParams: ['x','y','w','h','start','stop'], params: ["0", "0", "800", "800", "0", "HALF_PI"] },
  {func: 'ellipse', category: 'Game Lab', paletteParams: ['x','y','w','h'], params: ["200", "200", "400", "400"] },
  {func: 'line', category: 'Game Lab', paletteParams: ['x1','y1','x2','y2'], params: ["0", "0", "400", "400"] },
  {func: 'point', category: 'Game Lab', paletteParams: ['x','y'], params: ["200", "200"] },
  {func: 'rect', category: 'Game Lab', paletteParams: ['x','y','w','h'], params: ["100", "100", "200", "200"] },
  {func: 'triangle', category: 'Game Lab', paletteParams: ['x1','y1','x2','y2','x3','y3'], params: ["200", "0", "0", "400", "400", "400"] },
  {func: 'text', category: 'Game Lab', paletteParams: ['str','x','y','w','h'], params: ["'text'", "0", "0", "400", "100"] },
  {func: 'textSize', category: 'Game Lab', paletteParams: ['pixels'], params: ["12"] },
  {func: 'drawSprites', category: 'Game Lab' },
  {func: 'allSprites', category: 'Game Lab', block: 'allSprites', type: 'property' },
  {func: 'background', category: 'Game Lab', paletteParams: ['color'], params: ["'black'"] },
  {func: 'width', category: 'Game Lab', type: 'property' },
  {func: 'height', category: 'Game Lab', type: 'property' },
  {func: 'camera', category: 'Game Lab', type: 'property' },
  {func: 'camera.on', category: 'Game Lab' },
  {func: 'camera.off', category: 'Game Lab' },
  {func: 'camera.active', category: 'Game Lab', type: 'property' },
  {func: 'camera.mouseX', category: 'Game Lab', type: 'property' },
  {func: 'camera.mouseY', category: 'Game Lab', type: 'property' },
  {func: 'camera.position.x', category: 'Game Lab', type: 'property' },
  {func: 'camera.position.y', category: 'Game Lab', type: 'property' },
  {func: 'camera.zoom', category: 'Game Lab', type: 'property' },

  // Sprites
  {func: 'createSprite', category: 'Sprites', blockPrefix: 'var sprite = createSprite', paletteParams: ['x','y','width','height'], params: ["200", "200", "30", "30"], type: 'both' },
  {func: 'sprite.setSpeed', category: 'Sprites', paletteParams: ['speed','angle'], params: ["1", "90"], modeOptionName: '*.setSpeed' },
  {func: 'sprite.getAnimationLabel', category: 'Sprites', modeOptionName: '*.getAnimationLabel', type: 'value' },
  {func: 'sprite.getDirection', category: 'Sprites', modeOptionName: '*.getDirection', type: 'value' },
  {func: 'sprite.getSpeed', category: 'Sprites', modeOptionName: '*.getSpeed', type: 'value' },
  {func: 'sprite.remove', category: 'Sprites', modeOptionName: '*.remove' },
  {func: 'sprite.addAnimation', category: 'Sprites', paletteParams: ['label','animation'], params: ['"anim1"', "anim"], modeOptionName: '*.addAnimation' },
  {func: 'sprite.addImage', category: 'Sprites', paletteParams: ['label','image'], params: ['"img1"', "img"], modeOptionName: '*.addImage' },
  {func: 'sprite.addSpeed', category: 'Sprites', paletteParams: ['speed','angle'], params: ["1", "90"], modeOptionName: '*.addSpeed' },
  {func: 'sprite.addToGroup', category: 'Sprites', paletteParams: ['group'], params: ["group"], modeOptionName: '*.addToGroup' },
  {func: 'sprite.changeAnimation', category: 'Sprites', paletteParams: ['label'], params: ['"anim1"'], modeOptionName: '*.changeAnimation' },
  {func: 'sprite.changeImage', category: 'Sprites', paletteParams: ['label'], params: ['"img1"'], modeOptionName: '*.changeImage' },
  {func: 'sprite.attractionPoint', category: 'Sprites', paletteParams: ['speed','x','y'], params: ["1", "200", "200"], modeOptionName: '*.attractionPoint' },
  {func: 'sprite.limitSpeed', category: 'Sprites', paletteParams: ['max'], params: ["3"], modeOptionName: '*.limitSpeed' },
  {func: 'sprite.setCollider', category: 'Sprites', paletteParams: ['type','x','y','w','h'], params: ['"rectangle"', "0", "0", "20", "20"], modeOptionName: '*.setCollider' },
  {func: 'sprite.setVelocity', category: 'Sprites', paletteParams: ['x','y'], params: ["1", "1"], modeOptionName: '*.setVelocity' },
  {func: 'sprite.height', category: 'Sprites', modeOptionName: '*.height', type: 'property' },
  {func: 'sprite.width', category: 'Sprites', modeOptionName: '*.width', type: 'property' },
  {func: 'sprite.animation', category: 'Sprites', modeOptionName: '*.animation', type: 'property' },
  {func: 'sprite.depth', category: 'Sprites', modeOptionName: '*.depth', type: 'property' },
  {func: 'sprite.friction', category: 'Sprites', modeOptionName: '*.friction', type: 'property' },
  {func: 'sprite.immovable', category: 'Sprites', modeOptionName: '*.immovable', type: 'property' },
  {func: 'sprite.life', category: 'Sprites', modeOptionName: '*.life', type: 'property' },
  {func: 'sprite.mass', category: 'Sprites', modeOptionName: '*.mass', type: 'property' },
  {func: 'sprite.maxSpeed', category: 'Sprites', modeOptionName: '*.maxSpeed', type: 'property' },
  {func: 'sprite.position', category: 'Sprites', modeOptionName: '*.position', type: 'property' },
  {func: 'sprite.previousPosition', category: 'Sprites', modeOptionName: '*.previousPosition', type: 'property' },
  {func: 'sprite.removed', category: 'Sprites', modeOptionName: '*.removed', type: 'property' },
  {func: 'sprite.restitution', category: 'Sprites', modeOptionName: '*.restitution', type: 'property' },
  {func: 'sprite.rotateToDirection', category: 'Sprites', modeOptionName: '*.rotateToDirection', type: 'property' },
  {func: 'sprite.rotation', category: 'Sprites', modeOptionName: '*.rotation', type: 'property' },
  {func: 'sprite.rotationSpeed', category: 'Sprites', modeOptionName: '*.rotationSpeed', type: 'property' },
  {func: 'sprite.scale', category: 'Sprites', modeOptionName: '*.scale', type: 'property' },
  {func: 'sprite.shapeColor', category: 'Sprites', modeOptionName: '*.shapeColor', type: 'property' },
  {func: 'sprite.touching', category: 'Sprites', modeOptionName: '*.touching', type: 'property' },
  {func: 'sprite.velocity', category: 'Sprites', modeOptionName: '*.velocity', type: 'property' },
  {func: 'sprite.visible', category: 'Sprites', modeOptionName: '*.visible', type: 'property' },
/* TODO: decide whether to expose these Sprite properties:
camera
collider - USEFUL? (marshal AABB and CircleCollider)
debug
groups
mouseActive
mouseIsOver
mouseIsPressed
originalHeight
originalWidth
*/

/* TODO: decide whether to expose these Sprite methods:
addImage(labelimg) - 1 param version: (sets label to "normal" automatically)
bounce(targetcallback) - CALLBACK
collide(targetcallback) - CALLBACK
displace(targetcallback) - CALLBACK
draw() - OVERRIDE and/or USEFUL?
mirrorX(dir) - USEFUL?
mirrorY(dir) - USEFUL?
overlap(targetcallback) - CALLBACK
overlapPixel(pointXpointY) - USEFUL?
overlapPoint(pointXpointY) - USEFUL?
update() - USEFUL?
*/

  // Animations
  {func: 'loadAnimation', category: 'Animations', blockPrefix: 'var anim = loadAnimation', paletteParams: ['url1','url2'], params: ['"http://p5play.molleindustria.org/examples/assets/ghost_standing0001.png"', '"http://p5play.molleindustria.org/examples/assets/ghost_standing0002.png"'] },
  {func: 'animation', category: 'Animations', paletteParams: ['animation','x','y'], params: ["anim", "50", "50"] },
  {func: 'anim.changeFrame', category: 'Animations', paletteParams: ['frame'], params: ["0"], modeOptionName: '*.changeFrame' },
  {func: 'anim.nextFrame', category: 'Animations', modeOptionName: '*.nextFrame' },
  {func: 'anim.previousFrame', category: 'Animations', modeOptionName: '*.previousFrame' },
  {func: 'anim.clone', category: 'Animations', modeOptionName: '*.clone', type: 'value' },
  {func: 'anim.getFrame', category: 'Animations', modeOptionName: '*.getFrame', type: 'value' },
  {func: 'anim.getLastFrame', category: 'Animations', modeOptionName: '*.getLastFrame', type: 'value' },
  {func: 'anim.goToFrame', category: 'Animations', paletteParams: ['frame'], params: ["1"], modeOptionName: '*.goToFrame' },
  {func: 'anim.play', category: 'Animations', modeOptionName: '*.play' },
  {func: 'anim.rewind', category: 'Animations', modeOptionName: '*.rewind' },
  {func: 'anim.stop', category: 'Animations', modeOptionName: '*.stop' },
  {func: 'anim.frameChanged', category: 'Animations', modeOptionName: '*.frameChanged', type: 'property' },
  {func: 'anim.frameDelay', category: 'Animations', modeOptionName: '*.frameDelay', type: 'property' },
  {func: 'anim.images', category: 'Animations', modeOptionName: '*.images', type: 'property' },
  {func: 'anim.looping', category: 'Animations', modeOptionName: '*.looping', type: 'property' },
  {func: 'anim.playing', category: 'Animations', modeOptionName: '*.playing', type: 'property' },
  {func: 'anim.visible', category: 'Animations', modeOptionName: '*.visible', type: 'property' },
/* TODO: decide whether to expose these Animation methods:
draw(xy)
getFrameImage()
getHeight()
getImageAt(frame)
getWidth()
*/

  // Groups
  {func: 'Group', blockPrefix: 'var group = new Group', category: 'Groups', type: 'both' },
  {func: 'group.add', category: 'Groups', paletteParams: ['sprite'], params: ["sprite"], modeOptionName: '*.add' },
  {func: 'group.remove', category: 'Groups', paletteParams: ['sprite'], params: ["sprite"], modeOptionName: '*.remove' },
  {func: 'group.clear', category: 'Groups', modeOptionName: '*.clear' },
  {func: 'group.contains', category: 'Groups', paletteParams: ['sprite'], params: ["sprite"], modeOptionName: '*.contains', type: 'value' },
  {func: 'group.get', category: 'Groups', paletteParams: ['i'], params: ["0"], modeOptionName: '*.get', type: 'value' },
  {func: 'group.maxDepth', category: 'Groups', modeOptionName: '*.maxDepth', type: 'value' },
  {func: 'group.minDepth', category: 'Groups', modeOptionName: '*.minDepth', type: 'value' },

/* TODO: decide whether to expose these Group methods:
bounce(targetcallback) - CALLBACK
displace(targetcallback) - CALLBACK
draw() - USEFUL?
overlap(targetcallback) - CALLBACK
*/

  // Events
  {func: 'keyIsPressed', category: 'Events', type: 'property' },
  {func: 'key', category: 'Events', type: 'property' },
  {func: 'keyCode', category: 'Events', type: 'property' },
  {func: 'keyDown', paletteParams: ['code'], params: ["UP_ARROW"], category: 'Events', type: 'value' },
  {func: 'keyWentDown', paletteParams: ['code'], params: ["UP_ARROW"], category: 'Events', type: 'value' },
  {func: 'keyWentUp', paletteParams: ['code'], params: ["UP_ARROW"], category: 'Events', type: 'value' },
  {func: 'keyPressed', block: 'function keyPressed() {}', expansion: 'function keyPressed() {\n  __;\n}', category: 'Events' },
  {func: 'keyReleased', block: 'function keyReleased() {}', expansion: 'function keyReleased() {\n  __;\n}', category: 'Events' },
  {func: 'keyTyped', block: 'function keyTyped() {}', expansion: 'function keyTyped() {\n  __;\n}', category: 'Events' },
  {func: 'mouseX', category: 'Events', type: 'property' },
  {func: 'mouseY', category: 'Events', type: 'property' },
  {func: 'pmouseX', category: 'Events', type: 'property' },
  {func: 'pmouseY', category: 'Events', type: 'property' },
  {func: 'mouseButton', category: 'Events', type: 'property' },
  {func: 'mouseIsPressed', category: 'Events', type: 'property' },
  {func: 'mouseMoved', block: 'function mouseMoved() {}', expansion: 'function mouseMoved() {\n  __;\n}', category: 'Events' },
  {func: 'mouseDragged', block: 'function mouseDragged() {}', expansion: 'function mouseDragged() {\n  __;\n}', category: 'Events' },
  {func: 'mousePressed', block: 'function mousePressed() {}', expansion: 'function mousePressed() {\n  __;\n}', category: 'Events' },
  {func: 'mouseReleased', block: 'function mouseReleased() {}', expansion: 'function mouseReleased() {\n  __;\n}', category: 'Events' },
  {func: 'mouseClicked', block: 'function mouseClicked() {}', expansion: 'function mouseClicked() {\n  __;\n}', category: 'Events' },
  {func: 'mouseWheel', block: 'function mouseWheel() {}', expansion: 'function mouseWheel() {\n  __;\n}', category: 'Events' },

  // Advanced
  {func: 'foo', parent: api, category: 'Advanced' },
];

module.exports.categories = {
  'Game Lab': {
    color: 'yellow',
    rgb: COLOR_YELLOW,
    blocks: []
  },
  Sprites: {
    color: 'red',
    rgb: COLOR_RED,
    blocks: []
  },
  Animations: {
    color: 'red',
    rgb: COLOR_RED,
    blocks: []
  },
  Groups: {
    color: 'red',
    rgb: COLOR_RED,
    blocks: []
  },
  Data: {
    color: 'lightgreen',
    rgb: COLOR_LIGHT_GREEN,
    blocks: []
  },
  Drawing: {
    color: 'cyan',
    rgb: COLOR_CYAN,
    blocks: []
  },
  Events: {
    color: 'green',
    rgb: COLOR_GREEN,
    blocks: []
  },
  Advanced: {
    color: 'blue',
    rgb: COLOR_BLUE,
    blocks: []
  },
};

module.exports.showParamDropdowns = true;

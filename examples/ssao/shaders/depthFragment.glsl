#ifdef GL_ES
precision highp float;
#endif

uniform vec3 uC;

vec4 encodeFloatRGBA( float v ) {
   vec4 enc = vec4(1.0, 255.0, 65025.0, 16581375.0) * v;
   enc = fract(enc);
   enc -= enc.yzww * vec4(1.0/255.0,1.0/255.0,1.0/255.0,0.0);
   return enc;
}

void main( void ) {
   
   	float d = gl_FragCoord.z;

   	// Converts depth value to camera space
   	float zC = uC.x / (d * uC.y + uC.z);
   
   	gl_FragColor = encodeFloatRGBA(zC);
}
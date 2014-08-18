uniform sampler2D tex0;
varying vec2 tcoord;
varying vec4 color;

	//the normalized eye space normal
varying vec3 v_ecNormal;

	
	float brightness = 2.0;
    const vec3 direction = vec3(0.4,0.8,0);
    vec3 halfplane;
    const vec4 ambientColor = vec4(1,1,1,1);
    const vec4 diffuseColor = vec4(1,0.93,0.67,1);
    const vec4 specularColor = vec4(1,1,1,1);


// struct Material {
    const vec4 ambientFactor = vec4(0.2,0.2,0.2,1);
    const vec4 diffuseFactor = vec4(1,1,1,1);
    const vec4 specularFactor = vec4(0.5,0.5,0.5,1);
    const float shininess = 1.0;
// };

varying vec3 eye;

void main() { 

	vec3 _direction = normalize(direction);
	vec3 _eye = normalize(eye);
	vec3 h = normalize(_direction + _eye);
	halfplane = h;

    // Normalize v_ecNormal
    vec3 ecNormal = v_ecNormal / length(v_ecNormal);

    float ecNormalDotLightDirection = max(0.0, dot(ecNormal, _direction));
    float ecNormalDotLightHalfplane = max(0.0, dot(ecNormal, halfplane));

    	// Calculate ambient light
    vec4 ambientLight = ambientColor * ambientFactor;

    	// Calculate diffuse light
    vec4 diffuseLight = ecNormalDotLightDirection * diffuseColor * diffuseFactor;

    	// Calculate specular light
    vec4 specularLight = vec4(0.0);
    if (ecNormalDotLightHalfplane > 0.0) {
        specularLight = pow(ecNormalDotLightHalfplane, shininess) * specularColor * specularFactor;
    } 

    vec4 light = (ambientLight + diffuseLight + specularLight) * brightness;

    gl_FragColor = vec4((light * texture2D(tex0, tcoord)).rgb,1.0);
}
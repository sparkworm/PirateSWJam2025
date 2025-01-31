shader_type canvas_item;

uniform sampler2D noise;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR.b = 1.0-1.5*UV.y;
	//COLOR *= 0.75;
	vec3 cloud = texture(noise, UV).rgb;
	if (cloud.r > 0.5) {
		COLOR.rgb += max(cloud * 1.0-UV.y,0);
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}

void main(
  float2 in v_TexCoord : TEXCOORD0,
	float4 in v_Extra : COLOR,
	float4 out Color : COLOR,
	uniform float u_Center,
	uniform float u_Amount,
	uniform sampler2D s_Texture : TEXUNIT0
) {
 float amount;
 float minOffs, maxOffs;
 float offsX, offsY;
 float4 blurred;
 
 float stepSize = 0.004;
 float steps = 3;
 
 amount = pow((v_TexCoord.y * u_Center) * 2 - 1, 2.0) * u_Amount;
 
 minOffs = (float(steps-1)) / -2.0;
 maxOffs = (float(steps-1)) / 2.0;
 offsX = minOffs;
 offsY = minOffs;
 
 blurred = float4(0.0, 0.0, 0.0, 1.0);
 
 for (offsX = minOffs; offsX <= maxOffs; offsX++) {
  for (offsY = minOffs; offsY <= maxOffs; offsY++) {
   float2 texCoord = v_TexCoord.xy;
 
   texCoord.x += offsX * amount * stepSize;
   texCoord.y += offsY * amount * stepSize;
   blurred += tex2D(s_Texture, texCoord);
  }
 }
 
 blurred /= float(steps * steps);
 
 Color = blurred;
}
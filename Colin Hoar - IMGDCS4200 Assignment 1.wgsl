@fragment 
fn fs( @builtin(position) pos : vec4f ) -> @location(0) vec4f {
  var p     = uvN( pos.xy );
	p.x += sin( seconds() ) * .25;
	p.y += cos( seconds() ) * .25;
  let tiled = fract( p * 10. );

  let circles   = distance( tiled, vec2(.5) );
  let threshold = smoothstep( .25,.275, circles );
	let feedback = lastframe( uvN( pos.xy ));
	var out = circles + feedback * .5 + threshold * .4;

  return vec4f( 1. - out.r, 1. - out.g, 1. - out.b, 1. );
}

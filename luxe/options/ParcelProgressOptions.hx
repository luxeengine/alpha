package luxe.options;

import luxe.Color;
import luxe.Parcel;

import phoenix.Texture;

typedef ParcelProgressOptions = {

    oncomplete : Parcel -> Void,
    parcel : Parcel,

    ?fade_in : Bool,
    ?fade_out : Bool,
    ?fade_time : Float,
    ?bar : Color,
    ?bar_border : Color,
    ?background : Color,    
    ?texture : Texture

} //ParcelProgressOptions

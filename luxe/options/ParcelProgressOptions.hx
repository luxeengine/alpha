package luxe.options;

import luxe.Color;
import luxe.Parcel;

typedef ParcelProgressOptions = {

    oncomplete : Parcel -> Void,
    parcel : Parcel,

    ?no_visuals: Bool,
    ?fade_in: Bool,
    ?fade_out: Bool,
    ?fade_time: Float,
    ?bar: Color,
    ?bar_border: Color,
    ?background: Color

} //ParcelProgressOptions

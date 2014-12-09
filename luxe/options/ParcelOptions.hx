package luxe.options;

import luxe.resource.Resource;
import luxe.Parcel;

typedef ParcelOptions = {
    ? sequential : Bool,
    ? threaded : Bool,
    ? silent : Bool,
    ? load_spacing : Float,
    ? start_spacing : Float,
    ? oncomplete : Parcel->Void,
    ? onprogress : Resource->Void
}

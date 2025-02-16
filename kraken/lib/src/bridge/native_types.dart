import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'from_native.dart';

// representation of JSContext
class JSCallbackContext extends Struct {}

typedef Native_GetUserAgent = Pointer<Utf8> Function(Pointer<NativeKrakenInfo>);
typedef Dart_GetUserAgent = Pointer<Utf8> Function(Pointer<NativeKrakenInfo>);

class NativeKrakenInfo extends Struct {
  Pointer<Utf8> app_name;
  Pointer<Utf8> app_version;
  Pointer<Utf8> app_revision;
  Pointer<Utf8> system_name;
  Pointer<NativeFunction<Native_GetUserAgent>> getUserAgent;
}

class NativeEvent extends Struct {
  Pointer<NativeString> type;

  @Int64()
  int bubbles;

  @Int64()
  int cancelable;

  @Int64()
  int timeStamp;

  @Int64()
  int defaultPrevented;

  Pointer target;

  Pointer currentTarget;
}

class NativeInputEvent extends Struct {
  Pointer<NativeEvent> nativeEvent;
  Pointer<NativeString> inputType;
  Pointer<NativeString> data;
}

class NativeMediaErrorEvent extends Struct {
  Pointer<NativeEvent> nativeEvent;

  @Int64()
  int code;

  Pointer<NativeString> message;
}

class NativeMessageEvent extends Struct {
  Pointer<NativeEvent> nativeEvent;

  Pointer<NativeString> data;
  Pointer<NativeString> origin;
}

class NativeCustomEvent extends Struct {
  Pointer<NativeEvent> nativeEvent;

  Pointer<NativeString> detail;
}

class NativeGestureEvent extends Struct {
  Pointer<NativeEvent> nativeEvent;

  Pointer<NativeString> state;

  Pointer<NativeString> direction;

  @Double()
  double deltaX;

  @Double()
  double deltaY;

  @Double()
  double velocityX;

  @Double()
  double velocityY;

  @Double()
  double scale;

  @Double()
  double rotation;
}

class NativeCloseEvent extends Struct {
  Pointer<NativeEvent> nativeEvent;

  @Int64()
  int code;

  Pointer<NativeString> reason;

  @Int64()
  int wasClean;
}

class NativeIntersectionChangeEvent extends Struct {
  Pointer<NativeEvent> nativeEvent;

  @Double()
  double intersectionRatio;
}

class NativeTouchEvent extends Struct {
  Pointer<NativeEvent> nativeEvent;

  Pointer<Pointer<NativeTouch>> touches;
  @Int64()
  int touchLength;

  Pointer<Pointer<NativeTouch>> targetTouches;

  @Int64()
  int targetTouchesLength;

  Pointer<Pointer<NativeTouch>> changedTouches;

  @Int64()
  int changedTouchesLength;

  @Int64()
  int altKey;

  @Int64()
  int metaKey;

  @Int64()
  int ctrlKey;

  @Int64()
  int shiftKey;
}

class NativeTouch extends Struct {
  @Int64()
  int identifier;

  Pointer<NativeEventTarget> target;

  @Double()
  double clientX;

  @Double()
  double clientY;

  @Double()
  double screenX;

  @Double()
  double screenY;

  @Double()
  double pageX;

  @Double()
  double pageY;

  @Double()
  double radiusX;

  @Double()
  double radiusY;

  @Double()
  double rotationAngle;

  @Double()
  double force;

  @Double()
  double altitudeAngle;

  @Double()
  double azimuthAngle;

  @Int64()
  int touchType;
}

class NativeBoundingClientRect extends Struct {
  @Double()
  double x;

  @Double()
  double y;

  @Double()
  double width;

  @Double()
  double height;

  @Double()
  double top;

  @Double()
  double right;

  @Double()
  double bottom;

  @Double()
  double left;
}

typedef Native_DispatchEvent = Void Function(
    Pointer<NativeEventTarget> nativeEventTarget, Pointer<NativeString> eventType, Pointer<Void> nativeEvent, Int32 isCustomEvent);
typedef Dart_DispatchEvent = void Function(
    Pointer<NativeEventTarget> nativeEventTarget, Pointer<NativeString> eventType, Pointer<Void> nativeEvent, int isCustomEvent);

class NativeEventTarget extends Struct {
  Pointer<Void> instance;
  Pointer<NativeFunction<Native_DispatchEvent>> dispatchEvent;
}

class NativeNode extends Struct {
  Pointer<NativeEventTarget> nativeEventTarget;
}

typedef Native_GetViewModuleProperty = Double Function(Pointer<NativeElement> nativeElement, Int64 property);
typedef Native_GetBoundingClientRect = Pointer<NativeBoundingClientRect> Function(Pointer<NativeElement> nativeElement);
typedef Native_GetStringValueProperty = Pointer<NativeString> Function(Pointer<NativeElement> nativeElement, Pointer<NativeString> property);
typedef Native_Click = Void Function(Pointer<NativeElement> nativeElement);
typedef Native_Scroll = Void Function(Pointer<NativeElement> nativeElement, Int32 x, Int32 y);
typedef Native_ScrollBy = Void Function(Pointer<NativeElement> nativeElement, Int32 x, Int32 y);
typedef Native_SetViewModuleProperty = Void Function(Pointer<NativeElement> nativeElement, Int64 property, Double value);

class NativeElement extends Struct {
  Pointer<NativeNode> nativeNode;

  Pointer<NativeFunction<Native_GetViewModuleProperty>> getViewModuleProperty;
  Pointer<NativeFunction<Native_SetViewModuleProperty>> setViewModuleProperty;
  Pointer<NativeFunction<Native_GetBoundingClientRect>> getBoundingClientRect;
  Pointer<NativeFunction<Native_GetStringValueProperty>> getStringValueProperty;
  Pointer<NativeFunction<Native_Click>> click;
  Pointer<NativeFunction<Native_Scroll>> scroll;
  Pointer<NativeFunction<Native_ScrollBy>> scrollBy;
}

typedef Native_Open = Void Function(Pointer<NativeWindow> nativeWindow,Pointer<NativeString> url);

class NativeWindow extends Struct {
  Pointer<NativeEventTarget> nativeEventTarget;
  Pointer<NativeFunction<Native_Open>> open;
}

class NativeDocument extends Struct {
  Pointer<NativeNode> nativeNode;
}

class NativeTextNode extends Struct {
  Pointer<NativeNode> nativeNode;
}

class NativeCommentNode extends Struct {
  Pointer<NativeNode> nativeNode;
}

class NativeAnchorElement extends Struct {
  Pointer<NativeElement> nativeElement;
}

typedef GetImageWidth = Double Function(Pointer<NativeImgElement> nativePtr);
typedef GetImageHeight = Double Function(Pointer<NativeImgElement> nativePtr);
typedef GetImageNaturalWidth = Double Function(Pointer<NativeImgElement> nativePtr);
typedef GetImageNaturalHeight = Double Function(Pointer<NativeImgElement> nativePtr);

typedef GetInputWidth = Double Function(Pointer<NativeInputElement> nativePtr);
typedef GetInputHeight = Double Function(Pointer<NativeInputElement> nativePtr);
typedef InputElementMethodVoidCallback = Void Function(Pointer<NativeInputElement> nativePtr);

class NativeImgElement extends Struct {
  Pointer<NativeElement> nativeElement;

  Pointer<NativeFunction<GetImageWidth>> getImageWidth;
  Pointer<NativeFunction<GetImageHeight>> getImageHeight;
  Pointer<NativeFunction<GetImageNaturalWidth>> getImageNaturalWidth;
  Pointer<NativeFunction<GetImageNaturalHeight>> getImageNaturalHeight;
}

class NativeObjectElement extends Struct {
  Pointer<NativeElement> nativeElement;
}

class NativeInputElement extends Struct {
  Pointer<NativeElement> nativeElement;

  Pointer<NativeFunction<GetInputWidth>> getInputWidth;
  Pointer<NativeFunction<GetInputHeight>> getInputHeight;
  Pointer<NativeFunction<InputElementMethodVoidCallback>> focus;
  Pointer<NativeFunction<InputElementMethodVoidCallback>> blur;
}

typedef Native_CanvasGetContext = Pointer<NativeCanvasRenderingContext2D> Function(
    Pointer<NativeCanvasElement> nativeCanvasElement, Pointer<NativeString> contextId);

class NativeCanvasElement extends Struct {
  Pointer<NativeElement> nativeElement;
  Pointer<NativeFunction<Native_CanvasGetContext>> getContext;
}

typedef Native_RenderingContextSetFont = Void Function(Pointer<NativeCanvasRenderingContext2D> nativePtr, Pointer<NativeString> font);
typedef Native_RenderingContextSetFillStyle = Void Function(Pointer<NativeCanvasRenderingContext2D> nativePtr, Pointer<NativeString> fillStyle);
typedef Native_RenderingContextSetStrokeStyle = Void Function(Pointer<NativeCanvasRenderingContext2D> nativePtr, Pointer<NativeString> strokeStyle);
typedef Native_RenderingContextFillRect = Void Function(Pointer<NativeCanvasRenderingContext2D> nativePtr, Double x, Double y, Double width, Double height);
typedef Native_RenderingContextClearRect = Void Function(Pointer<NativeCanvasRenderingContext2D> nativePtr, Double x, Double y, Double width, Double height);
typedef Native_RenderingContextStrokeRect = Void Function(Pointer<NativeCanvasRenderingContext2D> nativePtr, Double x, Double y, Double width, Double height);
typedef Native_RenderingContextFillText = Void Function(Pointer<NativeCanvasRenderingContext2D> nativePtr, Pointer<NativeString> text, Double x, Double y, Double maxWidth);
typedef Native_RenderingContextStrokeText = Void Function(Pointer<NativeCanvasRenderingContext2D> nativePtr, Pointer<NativeString> text, Double x, Double y, Double maxWidth);
typedef Native_RenderingContextSave = Void Function(Pointer<NativeCanvasRenderingContext2D> nativePtr);
typedef Native_RenderingContextRestore = Void Function(Pointer<NativeCanvasRenderingContext2D> nativePtr);

class NativeCanvasRenderingContext2D extends Struct {
  Pointer<NativeFunction<Native_RenderingContextSetFont>> setFont;
  Pointer<NativeFunction<Native_RenderingContextSetFillStyle>> setFillStyle;
  Pointer<NativeFunction<Native_RenderingContextSetStrokeStyle>> setStrokeStyle;
  Pointer<NativeFunction<Native_RenderingContextFillRect>> fillRect;
  Pointer<NativeFunction<Native_RenderingContextClearRect>> clearRect;
  Pointer<NativeFunction<Native_RenderingContextStrokeRect>> strokeRect;
  Pointer<NativeFunction<Native_RenderingContextFillText>> fillText;
  Pointer<NativeFunction<Native_RenderingContextStrokeText>> strokeText;
  Pointer<NativeFunction<Native_RenderingContextSave>> save;
  Pointer<NativeFunction<Native_RenderingContextRestore>> restore;
}

class NativePerformanceEntry extends Struct {
  Pointer<Utf8> name;
  Pointer<Utf8> entryType;

  @Double()
  double startTime;
  @Double()
  double duration;
}

class NativePerformanceEntryList extends Struct {
  Pointer<Uint64> entries;

  @Int32()
  int length;
}

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
    Pointer<NativeEventTarget> nativeEventTarget, Pointer<NativeString> eventType, Pointer<Void> nativeEvent);
typedef Dart_DispatchEvent = void Function(
    Pointer<NativeEventTarget> nativeEventTarget, Pointer<NativeString> eventType, Pointer<Void> nativeEvent);

class NativeEventTarget extends Struct {
  Pointer<Void> instance;
  Pointer<NativeFunction<Native_DispatchEvent>> dispatchEvent;
}

class NativeNode extends Struct {
  Pointer<NativeEventTarget> nativeEventTarget;
}

typedef Native_GetOffsetTop = Double Function(Pointer<NativeElement> nativeElement);
typedef Native_GetOffsetLeft = Double Function(Pointer<NativeElement> nativeElement);
typedef Native_GetOffsetWidth = Double Function(Pointer<NativeElement> nativeElement);
typedef Native_GetOffsetHeight = Double Function(Pointer<NativeElement> nativeElement);
typedef Native_GetClientWidth = Double Function(Pointer<NativeElement> nativeElement);
typedef Native_GetClientHeight = Double Function(Pointer<NativeElement> nativeElement);
typedef Native_GetClientTop = Double Function(Pointer<NativeElement> nativeElement);
typedef Native_GetClientLeft = Double Function(Pointer<NativeElement> nativeElement);
typedef Native_GetScrollLeft = Double Function(Pointer<NativeElement> nativeElement);
typedef Native_GetScrollTop = Double Function(Pointer<NativeElement> nativeElement);
typedef Native_GetScrollWidth = Double Function(Pointer<NativeElement> nativeElement);
typedef Native_GetScrollHeight = Double Function(Pointer<NativeElement> nativeElement);
typedef Native_GetBoundingClientRect = Pointer<NativeBoundingClientRect> Function(Pointer<NativeElement> nativeElement);
typedef Native_Click = Void Function(Pointer<NativeElement> nativeElement);
typedef Native_Scroll = Void Function(Pointer<NativeElement> nativeElement, Int32 x, Int32 y);
typedef Native_ScrollBy = Void Function(Pointer<NativeElement> nativeElement, Int32 x, Int32 y);
typedef Native_SetScrollLeft = Void Function(Pointer<NativeElement> nativeElement, Double left);
typedef Native_SetScrollTop = Void Function(Pointer<NativeElement> nativeElement, Double top);

class NativeElement extends Struct {
  Pointer<NativeNode> nativeNode;

  Pointer<NativeFunction<Native_GetOffsetTop>> getOffsetTop;
  Pointer<NativeFunction<Native_GetOffsetLeft>> getOffsetLeft;
  Pointer<NativeFunction<Native_GetOffsetWidth>> getOffsetWidth;
  Pointer<NativeFunction<Native_GetOffsetHeight>> getOffsetHeight;
  Pointer<NativeFunction<Native_GetOffsetWidth>> getClientWidth;
  Pointer<NativeFunction<Native_GetOffsetHeight>> getClientHeight;
  Pointer<NativeFunction<Native_GetClientTop>> getClientTop;
  Pointer<NativeFunction<Native_GetClientLeft>> getClientLeft;
  Pointer<NativeFunction<Native_GetScrollTop>> getScrollTop;
  Pointer<NativeFunction<Native_GetScrollLeft>> getScrollLeft;
  Pointer<NativeFunction<Native_GetScrollWidth>> getScrollWidth;
  Pointer<NativeFunction<Native_GetScrollHeight>> getScrollHeight;
  Pointer<NativeFunction<Native_GetBoundingClientRect>> getBoundingClientRect;
  Pointer<NativeFunction<Native_Click>> click;
  Pointer<NativeFunction<Native_Scroll>> scroll;
  Pointer<NativeFunction<Native_ScrollBy>> scrollBy;
  Pointer<NativeFunction<Native_SetScrollLeft>> setScrollLeft;
  Pointer<NativeFunction<Native_SetScrollTop>> setScrollTop;
}

class NativeWindow extends Struct {
  Pointer<NativeEventTarget> nativeEventTarget;
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

typedef Native_IframePostMessage = Void Function(Pointer<NativeIframeElement> nativePtr, Pointer<NativeString> message);

class NativeIframeElement extends Struct {
  Pointer<NativeElement> nativeElement;

  Pointer<NativeFunction<Native_IframePostMessage>> postMessage;
}

typedef GetImageWidth = Double Function(Pointer<NativeImgElement> nativePtr);
typedef GetImageHeight = Double Function(Pointer<NativeImgElement> nativePtr);

class NativeImgElement extends Struct {
  Pointer<NativeElement> nativeElement;

  Pointer<NativeFunction<GetImageWidth>> getImageWidth;
  Pointer<NativeFunction<GetImageHeight>> getImageHeight;
}

class NativeObjectElement extends Struct {
  Pointer<NativeElement> nativeElement;
}

typedef Native_PlayMedia = Void Function(Pointer<NativeMediaElement> nativeMediaElement);
typedef Native_PauseMedia = Void Function(Pointer<NativeMediaElement> nativeMediaElement);
typedef Native_FastSeek = Void Function(Pointer<NativeMediaElement> nativeMediaElement, Double duration);

class NativeMediaElement extends Struct {
  Pointer<NativeElement> nativeElement;

  Pointer<NativeFunction<Native_PlayMedia>> play;
  Pointer<NativeFunction<Native_PauseMedia>> pause;
  Pointer<NativeFunction<Native_FastSeek>> fastSeek;
}

class NativeAudioElement extends Struct {
  Pointer<NativeMediaElement> nativeMediaElement;
}

class NativeVideoElement extends Struct {
  Pointer<NativeMediaElement> nativeMediaElement;
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

typedef Native_PlayAnimation = Void Function(
    Pointer<NativeAnimationElement> nativePtr, Pointer<NativeString> name, Double mix, Double mixSeconds);

class NativeAnimationElement extends Struct {
  Pointer<NativeElement> nativeElement;

  Pointer<NativeFunction<Native_PlayAnimation>> play;
}
